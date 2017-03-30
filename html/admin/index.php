<!DOCTYPE html>
<?php
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');
# $bdd = new PDO('mysql:host=mysql.hostinger.fr;dbname=u154661693_gamus;charset=utf8', 'u154661693_admin', 'admin51');

if (!isset($_SESSION['admin']) || $_SESSION['admin'] != 1) {
	exit();
}

if (isset($_GET['restricted']) && !empty($_GET['restricted'])) {
	$restricted = (int) $_GET['restricted'];
	$req = $bdd->prepare('UPDATE membres SET restricted = 1 WHERE id = ?');
	$req->execute(array($restricted));
}
if (isset($_GET['unrestricted']) && !empty($_GET['unrestricted'])) {
	$unrestricted = (int) $_GET['unrestricted'];
	$req = $bdd->prepare('UPDATE membres SET restricted = 0 WHERE id = ?');
	$req->execute(array($unrestricted));
}
if (isset($_GET['ban']) && !empty($_GET['ban'])) {
	$ban = (int) $_GET['ban'];
	$req = $bdd->prepare('DELETE FROM membres WHERE id = ?');
	$req->execute(array($ban));
}

$membres = $bdd->query('SELECT * FROM membres ORDER BY id DESC LIMIT 0,50');

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
		<li class="active">
			<a href="#">
				<span><i class="fa fa-tachometer" aria-hidden="true"></i></span>
				<span>Dashboard</span>
			</a>
		</li>
		<li>
			<a href="#">
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
			<a href="#">
				<span><i class="fa fa-trophy" aria-hidden="true"></i></span>
				<span>Concours</span>
			</a>
		</li>
		<li>
			<a href="#">
				<span><i class="fa fa-cogs" aria-hidden="true"></i></span>
				<span>Statut du site</span>
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

<?php
	$compter = $bdd->prepare("SELECT * FROM membres");
	$compter->execute();
	$nombre = $compter->rowCount();
?>

<div class="row">
	<div class="col-3">
		<div class="cadre" style="background-image: url(../img/gplay.png);">
			<div class="logo"><i class="fa fa-address-book" aria-hidden="true"></i></div>
			<b><?php echo $nombre; ?></b> membres
		</div>
	</div>
	<div class="col-3">
		<div class="cadre" style="background-image: url(../img/gplay.png);">
			<div class="logo"><i class="fa fa-gamepad" aria-hidden="true"></i></div>
			<b>0</b> jeux en ligne
		</div>
	</div>
	<div class="col-3">
		<div class="cadre" style="background-image: url(../img/gplay.png);">
			<div class="logo"><i class="fa fa-trophy" aria-hidden="true"></i></div>
			<b>0</b> concours créés
		</div>
	</div>
	<div class="col-3">
		<div class="cadre" style="background-image: url(../img/gplay.png);">
			<div class="logo"><i class="fa fa-plug" aria-hidden="true"></i></div>
			<b>0</b> membres en ligne
		</div>
	</div>

</div>

<h1>Derniers membres</h1>


<table>
	<tr style="background-image: url(../img/gplay.png);">
		<th width="50px">#</th>
		<th width="25%">Pseudo</th>
		<th>Action</th>
	</tr>
	<?php while($m = $membres->fetch()) { ?>
	<tr>
		<td width="50px"><?php echo $m['id']; ?></td>
		<td><a href="../membre.php?id=<?php echo $m['id']; ?>"><?php echo $m['pseudo']; ?></a></td>
		<td><?php if($m['restricted'] == 0) { ?><a class="btn-red" href="index.php?restricted=<?php echo $m['id']; ?>"><i class="fa fa-fire" aria-hidden="true"></i> Mode restreint</a><?php } ?><?php if($m['restricted'] == 1) { ?><a class="btn-green" href="index.php?unrestricted=<?php echo $m['id']; ?>"><i class="fa fa-check" aria-hidden="true"></i> Désactiver mode restreint</a><?php } ?> <a class="btn-red" href="index.php?ban=<?php echo $m['id']; ?>"><i class="fa fa-gavel" aria-hidden="true"></i> Bannir</a> <a class="btn-green" href="modif.php?id=<?php echo $m['id'] ?>"><i class="fa fa-pencil" aria-hidden="true"></i> Modifier le membre</a> <a target="_blank" class="btn-blue" href="../membre.php?id=<?php echo $m['id'] ?>"><i class="fa fa-external-link" aria-hidden="true"></i> Profil</a></td>
	</tr>
	<?php } ?>
</table>

</div>

</body>
</html>