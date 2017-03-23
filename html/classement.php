<!DOCTYPE html>
<html>
<?php 
session_start();
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
				<div class="row">
					<div class="col-s2">
						<a href="#"><img src="img/avatar.png" class="avatar"></a>
					</div>
					<div class="col-s10">
						<div class="score" style="background-image: url('img/geo.png');">
							<p><b>Pseudo</b><span class="label">12 points</span></p>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-s10">
						<div class="score" style="background-image: url('img/geo.png');">
							<p><b>Pseudo</b><span class="label">12 points</span></p>
						</div>
					</div>
					<div class="col-s2">
						<a href="#"><img src="img/avatar.png" class="avatar"></a>
					</div>

				</div>
				<div class="row">
					<div class="col-s2">
						<a href="#"><img src="img/avatar.png" class="avatar"></a>
					</div>
					<div class="col-s10">
						<div class="score" style="background-image: url('img/geo.png');">
							<p><b>Pseudo</b><span class="label">12 points</span></p>
						</div>
					</div>

				</div>
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
				<p>Connecté en tant que <?php echo $_SESSION['pseudo']; ?></p>
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