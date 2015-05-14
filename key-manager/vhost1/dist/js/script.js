$(document).ready(function(){
	
	$('.nav > li').hover
	(
		function(){			
			$(this).addClass('active');
		},
		function(){
			$(this).removeClass('active');
		}
	);

	title=document.title;

	if(document.title == 'KAS Bruchsal')
	{
		$('#position').html('<a href=\'index.php\'>Intro</a>');
	}
	else
	{
		$('#position').html('<a href=\'index.php\'>Home</a> → '+ title);
	}



});