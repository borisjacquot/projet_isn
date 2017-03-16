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
						<li><a href="index.html">Accueil</a></li>
						<li class="active"><a href="login.php">Jeux</a></li>
						<li><a href="classement.html">Classements</a></li>
						<li><a href="auteurs.html">Auteurs</a></li>
						<li class="icone"><a href="https://github.com/LemonAdd/projet_isn" title="GitHub"><i class="fa fa-github" aria-hidden="true"></i></a></li>
					</ul>
				</div>

			</div>
		</div>


		<!-- LE LOGO SERA ICI -->

		
		<div class="login" style="background-image: url('img/geo.png');">
		
			<?php

				$bdd = new PDO('mysql:host=localhost;dbname=gamus', 'root', '');

				if (isset($_POST['valider'])) {
				
					$pseudo = htmlspecialchars($_POST['pseudo']);
					$mail = htmlspecialchars($_POST['mail']);
					$mdp = sha1($_POST['mdp']);
					$mdp2 = sha1($_POST['mdp2']);
				
					if (!empty($_POST['pseudo']) && !empty($_POST['mdp']) && !empty($_POST['mdp2']) && !empty($_POST['mail'])) {
						
						$pseudolength = strlen($pseudo);
						
						if($pseudolength <= 255) {
							if(filter_var($mail, FILTER_VALIDATE_EMAIL)) {
							
								$checkemail = $bdd->prepare("SELECT * FROM membres WHERE mail = ?");
								$checkemail->execute(array($mail));
								$mailexist = $checkemail->rowCount();
								
								if(mailexist == 0) {
							
										if($mdp == $mdp2) {
										
											$inserer = $bdd->prepare("INSERT INTO membres(pseudo, mail, motdepasse) VALUES(?, ?, ?)");
											$inserer->execute(array($pseudo, $mail, $mdp));
											echo "Votre compte a bien été créé";
											
										}
										else {
											echo "Les mots de passe doivent correspondre";
										}
								}
								else {
									echo "Adresse mail déjà utilisée";
								}
							}
							else {
								echo "Votre adresse mail n'est pas valide";
							}
						}
						else {
							echo "Votre pseudo ne doit pas contenir plus de 255 caractères";
						}
					}
					else {
						echo "Tous les champs doivent être remplis";
					}
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