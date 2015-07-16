<script>
	function loadEditView(belegID){
		
		var data = {'belegID': belegID};
		
		$.post('index.cfm/bewirtung/edit', data, function(returnData){
		
			if (returnData.error) {
				alert(returnData.message);
			}
			else { 
				$("#edit").html(returnData);
			}
		}, "html")
		
	}
</script>


<!---<cfdump var = "#i#"><cfabort>--->

<cfoutput>



<div class="container">
  <h3>Mein Belegarchiv</h3>
  
 
                   
  <table class="table table-striped">
    <thead>
    </thead>
    <tbody>

		<cfloop index="i" array=#prc.belege#>
			<tr>
		        <td>
		        	<button type="button" class="btn btn-success" role="button" id ="#i.getID()#" onclick="loadEditView(#i.getID()#)"><cfoutput>#dateTimeFormat(i.getMealDate() , "dd.MM.yyyy")#</cfoutput></button>
				</td>	
		    </tr>
		</cfloop>
	
  
    </tbody>
  </table>
</div>


				<div class="container">
					<div id="edit"></div>
  				</div>  



</cfoutput>
