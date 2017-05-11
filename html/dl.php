<?php

$bdd = new PDO('mysql:host=localhost;dbname=gamus;charset=utf8', 'root', '');

if (isset($_GET['id']) && $_GET['id'] > 0) {

	$getid = intval($_GET['id']);
	$reqjeu = $bdd->prepare('SELECT * FROM jeux WHERE id = ?');
	$reqjeu->execute(array($getid));
	$jeu = $reqjeu->fetch();
	
	if (isset($jeu['id'])) {
		$nb = $jeu['dl'] + 1;
		$insert = $bdd->prepare("UPDATE jeux SET dl = ? WHERE id =?");
		$insert->execute(array($nb, $jeu['id']));
		header("Location: jeux/" . $jeu['id'] . ".zip");
	}
	else {
		echo "Erreur";
	}
}
else {
	echo "Erreur";
}

?>