<!DOCTYPE html>

<?php

$bdd = new PDO('mysql:host=mysql.hostinger.fr;dbname=u154661693_gamus', 'u154661693_admin', 'admin51');
if(isset($_POST['valier'])){
	echo "ok";
}

?>

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
						<li class="active"><a href="login.html">Jeux</a></li>
						<li><a href="classement.html">Classements</a></li>
						<li><a href="auteurs.html">Auteurs</a></li>
						<li class="icone"><a href="https://github.com/LemonAdd/projet_isn" title="GitHub"><i class="fa fa-github" aria-hidden="true"></i></a></li>
					</ul>
				</div>

			</div>
		</div>


		<!-- LE LOGO SERA ICI -->

		
		<div class="login" style="background-image: url('img/geo.png');">

			<form method="POST">
				<input type="text" name="pseudo" placeholder="Pseudo">
				<input type="password" name="mdp" placeholder="Mot de passe">
				<input type="password" name="mdp2" placeholder="Répéter le mot de passe">
				<input type="email" name="mail" placeholder="Adresse e-mail">
				<input type="submit" name="valider" value="S'inscrire">
			</form>
			<hr>
			<p>"La citation classique est le mot de passe des lettrés du monde entier." <small><i>Samuel Johnson</i></small></p>


		</div>


	</body>
</html>