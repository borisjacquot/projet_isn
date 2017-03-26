<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8" />
		<title>S'inscrire</title>
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

				if (isset($_POST['valider'])) {
				
					$pseudo = htmlspecialchars($_POST['pseudo']);
					$mail = htmlspecialchars($_POST['mail']);
					$mdp = sha1($_POST['mdp']);
					$mdp2 = sha1($_POST['mdp2']);
				
					if (!empty($_POST['pseudo']) && !empty($_POST['mdp']) && !empty($_POST['mdp2']) && !empty($_POST['mail'])) {
						
						$checkpseudo = $bdd->prepare("SELECT * FROM membres WHERE pseudo = ?");
						$checkpseudo->execute(array($pseudo));
						$pseudoexist = $checkpseudo->rowCount();
						
						$verifpseudo = preg_match("#admin#i", "'.$pseudo.'");
						
						if ($verifpseudo == FALSE) {	
						
							if($pseudoexist == 0) {
								if(filter_var($mail, FILTER_VALIDATE_EMAIL)) {
								
									$checkemail = $bdd->prepare("SELECT * FROM membres WHERE mail = ?");
									$checkemail->execute(array($mail));
									$mailexist = $checkemail->rowCount();
									
									if($mailexist == 0) {
								
											if($mdp == $mdp2) {
											
												$inserer = $bdd->prepare("INSERT INTO membres(pseudo, mail, motdepasse) VALUES(?, ?, ?)");
												$inserer->execute(array($pseudo, $mail, $mdp));

												$oui = "Votre compte a bien été créé, <a href='login.php' style='color: #446CB3;'>Connectez vous</a>";
												
											}
											else {
												$msg = "Les mots de passe doivent correspondre";
											}
									}
									else {
										$msg = "Adresse mail déjà utilisée";
									}
								}
								else {
									$msg = "Votre adresse mail n'est pas valide";
								}
							}
							else {
								$msg = "Ce pseudo est déjà utilisé";
							}
						}
						else {
							$msg = "Pseudo non autorisé";
						}
					}
					else {
						$msg = "Tous les champs doivent être remplis";
					}
				}

			?>

			<?php
			if (isset($msg)) { 
				echo '<div class="alerte"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' . $msg . '</div>'; 
			}
			if (isset($oui)) { 
				echo '<div class="oui"><i class="fa fa-check-circle" aria-hidden="true"></i> ' . $oui . '</div>'; 
			}
			?>
			
			
			<form method="POST">
				<input type="text" name="pseudo" placeholder="Pseudo" value="<?php if(isset($pseudo)) { echo $pseudo; } ?>">
				<input type="password" name="mdp" placeholder="Mot de passe">
				<input type="password" name="mdp2" placeholder="Répéter le mot de passe">
				<input type="email" name="mail" placeholder="Adresse e-mail" value="<?php if(isset($mail)) { echo $mail; } ?>">
				<input type="submit" name="valider" value="S'inscrire" id="valider">
			</form>
			<hr>
			<p>"La citation classique est le mot de passe des lettrés du monde entier." <small><i>Samuel Johnson</i></small></p>


		</div>


	</body>
</html>