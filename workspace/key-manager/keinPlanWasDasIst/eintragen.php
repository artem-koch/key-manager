<?php 
$verbindung = mysql_connect("localhost", "Benutzername" , "Passwort") 
or die("Verbindung zur Datenbank konnte nicht hergestellt werden"); 

mysql_select_db("homepage") or die ("Datenbank konnte nicht ausgew�hlt werden"); 

$username = $_POST["username"]; 
$passwort = $_POST["passwort"]; 
$passwort2 = $_POST["passwort2"]; 

if($passwort != $passwort2 OR $username == "" OR $passwort == "") 
    { 
    echo "Eingabefehler. Bitte alle Felder korekt ausf�llen. <a href=\"eintragen.html\">Zur�ck</a>"; 
    exit; 
    } 
$passwort = md5($passwort); 

$result = mysql_query("SELECT id FROM login WHERE username LIKE '$username'"); 
$menge = mysql_num_rows($result); 

if($menge == 0) 
    { 
    $eintrag = "INSERT INTO login (username, passwort) VALUES ('$username', '$passwort')"; 
    $eintragen = mysql_query($eintrag); 

    if($eintragen == true) 
        { 
        echo "Benutzername <b>$username</b> wurde erstellt. <a href=\"login.html\">Login</a>"; 
        } 
    else 
        { 
        echo "Fehler beim Speichern des Benutzernames. <a href=\"eintragen.html\">Zur�ck</a>"; 
        } 


    } 

else 
    { 
    echo "Benutzername schon vorhanden. <a href=\"eintragen.html\">Zur�ck</a>"; 
    } 
?>