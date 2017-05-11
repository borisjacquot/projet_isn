<?php  
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');

if (!isset($_SESSION['admin']) || $_SESSION['admin'] != 1) {
	exit();
}

if (isset($_GET['id']) && $_GET['id'] > 0) {
	$getid = intval($_GET['id']);
	$requser = $bdd->prepare('SELECT * FROM jeux WHERE id = ?');
	$requser->execute(array($getid));
	$jeu = $requser->fetch();

	if (isset($jeu['id'])) {
		if(isset($_POST['newjeu']) && !empty($_POST['newjeu']) && $_POST['newjeu'] != $jeu['nom']){

			$checkpseudo = $bdd->prepare("SELECT * FROM jeux WHERE nom = ?");
			$checkpseudo->execute(array($newjeu));
			$pseudoexist = $checkpseudo->rowCount();

			if ($pseudoexist == 0) {
				$newjeu = htmlspecialchars($_POST['newjeu']);
				$insertpseudo = $bdd->prepare("UPDATE jeux SET nom = ? WHERE id =?");
				$insertpseudo->execute(array($newjeu, $jeu['id']));
				header("Location: modifjeu.php?id=" . $jeu['id']);
			}
			else {
				$msg = "Ce nom est déjà utilisé";
			}

		}

		if (isset($_FILES['avatar']) && !empty($_FILES['avatar']['name'])) {
		$taillemax = 2097152;
		$extension = array('jpg', 'jpeg', 'gif', 'png');

		if ($_FILES['avatar']['size'] <= $taillemax) {
				$extensionupload = strtolower(substr(strrchr($_FILES['avatar']['name'], '.'), 1));

				if (in_array($extensionupload, $extension)) {
					$chemin = "../img/jeux/" . $jeu['id'] . "." . $extensionupload;
					$check = move_uploaded_file($_FILES['avatar']['tmp_name'], $chemin);
					if ($check) {
						$updateava = $bdd->prepare('UPDATE jeux SET img = :avatar WHERE id = :id');
						$updateava->execute(array(
							'avatar' => $jeu['id'] . "." . $extensionupload,
							'id' => $jeu['id']
							));
						header("Location: modifjeu.php?id=" . $jeu['id']);
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
		<li class="active">
			<a href="jeux.php">
				<span><i class="fa fa-wrench" aria-hidden="true"></i></span>
				<span>Réglages</span>
			</a>
		</li>
		<li>
			<a href="modif.php">
				<span><i class="fa fa-address-book" aria-hidden="true"></i></span>
				<span>Membres</span>
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

	<h1>Modifier le jeu <u><?php echo $jeu['nom']; ?></u></h1>
	
	<img src="../img/jeux/<?php echo $jeu['img']; ?>">


	<form method="POST" enctype="multipart/form-data">
			<input type="text" name="newjeu" placeholder="Nom" value="<?php echo $jeu['nom']; ?>">
			<input type="file" name="avatar"><br />
			<input type="submit" name="valider" value="Modifier le jeu" id="valider">
	</form>
	<?php 
		if (isset($msg)) { 
			echo '<div class="alerte"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' . $msg . '</div>'; 
		} 
	?>
	
</div>


</body>
</html>