﻿<cfoutput>#html.doctype()#<html lang="en"><head>	<meta charset="utf-8">	<title>Bewirtungsbeleg</title>	<meta name="description" content="ContentBox Application Template">    <meta name="author" content="Ortus Solutions, Corp">	<!---Base URL --->	<base href="#getSetting("HTMLBaseURL")#" />		<link rel="stylesheet" type="text/css" href="/includes/css/bootstrap-theme.css">	<link rel="stylesheet" type="text/css" href="/includes/css/bootstrap.css">	<link rel="stylesheet" type="text/css" href="/includes/css/datepicker.css">		<script src="/includes/js/jquery-1.11.3.min.js"></script>	<script src="/includes/js/jquery.validate.js"></script>	<script src="/includes/js/bootstrap.js"></script>	<script src="/includes/js/bootstrap-datepicker.js"></script></head><body data-spy="scroll">	<ul class="nav nav-pills">		<li><a href="#event.buildLink('bewirtung/loginSuccess')#"><span class="glyphicon glyphicon-home"></span>Home</a></li>		<li><a href="#event.buildLink('bewirtung/loginSuccess')#"><span class="glyphicon glyphicon-th"></span>Meine Belege</a></li>		<li><a href="#event.buildLink('bewirtung/loginSuccess')#"><span class="glyphicon glyphicon-edit"></span>Belege bearbeiten</a></li>		<li><a href="#event.buildLink('bewirtung/myprofile')#"><span class="glyphicon glyphicon-user"></span>Meine Daten</a></li>		</ul>	#renderView()#	</body></html></cfoutput>