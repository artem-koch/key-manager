<?php
session_start ();
?> 

<?php
$verbindung = mysql_connect ( "localhost:3306", "programmuser", "1234" ) or die ( "Verbindung zur Datenbank konnte nicht hergestellt werden" );
mysql_select_db ( "key-manager" ) or die ( "Datenbank konnte nicht ausgewählt werden" );

$username = $_POST ["username"];
$passwort = md5 ( $_POST ["password"] );

$abfrage = "SELECT username, pw FROM user_account WHERE username LIKE '$username' LIMIT 1";
$ergebnis = mysql_query ( $abfrage );
$row = mysql_fetch_object ( $ergebnis );

if ($row->pw == $passwort) {
	$_SESSION ["username"] = $username;
	echo "Login erfolgreich. <br> <a href=\"..\overview\overview.php\">Geschützer Bereich</a>";
} else {
	echo "Benutzername und/oder Passwort waren falsch. <a href=\".\login.html\">Login</a>";
}
?>