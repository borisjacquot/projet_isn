<!DOCTYPE html>
<html>
<?php 
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');
# $bdd = new PDO('mysql:host=mysql.hostinger.fr;dbname=u154661693_gamus;charset=utf8', 'u154661693_admin', 'admin51');

$score = $bdd->query('SELECT * FROM membres ORDER BY score DESC LIMIT 0,10');

?>

	<head>
		<meta charset="utf-8" />
		<title>Auteurs</title>
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
						<li class="active"><a href="classement.php">Classements</a></li>
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
		

		<div class="classement">

			<div style="background-image: url('img/geo.png');">
				<div class="row">
					<div class="col-4">
						<a href="#" title="Classement de la semaine"><h1 align="center" class="log" style="color: #47b475;"><i class="fa fa-clock-o" aria-hidden="true"></i></h1></a>
					</div>
					<div class="col-4">
						<a href="#" title="Classement du mois"><h1 align="center" class="log"><i class="fa fa-calendar" aria-hidden="true"></i></h1></a>
					</div>
					<div class="col-4">
						<a href="#" title="Classement général"><h1 align="center" class="log"><i class="fa fa-trophy icon" aria-hidden="true"></i></h1></a>
					</div>
					
			</div>
			</div>

			<hr>
			<h1 align="center" style="background-image: url('img/geo.png');text-shadow: 0 5px 16px black;">Classement de la semaine</h1>
			<hr>
			<div class="fondscore">
				<?php while($s = $score->fetch()) { ?>

				<div class="row">

					<div class="col-s2">
						<?php if (!empty($s['avatar'])) { ?>
						<a href="membre.php?id=<?php echo $s['id']; ?>"><div class="avatar_membre" style="background-image:url(membres/avatars/<?php echo $s['avatar']; ?>); background-size: cover; height:125px; width: 125px; box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19); margin: 0;"></div></a>
						<?php } else { ?>
						<a href="membre.php?id=<?php echo $s['id']; ?>"><div class="avatar_membre" style="background-image:url(img/avatar.png); background-size: cover; height:125px; width: 125px; margin: 0;"></div></a>
						<?php } ?>
						
					</div>
					<div class="col-s10">
						<div class="score" style="background-image: url('img/geo.png');">
							<p><b><a href="membre.php?id=<?php echo $s['id']; ?>"><?php echo $s['pseudo']; ?></a></b><span class="label"><?php echo $s['score']; ?> points</span></p>
						</div>
					</div>

				</div>
				<?php } ?>

			</div>
			<div class="citation" style="padding-right: 50px; margin-top: 0; background-image: url('img/geo.png');box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);">
				<p class="txt" align="center">"How High Can You Get ?"</p>
				<p class="nom">DonkyKong, 1981</p>
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