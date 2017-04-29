<!DOCTYPE html>
<html>

<?php 
session_start();

if (!isset($_SESSION['id'])) {
	header("Location: login.php");
}

$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');

$jeu = $bdd->query('SELECT * FROM jeux ORDER BY id DESC LIMIT 0,50');
?>

	<head>
		<meta charset="utf-8" />
		<title>Accueil</title>
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

			<h1>Choisissez votre jeu</h1>

			<hr>

			<div class="row">
				<?php while($m = $jeu->fetch()) { ?>
					<div class="col-4">
						<div class="cadre">
							<img src="img/jeux/<?php echo $m['img']; ?>">
							<div class="contenu">
						   		<?php if($m['actif'] == 1) { ?>
						   			<a href="<?php echo "jeux/" . $m['id'] . ".php"; ?>"><button style="background-color: #3FC380;"><?php echo $m['nom']; ?></button></a>
						   		<?php } else { ?>
						   			<button style="background-color: #F64747;">Désactivé</button>
						   		<?php } ?>
					   		</div>
						</div>
					</div>
				<?php } ?>
			</div>


		</div>

		<div class="user">

			<?php
				if (!empty($_SESSION['pseudo']) && isset($_SESSION['pseudo'])) {	
			?>	
				<p>Connecté en tant que <?php echo $_SESSION['pseudo']; ?> <a href="membre.php?id=<?php echo $_SESSION['id']; ?>"><span class="label" style="margin-left: 101px">Profil</span></a></p>
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