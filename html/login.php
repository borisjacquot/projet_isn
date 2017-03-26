<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>Se connecter</title>
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
						<li class="active"><a href="login.php">Jeux</a></li>
						<li><a href="classement.php">Classements</a></li>
						<li><a href="auteurs.php">Auteurs</a></li>
						<li class="icone"><a href="https://github.com/LemonAdd/projet_isn" title="GitHub"><i class="fa fa-github" aria-hidden="true"></i></a></li>
					</ul>
				</div>

			</div>
		</div>


		<!-- LE LOGO SERA ICI -->

		
		<div class="login" style="background-image: url('img/geo.png');">
		
		
			<?php

				session_start();
				$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');
				# $bdd = new PDO('mysql:host=mysql.hostinger.fr;dbname=u154661693_gamus;charset=utf8', 'u154661693_admin', 'admin51');
				
				if (isset($_SESSION['id'])) {
					header("Location: index.php");
				}
				
				if(isset($_POST['valider1'])) {
				
					$pseudoco = htmlspecialchars($_POST['pseudoco']);
					$mdpco = sha1($_POST['mdpco']);
					
					if(!empty($pseudoco) && !empty($mdpco)) {
					
						$requser = $bdd->prepare("SELECT * FROM membres WHERE pseudo = ? AND motdepasse = ?");
						$requser->execute(array($pseudoco, $mdpco));
						$userexist = $requser->rowCount();
						if ($userexist == 1) {
						
							$userinfo = $requser->fetch();
							$_SESSION['id'] = $userinfo['id'];
							$_SESSION['mail'] = $userinfo['mail'];
							$_SESSION['pseudo'] = $userinfo['pseudo'];
							$_SESSION['admin'] = $userinfo['admin'];
							$_SESSION['avatar'] = $userinfo['avatar'];
							header("Location: membre.php?id=" . $_SESSION['id']);
							
							
						}
						else {
							$msg = "Pseudo ou mot de passe incorrect";
						}
					
					}
					else {
						$msg = "Veuillez renseigner tous les champs";
					}
				
				}

				if (isset($msg)) {
				echo '<div class="alerte"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' . $msg . '</div>';
				}
				
			?>
		
		
			<form method="POST">
				<input type="text" name="pseudoco" placeholder="Pseudo">
				<input type="password" name="mdpco" placeholder="Mot de passe">
				<input type="submit" name="valider1" value="Se connecter">
			</form>
			<hr>
			<a href="register.php"><button>Créer un compte</button></a>


		</div>


	</body>
</html>