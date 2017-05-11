<!DOCTYPE html>

<?php 
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');

if (isset($_GET['id']) && $_GET['id'] > 0) {
	$getid = intval($_GET['id']);
	$requser = $bdd->prepare('SELECT * FROM membres WHERE id = ?');
	$requser->execute(array($getid));
	$userinfo = $requser->fetch();
if (isset($userinfo['id'])) {

?>

<html>

	<head>
		<meta charset="utf-8" />
		<title>Profil de <?php echo $userinfo['pseudo']; ?></title>
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


		<div class="page">

			<?php
			if (isset($_SESSION['id']) && $userinfo['id'] == $_SESSION['id']) {
				$vous = "Vous avez";
				$vous2 = "Votre";
			}
			else {
				$vous = $userinfo['pseudo'] . " a";
				$vous2= "Ce";
			}

			if (!empty($userinfo['restricted_raison'])) {
				$raison = $userinfo['restricted_raison'];
			}
			else {
				$raison = "Non spécifiée";
			}
			?>


			<?php
				if ($userinfo['restricted'] == 1) {
			?>
			<div class="achievement" style="background-image: url(img/gplay.png);background-color: #F64747; margin-bottom: 20px;"><div class="trophe"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></div><?php echo $vous2; ?> compte est en mode restreint. <b>Raison : <?php echo $raison; ?></b></div>
			<?php
				}
			?>

			<?php
			if (isset($_SESSION['id']) && $userinfo['id'] == $_SESSION['id']) {
			?>
			<a href="edition.php"><button>Editer mon profil</button></a>
			<?php } ?>


			<center>
				<?php
					if (!empty($userinfo['avatar'])) {
				?>
						<div class="avatar_membre" style="background-image:url(membres/avatars/<?php echo $userinfo['avatar']; ?>); background-size: cover;"></div>
				<?php
					}
					else {
				?>
						<div class="avatar_membre" style="background-image:url(img/avatar.png); background-size: cover;"></div>
				<?php
					}
				?>
			</center>
			
			<?php
			if ($userinfo['admin'] == 1){
				$color = "446CB3";
			}
			else {
				$color = "22313F";
			}
			
			?>
			

			<center>
				<span class="title" style="background-image: url(img/gplay.png);background-color: #<?php echo $color; ?>;"><?php echo $userinfo['pseudo']; ?></span>
			</center>

			<h1>Succès <small><?php echo $vous; ?> débloqué <b><?php echo $userinfo['achiev_nb']; ?></b> succès.</small></h1>
			<hr>
			
			<div class="row" style="margin: 0 10%; padding-left: 5%;">
					<?php
						if ($userinfo['admin'] == 1) {
					?>
					<div class="col-5">
						<div class="achievement" style="background-image: url(img/gplay.png);background-color: #F64747;"><div class="trophe"><i class="fa fa-address-card" aria-hidden="true"></i></div>Administrateur</div>
					</div>
					<?php
						}
					?>
				<div class="col-5">
					<?php
						if ($userinfo['achiev_beta'] == 1) {
					?>
						<div class="achievement" style="background-image: url(img/gplay.png);"><div class="trophe"><i class="fa fa-flask" aria-hidden="true"></i></div>Beta Testeur</div>
					<?php
						}
						else {
					?>
						<div class="achievement-lock" style="background-image: url(img/gplay.png);"><div class="trophe"><i class="fa fa-flask" aria-hidden="true"></i></div>???</div>

					<?php
						}
					?>
				</div>
				<div class="col-5">
					<div class="achievement-lock" style="background-image: url(img/gplay.png);"><div class="trophe"><i class="fa fa-trophy" aria-hidden="true"></i></div>Finir le jeu</div>
				</div>
			</div>

			<h1>Scores <small>Les meilleurs scores que <?php echo $vous; ?> fait.</small></h1>
			<hr>
			<div class="achievement" style="background-image: url(img/gplay.png); padding-left: 20%;"><div class="trophe"><i class="fa fa-trophy" aria-hidden="true"></i></div>Score actuel<span class="label"><?php echo $userinfo['score']; ?> points</span><a href="classement.php"><span class="label" style="background-color: #F64747;"><i class="fa fa-plus-circle" aria-hidden="true"></i></span></a></div>
			<br>
			<div class="achievement" style="background-image: url(img/gplay.png); padding-left: 20%;"><div class="trophe"><i class="fa fa-flag" aria-hidden="true"></i></div>Dernier concours remporté<span class="label">Aucun</span></div>

			
			

		</div>

		<div class="user">

			<?php
				if (!empty($_SESSION['pseudo']) && isset($_SESSION['pseudo'])) {	
			?>	
				<p>Connecté en tant que <a href="membre.php?id=<?php echo $_SESSION['id']; ?>"><?php echo $_SESSION['pseudo']; ?></a></p>
				<a href="deco.php"><button>Déconnexion</button></a>
			<?php
				}
				else {
			?>
				<p>Vous n'êtes pas connecté</p>
				<a href="login.php"><button>Connexion</button></a>

			<?php
				}
			?>

		</div>

	</body>
</html>

<?php
}
else {
	echo "Erreur";
} 
} 
else {
	echo "Erreur";
}?>