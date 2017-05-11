<!DOCTYPE html>
<html>

<?php 
session_start();

if (!isset($_SESSION['id'])) {
	header("Location: login.php");
}

$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');

if (isset($_GET['id']) && $_GET['id'] > 0) {
	$getid = intval($_GET['id']);
	$reqjeu = $bdd->prepare('SELECT * FROM jeux WHERE id = ?');
	$reqjeu->execute(array($getid));
	$jeu = $reqjeu->fetch();
if (isset($jeu['id'])) {
?>

	<head>
		<meta charset="utf-8" />
		<title>Jeux</title>
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

			<h1>Télécharger <small><?php echo $jeu['nom']; ?></small></h1>

			<hr>

		<center>
			<div style="padding: 0 20% 0 20%;"><a href="dl.php?id=<?php echo $jeu['id']; ?>"><button><i class="fa fa-download" aria-hidden="true"></i> Télécharger</button></a></div>
			<p>Déjà <b><?php echo $jeu['dl']; ?></b> téléchargements!</p>
		</center>


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
	<?php } } else { echo "Erreur"; }?>
</html>