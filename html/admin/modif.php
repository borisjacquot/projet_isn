<?php  
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');
# $bdd = new PDO('mysql:host=mysql.hostinger.fr;dbname=u154661693_gamus;charset=utf8', 'u154661693_admin', 'admin51');

if (!isset($_SESSION['admin']) || $_SESSION['admin'] != 1) {
	exit();
}

if (isset($_GET['id']) && $_GET['id'] > 0) {
	$getid = intval($_GET['id']);
	$requser = $bdd->prepare('SELECT * FROM membres WHERE id = ?');
	$requser->execute(array($getid));
	$userinfo = $requser->fetch();
if (isset($userinfo['id'])) {

	if(isset($_POST['newpseudo']) && !empty($_POST['newpseudo']) && $_POST['newpseudo'] != $userinfo['pseudo']){

		$checkpseudo = $bdd->prepare("SELECT * FROM membres WHERE pseudo = ?");
		$checkpseudo->execute(array($newpseudo));
		$pseudoexist = $checkpseudo->rowCount();

		if ($pseudoexist == 0) {
			$newpseudo = htmlspecialchars($_POST['newpseudo']);
			$insertpseudo = $bdd->prepare("UPDATE membres SET pseudo = ? WHERE id =?");
			$insertpseudo->execute(array($newpseudo, $userinfo['id']));
			header("Location: modif.php?id=" . $userinfo['id']);
		}
		else {
			$msg = "Ce pseudo est déjà utilisé";
		}

	}

	if(isset($_POST['newmail']) && !empty($_POST['newmail']) && $_POST['newmail'] != $userinfo['mail']){

		$checkemail = $bdd->prepare("SELECT * FROM membres WHERE mail = ?");
		$checkemail->execute(array($newmail));
		$mailexist = $checkemail->rowCount();

		if ($mailexist == 0) {
			$newmail = htmlspecialchars($_POST['newmail']);
			$insertmail = $bdd->prepare("UPDATE membres SET mail = ? WHERE id =?");
			$insertmail->execute(array($newmail, $userinfo['id']));
			header("Location: modif.php?id=" . $userinfo['id']);
		}
		else {
			$msg = "Cet email est déjà utilisé";
		}

	}

	if(isset($_POST['newmdp']) && !empty($_POST['newmdp']) && isset($_POST['newmdp2']) && !empty($_POST['newmdp2'])){

		$mdp1 = sha1($_POST['newmdp']);
		$mdp2 = sha1($_POST['newmdp2']);

		if ($mdp1 == $mdp2) {
			$insertmdp = $bdd->prepare("UPDATE membres SET motdepasse = ? WHERE id = ?");
			$insertmdp->execute(array($mdp1, $userinfo['id']));
			header("Location: modif.php?id=" . $userinfo['id']);
		}
		else {
			$msg = "Vos deux mots de passe ne correspondent pas";
		}

	}

	if (isset($_FILES['avatar']) && !empty($_FILES['avatar']['name'])) {
		$taillemax = 2097152;
		$extension = array('jpg', 'jpeg', 'gif', 'png');

		if ($_FILES['avatar']['size'] <= $taillemax) {
			$extensionupload = strtolower(substr(strrchr($_FILES['avatar']['name'], '.'), 1));

			if (in_array($extensionupload, $extension)) {
				$chemin = "../membres/avatars/" . $userinfo['id'] . "." . $extensionupload;
				$check = move_uploaded_file($_FILES['avatar']['tmp_name'], $chemin);
				if ($check) {
					$updateava = $bdd->prepare('UPDATE membres SET avatar = :avatar WHERE id = :id');
					$updateava->execute(array(
						'avatar' => $userinfo['id'] . "." . $extensionupload,
						'id' => $userinfo['id']
						));
					header("Location: modif.php?id=" . $userinfo['id']);
				}
				else {
					$msg = "Erreur";
				}
			}
			else {
				$msg = "Le format de votre avatar n'est pas autorisé";
			}
		}
		else {
			$msg = "Votre avatar ne doit pas dépasser 2Mo";
		}
	}

?>


<html>
<head>
	<title>Administration</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="../css/font-awesome.min.css" />
</head>
<body>

<div class="header" style="background-image: url(../img/gplay.png);">Administration</div>

<div class="nav">

	<div class="profil" style="background-image: url(../img/gplay.png);">
		<div class="avatar" style="background-image:url(../membres/avatars/<?php echo $_SESSION['avatar']; ?>); background-size: cover;"></div><div class="nom"><b><?php echo $_SESSION['pseudo']; ?></b></div>
	</div>
	<ul>
		<li>
			<a href="index.php">
				<span><i class="fa fa-tachometer" aria-hidden="true"></i></span>
				<span>Dashboard</span>
			</a>
		</li>
		<li>
			<a href="jeux.php">
				<span><i class="fa fa-wrench" aria-hidden="true"></i></span>
				<span>Réglages</span>
			</a>
		</li>
		<li class="active">
			<a href="modif.php">
				<span><i class="fa fa-address-book" aria-hidden="true"></i></span>
				<span>Membres</span>
			</a>
		</li>
		<li>
			<a href="#">
				<span><i class="fa fa-trophy" aria-hidden="true"></i></span>
				<span>Concours</span>
			</a>
		</li>
		<li>
			<a href="#">
				<span><i class="fa fa-cogs" aria-hidden="true"></i></span>
				<span>Statut du site</span>
			</a>
		</li>
		<li>
			<a href="/">
				<span><i class="fa fa-power-off" aria-hidden="true"></i></span>
				<span>Retour au site</span>
			</a>
		</li>
	</ul>
</div>


<div class="contenu">

	<h1>Modifier le membre <u><?php echo $userinfo['pseudo']; ?></u></h1>
	
	<form method="POST" enctype="multipart/form-data">
			<input type="text" name="newpseudo" placeholder="Pseudo" value="<?php echo $userinfo['pseudo']; ?>">
			<input type="email" name="newmail" placeholder="Nouvelle adresse e-mail" value="<?php echo $userinfo['mail']; ?>">
			<input type="password" name="newmdp" placeholder="Nouveau mot de passe">
			<input type="password" name="newmdp2" placeholder="Répéter le mot de passe">
			<input type="file" name="avatar"><br />
			<input type="submit" name="valider" value="Modifier le profil" id="valider">
	</form>
	<?php 
		if (isset($msg)) { 
			echo '<div class="alerte"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' . $msg . '</div>'; 
		} 
	?>
	
</div>


</body>
</html>

<?php
}
else {
?>

<h1>Modifier un membre</h1>

<?php 

	if (isset($_POST['valider']) && !empty($_POST['idmodif'])) {
		header("Location: modif.php?id=" . $_POST['idmodif']);
	}

?>

<form method="POST">
	<label>ID : </label><input type="text" name="idmodif"><input type="submit" name="valider">
</form>

<?php
} 
} 
else {
?>

<html>
<head>
	<title>Administration</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="../css/font-awesome.min.css" />
</head>
<body>

<div class="header" style="background-image: url(../img/gplay.png);">Administration</div>

<div class="nav">

	<div class="profil" style="background-image: url(../img/gplay.png);">
		<div class="avatar" style="background-image:url(../membres/avatars/<?php echo $_SESSION['avatar']; ?>); background-size: cover;"></div><div class="nom"><b><?php echo $_SESSION['pseudo']; ?></b></div>
	</div>
	<ul>
		<li>
			<a href="index.php">
				<span><i class="fa fa-tachometer" aria-hidden="true"></i></span>
				<span>Dashboard</span>
			</a>
		</li>
		<li>
			<a href="#">
				<span><i class="fa fa-wrench" aria-hidden="true"></i></span>
				<span>Réglages</span>
			</a>
		</li>
		<li class="active">
			<a href="membre.php">
				<span><i class="fa fa-address-book" aria-hidden="true"></i></span>
				<span>Membres</span>
			</a>
		</li>
		<li>
			<a href="#">
				<span><i class="fa fa-trophy" aria-hidden="true"></i></span>
				<span>Concours</span>
			</a>
		</li>
		<li>
			<a href="#">
				<span><i class="fa fa-cogs" aria-hidden="true"></i></span>
				<span>Statut du site</span>
			</a>
		</li>
		<li>
			<a href="/">
				<span><i class="fa fa-power-off" aria-hidden="true"></i></span>
				<span>Retour au site</span>
			</a>
		</li>
	</ul>
</div>


<div class="contenu">

	
	<h1>Modifier un membre</h1>

	<?php 

		if (isset($_POST['valider']) && !empty($_POST['idmodif'])) {
			header("Location: modif.php?id=" . $_POST['idmodif']);
		}

	?>

	<form method="POST">
		<label>ID : </label><input type="text" name="idmodif"><input type="submit" name="valider">
	</form>

</div>


</body>
</html>

<?php
}
?>