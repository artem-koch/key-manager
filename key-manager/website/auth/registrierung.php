<?php
$verbindung = mysql_connect ( "localhost:3306", "programmuser", "1234" ) or die ( "Verbindung zur Datenbank konnte nicht hergestellt werden" );

mysql_select_db ( "key-manager" ) or die ( "Datenbank konnte nicht ausgewählt werden" );

$username = $_POST ["username"];
$passwort = $_POST ["passwort"];
$passwort2 = $_POST ["passwort2"];

if ($passwort != $passwort2 or $username == "" or $passwort == "") {
	echo "Eingabefehler. Bitte alle Felder korekt ausfüllen. <a href=\"eintragen.html\">Zurück</a>";
	exit ();
}
$passwort = md5 ( $passwort );

$result = mysql_query ( "SELECT uid FROM user_account WHERE username LIKE '$username'" );
$menge = mysql_num_rows ( $result );

if ($menge == 0) {
	$eintrag = "INSERT INTO user_account (username, pw) VALUES ('$username', '$passwort')";
	$eintragen = mysql_query ( $eintrag );
	
	if ($eintragen == true) {
		echo "Benutzername <b>$username</b> wurde erstellt. <a href=\"..\auth\login.html\">Login</a>";
	} else {
		echo "Fehler beim Speichern des Benutzernames. <a href=\"registrierung.html\">Zurück</a>";
	}
} 

else {
	echo "Benutzername schon vorhanden. <a href=\"eintragen.html\">Zurück</a>";
}
?>