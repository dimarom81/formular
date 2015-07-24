<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Bewirtungsbeleg</title>
	<meta name="description" content="ContentBox Application Template">
    <meta name="author" content="Ortus Solutions, Corp">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<base href="http://akidmitry.local/" />
	
<!---	<link rel="stylesheet" type="text/css" href="http://akidmitry.local/includes/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="http://akidmitry.local/includes/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="http://akidmitry.local/includes/css/datepicker.css">
	<link rel="stylesheet" media="all" type="text/css" href="http://akidmitry.local/includes/css/overlay.css">
	--->

	<script src="http://akidmitry.local/includes/js/jquery-1.11.3.min.js"></script>
	<script src="http://akidmitry.local/includes/js/jquery.validate.js"></script>
	<script src="http://akidmitry.local/includes/js/bootstrap.min.js"></script>
	<script src="http://akidmitry.local/includes/js/bootstrap-confirmation.js"></script>
	<script src="http://akidmitry.local/includes/js/bootstrap-datepicker.js"></script>
	<script src="http://akidmitry.local/includes/js/bootstrap-filestyle.js"></script>
	<script src="http://akidmitry.local/includes/js/jquery.menu.overlay.js"></script>
	<script src="http://akidmitry.local/includes/js/functions.js"></script>
	<style type="text/css">
	
	
		
		@import url("http://akidmitry.local/includes/css/datepicker.css");
		@import url("http://akidmitry.local/includes/css/overlay.css");
		
		table.gridtable {
		font-family: verdana,arial,sans-serif;
		font-size:11px;
		color:#333333;
		border-width: 1px;
		border-color: #666666;
		border-collapse: collapse;
	}
	table.gridtable th {
		border-width: 1px;
		padding: 12px;
		border-style: solid;
		border-color: #666666;
		background-color: #dedede;
	}
	table.gridtable td {
		border-width: 1px;
		padding: 12px;
		border-style: solid;
		border-color: #666666;
		background-color: #ffffff;
	}
	</style>

</head>

<cfoutput>

<body data-spy="scroll">
	
	<h3 align="center">Angaben ueber Bewirtungsaufwendungen</h3>
	
<table class="gridtable" style="width:100%">
  <tr>
    <td><strong>Tag der Bewirtung</strong></td>
    <td><strong>Ort der Bewirtung</strong></td>
  </tr>
  <tr>
    <td>#prc.mealDate#</td>
    <td>#prc.location#
	</td>
  </tr>
  <tr>
    <td colspan="2"><strong>Personen, die bewirtet wurden</strong></td>
  </tr>
  <tr>
     <td colspan="2">#prc.participants#</td>
  </tr>  
 
  <tr>
     <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
     <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
     <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><strong>Anlass der Bewirtung</strong></td>
  </tr>
  <tr>
     <td colspan="2">#prc.occasion#</td>
  </tr>
  <tr>
     <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
     <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
     <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Hoehe der Bewirtung:</strong></td>
	<td>#prc.price# EUR</td>
  </tr>
  <tr>
     <td colspan="2">#prc.restaurant#</td>
  </tr>
  <tr>
    <td><strong>Ort, Datum: #prc.currentLocation#, den #prc.currentDate#</strong></td>
    <td><strong>Unterschrift:</strong></td>
  </tr>
 
  
  
  
</table>
	
	
	
	
</cfoutput>

		
	
</body>
</html>
