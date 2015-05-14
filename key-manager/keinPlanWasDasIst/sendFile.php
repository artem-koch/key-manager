<?php
require_once('auth.php');
if ( isset($_GET['file']) && $_GET['file']) {
   $_GET['file'] = './' . $_GET['file'];
   $forbidden=array('../', '/..', '/.ht');
   $_GET['file']= str_replace($forbidden,'', $_GET['file']);
   if ( is_file($_GET['file']) && is_readable($_GET['file']) ) {
     if ( function_exists('finfo_open') ) {
         $finfo = finfo_open(FILEINFO_MIME_TYPE);
         $mimeType=finfo_file($finfo, $_GET['file']);
     } elseif ( function_exists('mime_content_type') ) {
         $mimeType=mime_content_type($_GET['file']);
     } else {
         $mimeType="application/unknown";
}
} }
show_forbidden ();
?>