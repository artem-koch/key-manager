<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
       "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<?php 
session_start(); 
?> 

<?php 
if(!isset($_SESSION["username"])) 
   { 
   echo "Bitte erst <a href=\"login.html\">einloggen</a>"; 
   exit; 
   } 
?>
<title>�bersicht mit Suche</title>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="./DataTables-1.10.7/media/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="./DataTables-1.10.7/media/js/jquery.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="./DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
</head>
<body>
	<table id="example" class="display" cellspacing="0" width="100%">
	<script type="text/javascript">
        $(document).ready(function () {
    $('#example').dataTable();
});
 
$(document).ready(function() {
    $('#example').dataTable( {
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "./data.php"
    } );
} );
</script>
    </table>

</body>
</html>

