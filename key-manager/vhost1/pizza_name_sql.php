<?php
	$verbindung = mysql_connect ("localhost",
	"root", "")
	or die ("keine Verbindung moeglich.
	 Benutzername oder Passwort sind falsch");
	mysql_select_db("pizzaria")
	or die ("Die Datenbank existiert nicht.");

	$abfrage = "SELECT name FROM pizza";
	$ergebnis = mysql_query($abfrage);
?>