<?php  
$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');
# $bdd = new PDO('mysql:host=mysql.hostinger.fr;dbname=u154661693_gamus;charset=utf8', 'u154661693_admin', 'admin51');

if (isset($_GET['id']) && $_GET['id'] > 0) {
	$getid = intval($_GET['id']);
	$requser = $bdd->prepare('SELECT * FROM membres WHERE id = ?');
	$requser->execute(array($getid));
	$userinfo = $requser->fetch();
if (isset($userinfo['id'])) {


	

?>

<h1>Modifier le membre <u><?php echo $userinfo['pseudo']; ?></u></h1>

<?php
}
else {
	echo "Erreur";
} 
} 
else {
	echo "Erreur";
}
?>