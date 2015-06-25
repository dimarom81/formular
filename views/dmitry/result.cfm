
<div class="form-group">
<div class="container-fluid">
  <div class="row">
	  <div class="panel panel-default">  
		<div class="panel-heading">Ergebnis:</div>
		  <div class="panel-body">
				   
				
				Herr <cfoutput>#name# #vorname#:</cfoutput><br>
				Zu zahlen: <cfoutput>#prc.countries.finalPrice(rc.land, rc.number)#</cfoutput> <br><br>
				
				<cfform class="navbar-form navbar-left" action="/index.cfm/dmitry/formular" method="post"> 
					<cfinput class="btn btn-success" type="Submit" name="SubmitForm2" value="Reset"> 
				</cfform>
		  </div>
	</div>
  </div>
</div>
</div>



<!--
<div class="col-sm-6 col-md-2">
	<div class="form-group">
				   
				
				Herr <cfoutput>#name# #vorname#:</cfoutput><br>
				Zu zahlen: <cfoutput>#prc.countries.finalPrice(rc.land, rc.number)#</cfoutput> <br><br>
				
				<cfform class="navbar-form navbar-left" action="/index.cfm/dmitry/formular" method="post"> 
					<cfinput class="btn btn-success" type="Submit" name="SubmitForm2" value="Reset"> 
				</cfform>
		 
	</div>
  </div>
-->	
	
	
