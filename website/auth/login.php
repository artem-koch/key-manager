<?php
  ini_set('php_value output_buffering', '1');
  ini_set('session.use_trans_sid', '0');
  ini_set('session.use_cookies' , '1' );
  ini_set('session.use_only_cookies' , '1');
  #Lesen der Konfiguration
  require_once('auth_config.php');

￼￼￼if ($_SERVER['REQUEST_METHOD'] == 'GET') { show_login('', false);
exit;
}
// Das Feld mit dem Passwort hat einen zufälligen Name // damit das Passort nicht gespeichert werden kann.
if ( isset($_POST['password_field_name']) ) {
    $_POST['passwort'] = trim($_POST[$_POST['password_field_name']]);
}
// Simple Eingabeprüfung auf Übertragung des Benutzernamens und des Passwortes:
if ( ! isset ($_POST['username']) )   { show_login('', 'Benutzername nicht übertragen.'); ex
if ( '' == trim($_POST['username']) ) { show_login('', 'Benutzername leer.')
if ( ! isset ($_POST['passwort']) )   { show_login('', 'Passwort nicht übertragen.')
if ( '' == trim($_POST['passwort']) ) { show_login('', 'Passwort leer.')
// Benutzername und Passwort werden überprüft
// Schritt 1:
// Im Beispiel seien die Zugangsdaten in einer Textdatei gespeichert, welche
// im wesentlichen dem Aufbau einer Datei entspricht, wie diese der Apache mit
// der Methode htpasswd verwendet.
// Das wäre hier mit den Benutzernamen foo und bar und dem identischen(!) Passwort
// 'GeHeim' etwas wie:
; ex ; ex ; ex
 // foo:$2y$05$AoeUm/2hL5sdySuNuH0CmeSCZN7DneDdmU3thyrFWgiboh3FYQ0ae:weitere Informationen
 // bar:$2y$05$9971LHpPxCmZikyi3WqEd.1h8GE6QKfqT4RwS/FDINRqyzLcEHy.C:weitere Informationen
// Weiter wird der Benutzername beim Speichern stets klein geschrieben und man muss absichern
// dass keine Leerzeichen am Beginn oder Ende des Strings mitgeliefert wurden:
$_POST['username']=strtolower(trim($_POST['username']));
// Wir kapseln aber das Abholen des Passwortes, damit auch Datenbanken verwendet werden könn
 // Dazu muss unten die Funktion  getHashedPassword($username) angepasst werden.
$HashedPassword = getHashedPassword($_POST['username']); if (false == $HashedPassword ) {
     show_login('', 'Den Benutzer gibt es nicht.');
exit; }
// Schritt 2: Überprüfen des Passwortes
// leider gibt es noch ältere Installationen als PHP 5.5 - die password_verify() nicht kenne if (! function_exists('password_verify') ) {
// Wenn es crypt() nicht gibt, dann ist das PHP so alt, dass sicherheitsrelaventes damit // nicht gemacht werden sollte:
if (! function_exists('crypt') ) { // es gibt auch noch ältere ...
        die ("Sorry: Aber Sie sollten Ihr PHP wirklich updaten!");
     }
     // Wenn es password_verify() nicht gibt, dann bauen wir eine:
function password_verify($password, $HashedPassword) {
if ( $HashedPassword == crypt($password, $HashedPassword) ) {
return true; } else {
return false; }
} }
  // Jetzt können wir also die Funktion "password_verify" in jedem Fall verwenden:
  if ( ! password_verify (trim($_POST['passwort']), $HashedPassword) ) {
      show_login(trim($_POST['username']), 'Passwort falsch');

￼￼￼exit; }
// else:
// Registrierung der Daten in der Session und // Weiterleitung zur geschützten Startseite session_start();
session_unset();
session_regenerate_id(true);
if ( isset($_POST['register_ip']) &&  $_POST['register_ip'])  {
   $_SESSION['ip'] = $_SERVER['REMOTE_ADDR'];
 }
 $_SESSION['username']
 $_SESSION['groups']
 $_SESSION['last_action']
 header('Location: ' . $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . rtrim(di
 exit;
// benötigte Funktionen
function getHashedPassword($username) { $arRows = file(PASSWORD_FILE); unset($csv); // Speicher sparen foreach($arRows as $row) {
$row=trim($row); // Manche geben gerne Leerzeichen ein...
if ( $row && '#' != $row{0} && strpos($row, ':') ) {
//Ausschließen von Kommentaren und Leerzeilen sowie Zeilen ohne Trenner
} }
= $_POST['username'];
= getGroups($_POST['username']);
= date('U');
$arPair = explode(HTPASSWD_SEPARATOR, $row, 3); // Aufspalten von Benutzername if ( trim($arPair[0]) == $username ) {
   return trim($arPair[1]);
}
     // wenn die Funktion hier noch aktiv ist, dann gibt es den Benutzer nicht;
return false; }
function getGroups($username) {
// gibt einen Hash (Hier gemeint: Array mit benamten Elementen)
// mit allen Gruppen, zu denen der sich anmeldende Benutzer gehört, zurück $r=array();
$r['standard-user']=true;
$arRows = file(GROUP_FILE);
foreach($arRows as $row) {
     $row=trim($row);
     if ($row != '' && '#' != $row{0} && strpos($row, ':') ) {
        list($group, $rest)=explode(HTGROUP_SEPARATOR, $row);
        $arUsers=explode(HTGROUP_USER_SEPARATOR, $rest);
        foreach ($arUsers as $s) {
          $s=trim($s);
          if ($s == $username) {
$r[$group]=true; }
} }
}
return $r; }
function show_login($username='', $explain=false) { if ($explain) {
       $explain = '<p> (Grund: '. $explain . ')</p>';
    }
    $username = htmlspecialchars(str_replace('"', '&quot;', $username));

// Zufälliger Name für das Passwort-Feld:
      $password_field_name = '';
      $chars = 'abcdefghijklmnopuvwxyzABCDEFGHIJKLMNOPUVWXYZ';
      $rand_max= strlen($chars) - 1;
      for ($i=0; $i<10; $i++) {
         $password_field_name .= $chars{rand(0, $rand_max)} ;
      }
$hostname=$_SERVER['HTTP_HOST'];
header('Expires: Thu, 01-Jan-70 00:00:01 GMT'); header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); header('Cache-Control: no-store, no-cache, must-revalidate'); header('Cache-Control: post-check=0, pre-check=0', false); header('Pragma: no-cache');
echo <<<EOF
<!doctype html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>$hostname: Geschützter Bereich</title>
    <meta name="robots" content="noindex">
  </head>
  <body>
    <h1>Bitte anmelden:</h1>
    $explain
    <form action="login.php" method="POST">
      <fieldset>
        <legend>Login</legend>
        <label for=""username">Username: <input type="text" name="username" id="username" valu
        <label for="$password_field_name">Passwort: <input type="password" name="$password_fie
        <label for="register_ip"><input type="checkbox" checked="checked" name="register_ip" i
        <input type="submit" value="Anmelden">
</fieldset>
      <input type="hidden" name="password_field_name" value="$password_field_name">
    </form>
  </body>
</html>
EOF
;
}