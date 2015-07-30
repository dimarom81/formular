<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Bewirtungsbeleg</title>
	<meta name="description" content="ContentBox Application Template">
    <meta name="author" content="Ortus Solutions, Corp">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="/includes/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="/includes/css/bootstrap.min.css">
	
	<script src="/includes/js/jquery-1.11.3.min.js"></script>
	<script src="/includes/js/bootstrap.min.js"></script>

</head>

<body data-spy="scroll">

	<div class="container">
		<div class="well well-sm col-sm-12 col-md-12 text-center">
			<div id="title"><h3>#event.getCollection(private=true).errorMessage#</h3><br>
			<p>
				<a href="#event.buildlink('bewirtung/form')#">Zurück zur Startseite</a>
			</p>
			</div>			
		</div>
	</div>

</body>
</html>
</cfoutput>