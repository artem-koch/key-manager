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
    $('#example').dataTable( {
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "\data.php"
} );
} );    
</script>
</head>
<body>
	<div id="allDepTable">
    <table class="display" id="example">
        <thead>
            <tr>
                <th>uid</th>
                <th>username</th>
                <th>pw</th>
            </tr>
    </thead>
 
        <tbody>
            <tr>
                <td class="dataTables_empty">Loading data from server</td>
            </tr>
        </tbody>
 
        <tfoot>
            <tr>
                <th>uid</th>
                <th>username</th>
                <th>pw</th>
            </tr>
    </tfoot>
    </table>
</div>

</body>
</html>

