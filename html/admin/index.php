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
</head>
<body>

<h1>Derniers membres</h1>
	<ul>
		<?php while($m = $membres->fetch()) { ?>
		<li><?php echo $m['id']; ?> : <a href="/isn/membre.php?id=<?php echo $m['id']; ?>"><?php echo $m['pseudo']; ?></a><?php if($m['restricted'] == 0) { ?> - <a href="index.php?restricted=<?php echo $m['id']; ?>">Mode restreint</a><?php } ?><?php if($m['restricted'] == 1) { ?> - <a href="index.php?unrestricted=<?php echo $m['id']; ?>">Désactiver mode restreint</a><?php } ?>- <a href="index.php?ban=<?php echo $m['id']; ?>">Bannir</a></li>
		<?php } ?>
	</ul>

<h1>Modifier un membre</h1>

<?php 

	if (isset($_POST['valider']) && !empty($_POST['idmodif'])) {
		header("Location: modif.php?id=" . $_POST['idmodif']);
	}

?>

<form method="POST">
	<label>ID : </label><input type="text" name="idmodif"><input type="submit" name="valider">
</form>

<p>Oui y'a pas de CSS, j'avais trop la flemme je le ferais plus tard.</p>

</body>
</html>