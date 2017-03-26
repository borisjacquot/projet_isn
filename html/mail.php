<?php

$header = "MIME-Version: 1.0\r\n";
$header .= 'From:"Gamus"<no-reply@gamus.com>'."\n";
$header .= 'Content-Type:text/html; charset="utf-8"'."\n";
$header .= 'Content-Transfer-Encoding: 8bit';

$message = '
<html>
	<body>
		<div align="center">
			<a href="http://localhost/confirmation.php?id='. urldecode($pseudo) .'&key='. $key .'">Confirmez votre compte</a>
		</div>
	</body>
</html>
';

mail($mail, "Salut", $message, $header);

?>