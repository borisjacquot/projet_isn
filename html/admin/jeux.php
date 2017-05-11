<!DOCTYPE html>
<?php
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');
$jeux = $bdd->query('SELECT * FROM jeux ORDER BY id DESC LIMIT 0,50');

if (isset($_GET['actif']) && !empty($_GET['actif'])) {
	$actif = (int) $_GET['actif'];
	$req = $bdd->prepare('UPDATE jeux SET actif = 1 WHERE id = ?');
	$req->execute(array($actif));
}
if (isset($_GET['desac']) && !empty($_GET['desac'])) {
	$desac = (int) $_GET['desac'];
	$req = $bdd->prepare('UPDATE jeux SET actif = 0 WHERE id = ?');
	$req->execute(array($desac));
}

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
		<li>
			<a href="#">
				<span><i class="fa fa-tachometer" aria-hidden="true"></i></span>
				<span>Dashboard</span>
			</a>
		</li>
		<li class="active">
			<a href="jeux.php">
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
			<a href="/">
				<span><i class="fa fa-power-off" aria-hidden="true"></i></span>
				<span>Retour au site</span>
			</a>
		</li>
	</ul>
</div>


<div class="contenu">

<h1>Ajouter un jeu</h1>

	<form method="POST">
		<input type="text" name="nom" placeholder="Nom">
		<input type="submit" name="valider" value="Ajouter" id="valider">
	</form><br/>

<?php
if (isset($_POST['valider'])) {

$nom = htmlspecialchars($_POST['nom']);

	if (!empty($_POST['nom'])) {
						
		$checknom = $bdd->prepare("SELECT * FROM jeux WHERE nom = ?");
		$checknom->execute(array($nom));
		$nomexist = $checknom->rowCount();
		if($nomexist == 0) {
			$inserer = $bdd->prepare("INSERT INTO jeux(nom) VALUES(?)");
			$inserer->execute(array($nom));
		}
		else {
			echo "Ce nom existe déjà";
		}
	}
	else {
		echo "Merci de renseigner tous les champs";
	}
}
?>


<table>
	<tr style="background-image: url(../img/gplay.png);">
		<th width="50px">#</th>
		<th width="25%">Nom</th>
		<th>Action</th>
	</tr>
	<?php while($m = $jeux->fetch()) { ?>
	<tr>
		<td width="50px"><?php echo $m['id']; ?></td>
		<td><?php echo $m['nom']; ?></td>
		<td><?php if($m['actif'] == 1) { ?><a class="btn-red" href="jeux.php?desac=<?php echo $m['id']; ?>"><i class="fa fa-fire" aria-hidden="true"></i> Désactiver</a><?php } ?><?php if($m['actif'] == 0) { ?><a class="btn-green" href="jeux.php?actif=<?php echo $m['id']; ?>"><i class="fa fa-check" aria-hidden="true"></i> Activer</a><?php } ?> <a class="btn-blue" href="modifjeu.php?id=<?php echo $m['id'] ?>"><i class="fa fa-pencil" aria-hidden="true"></i> Modifier le jeu</a></td>
	</tr>
	<?php } ?>
</table>
</div>

</body>
</html>