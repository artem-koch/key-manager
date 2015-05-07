<?php
  require_once('auth_config.php');
  session_start();
if (! 'https' == $_SERVER['REQUEST_SCHEME']) { session_regenerate_id(true); // erneuert die Session-ID,
// erschwert Session-Hijacking
}
if (
){
header('Status: 403 Forbidden');
header('Location: ' . $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . rtrim exit;
}
if ( defined('NEED_GROUPS') && '' != trim(NEED_GROUPS) ) {
   if (! check_user_has_group(NEED_GROUPS) ) {
      show_forbidden ();
exit; }}
if ( defined('DENIED_GROUPS') && '' != trim(DENIED_GROUPS) ) {
   if (check_user_has_group(DENIED_GROUPS) ) {
      show_forbidden ();
exit; }}
if ( check_user_forbidden () ) {
      session_destroy();
      show_forbidden ();
exit; }
$_SESSION['last_action'] = time();
// Kein Exit, da das aufrufende Skript weiter arbeiten muss!
// Funktionen:
function check_user_has_group($list) { $ar=explode(',', $list);
foreach ($ar as $group) {
      $group=trim($group);
      if ( isset($_SESSION['groups'][$group]) && $_SESSION['groups'][$group]) {
return true; return false;
}} }
function check_user_forbidden() { $ar=file(DENIED_USERS_FILE); foreach ($ar as $line) {
if ( $_SESSION['username'] == trim($line) ) { return true;
}}
return false; }
function show_forbidden () {
header('HTTP/1.0 403 Forbidden');
header('Expires: Thu, 01-Jan-70 00:00:01 GMT'); header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); header('Cache-Control: no-store, no-cache, must-revalidate'); header('Cache-Control: post-check=0, pre-check=0', false); header('Pragma: no-cache');
print <<<EOF
<html>
  <head>
     <title>403 Forbidden</title>
     <meta name="robots" content="noindex">
     <meta charset="utf-8">
  </head>
  <body>
    <h1>403 Forbidden</h1>
    <p>Sie haben kein Recht, dies zu tun.</p>
  </body>
</html> EOF
;
exit;
}