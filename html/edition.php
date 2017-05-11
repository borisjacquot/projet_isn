<!DOCTYPE html>

<?php 
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');

if (isset($_SESSION['id'])) {
	$requser = $bdd->prepare("SELECT * FROM membres WHERE id = ?");
	$requser->execute(array($_SESSION['id']));
	$user = $requser->fetch();

	if(isset($_POST['newpseudo']) && !empty($_POST['newpseudo']) && $_POST['newpseudo'] != $user['pseudo']){

		$checkpseudo = $bdd->prepare("SELECT * FROM membres WHERE pseudo = ?");
		$checkpseudo->execute(array($newpseudo));
		$pseudoexist = $checkpseudo->rowCount();

		if ($pseudoexist == 0) {
			$newpseudo = htmlspecialchars($_POST['newpseudo']);
			$insertpseudo = $bdd->prepare("UPDATE membres SET pseudo = ? WHERE id =?");
			$insertpseudo->execute(array($newpseudo, $_SESSION['id']));
			header("Location: membre.php?id=" . $_SESSION['id']);
		}
		else {
			$msg = "Ce pseudo est déjà utilisé";
		}

	}

	if(isset($_POST['newmail']) && !empty($_POST['newmail']) && $_POST['newmail'] != $user['mail']){

		$checkemail = $bdd->prepare("SELECT * FROM membres WHERE mail = ?");
		$checkemail->execute(array($newmail));
		$mailexist = $checkemail->rowCount();

		if ($mailexist == 0) {
			$newmail = htmlspecialchars($_POST['newmail']);
			$insertmail = $bdd->prepare("UPDATE membres SET mail = ? WHERE id =?");
			$insertmail->execute(array($newmail, $_SESSION['id']));
			header("Location: membre.php?id=" . $_SESSION['id']);
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
			$insertmdp->execute(array($mdp1, $_SESSION['id']));
			header("Location: membre.php?id=" . $_SESSION['id']);
		}
		else {
			$msg = "Vos deux mots de passe ne correspondent pas";
		}

	}

	if (isset($_FILES['avatar']) && !empty($_FILES['avatar']['name'])) {
		$taillemax = 2097152;
		
		
		if ($user['admin'] == 1) {
			$extension = array('jpg', 'jpeg', 'gif', 'png');
		}
		else {
			$extension = array('jpg', 'jpeg', 'png');
		}

		if ($_FILES['avatar']['size'] <= $taillemax) {
			$extensionupload = strtolower(substr(strrchr($_FILES['avatar']['name'], '.'), 1));

			if (in_array($extensionupload, $extension)) {
				$chemin = "membres/avatars/" . $_SESSION['id'] . "." . $extensionupload;
				$check = move_uploaded_file($_FILES['avatar']['tmp_name'], $chemin);
				if ($check) {
					$updateava = $bdd->prepare('UPDATE membres SET avatar = :avatar WHERE id = :id');
					$updateava->execute(array(
						'avatar' => $_SESSION['id'] . "." . $extensionupload,
						'id' => $_SESSION['id']
						));
					header("Location: membre.php?id=" . $_SESSION['id']);
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
		<meta charset="utf-8" />
		<title>Editer mon profil</title>
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
	</head>

	<body background="img/bg.jpg" style="background-attachment:fixed;">

		<!-- NAV -->
		<div class="header" style="background-image: url('img/gplay.png');">
			<div class="container">

				<div class="titre">
					<h1><a href="#">GamUs</a></h1>
				</div>

				<div class="nav">
					<ul>
						<li><a href="index.php">Accueil</a></li>
						<li><a href="login.php">Jeux</a></li>
						<li><a href="classement.php">Classements</a></li>
						<li><a href="auteurs.php">Auteurs</a></li>
						<?php 
							if (isset($_SESSION['admin']) && $_SESSION['admin'] == 1) {
						?>
						<li><a href="admin" style="color: #F64747;">Administration</a></li>
						<?php
							}
						?>
						<li class="icone"><a href="https://github.com/LemonAdd/projet_isn" title="GitHub"><i class="fa fa-github" aria-hidden="true"></i></a></li>
					</ul>
				</div>

			</div>
		</div>


		<!-- LE LOGO SERA ICI -->


		<div class="login">

		<p>Modidiez ce que vous souhaitez modifier et cliquez sur le bouton "Editer mon profil"</p>

		<form method="POST" enctype="multipart/form-data">
				<input type="text" name="newpseudo" placeholder="Pseudo" value="<?php echo $user['pseudo']; ?>">
				<input type="email" name="newmail" placeholder="Nouvelle adresse e-mail" value="<?php echo $user['mail']; ?>">
				<input type="password" name="newmdp" placeholder="Nouveau mot de passe">
				<input type="password" name="newmdp2" placeholder="Répéter le mot de passe">
				<input type="file" name="avatar">
				<input type="submit" name="valider" value="Modifier le profil" id="valider">
		</form>

		<p>
		<?php 
		if (isset($msg)) { 
			echo '<div class="alerte"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' . $msg . '</div>'; 
		} 
		?>
			
		</p>

		</div>


	</body>
</html>

<?php }
else {
	header("Location: login.php");
} ?>