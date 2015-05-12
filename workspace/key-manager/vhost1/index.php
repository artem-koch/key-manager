<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Keymanager</title>
	    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="dist/css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script src="dist/js/jquery-1.11.1.min.js"></script>
	<script src="dist/js/script.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>	
</head>
<body>
	<div class="container">
		<?php include('navigation.php');?>
		<!--<?php include('pizza_sql.php');?>-->
		
		<!--Main-->
		<div class="row content">
			<!--Section Navigation-->
			<div class="col-md-2 col-sm-3 col-xs-9 hidden-print sidenav">
				<nav id="sidenav">
					<ul>
<!-- <?php 
// 						include('pizza_name_sql.php');
// 						while($row = mysql_fetch_object($ergebnis)){
// 							echo "<li><a href=\"$row->name\">$row->name</a></li>";
// 						}?>
-->
					</ul>
				</nav>
			</div>

		<!--/Section Navigation-->
		<!--Site-Content-->
			<div class="col-md-10 col-sm-9 col-xs-12">

<?php
// 	include('pizza_sql.php');

// 	while($row = mysql_fetch_object($ergebnis)){
// 	echo "<div class=\"post\">";
// 	echo "	<p class=\"metainfo\">am 28.8.2014 von klaus</p>";
// 	echo "	<h2 id=\"$row->name\">Pizza $row->name</h2>";
// 	echo "	<div class=\"row\">";
// 	echo "		<div class=\"col-sm-3\">";
// 	echo "			<img src=\"img/$row->name.jpg\" class=\"img-responsive hidden-xs img-rounded\">";
// 	echo "		</div>";
// 	echo "		<div class=\"col-sm-7\">";
// 	echo "			<p>$row->beschreibung</p>";
// 	echo "		</div>"	;		
// 	echo "		<div class=\"col-sm-2\">";
// 	echo "			<p>Preis: $row->preis</p>";
// 	echo "			<p><img src=\"img/bestell.jpg\" class=\"img-responsive\"></p>";
// 	echo "		</div>";
// 	echo "	</div>";
// 	echo "</div>";
// 	echo "";
// 	echo "";
// 	echo "";
// 	}
?>			</div>	
		</div>
		<!--/Main-->	
	</div>
</body>? </html>
