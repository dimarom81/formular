<script>
	function loadEditView(){
		
		var data = {'a': 'a'};
		
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
		        	<a href="#event.buildlink('bewirtung/form')#" class="btn btn-success" role="button" onclick="loadEditView()"><cfoutput>#dateTimeFormat(i.getMealDate() , "dd.MM.yyyy")#</cfoutput></a>
				</td>
		        <td style="text-align: right">
		        	
		        	<picture>
		        		<a href="includes/img/B4FA4ADC-F3F0-1C01-79D33BEFFDE8AD2B.jpg" target="_blank" onclick="window.open('includes/img/B4FA4ADC-F3F0-1C01-79D33BEFFDE8AD2B.jpg', 'popup', 'height=500, width=500'); return false;">
					  		<img src="includes/img/B4FA4ADD-FA3C-F13A-ED25FF27EAF6A426.jpg" alt="Scan">
					   	</a> 
					</picture>
					
					<picture>
		        		<a href="includes/img/B4FA4ADC-F3F0-1C01-79D33BEFFDE8AD2B.jpg" target="_blank" onclick="window.open('includes/img/B4FA4ADC-F3F0-1C01-79D33BEFFDE8AD2B.jpg', 'popup', 'height=500, width=500'); return false;">
					  		<img src="includes/img/B4FA4ADD-FA3C-F13A-ED25FF27EAF6A426.jpg" alt="Scan">
					   	</a> 
					</picture>
					
					<picture>
		        		<a href="includes/img/B4FA4ADC-F3F0-1C01-79D33BEFFDE8AD2B.jpg" target="_blank" onclick="window.open('includes/img/B4FA4ADC-F3F0-1C01-79D33BEFFDE8AD2B.jpg', 'popup', 'height=500, width=500'); return false;">
					  		<img src="includes/img/B4FA4ADD-FA3C-F13A-ED25FF27EAF6A426.jpg" alt="Scan">
					   	</a> 
					</picture>	
					
					
											
				</td>
		    </tr>
			
			
			
		</cfloop>
		
		
		<div id="edit"></div>
		
		
		
		
      <!---<tr>
        <td>
        	<a href="" class="btn btn-success" role="button">20/06/2015</a>
		</td>
        <td style="text-align: right">
        	
		</td>
      </tr>
	  
	  
	  
      <tr>
        <td>
        	<a href="" class="btn btn-success" role="button">23/06/2015</a>
		</td>
        <td style="text-align: right">
        	<a href="" class="btn btn-primary" role="button">PDF herunterladen</a>
			<a href="" class="btn btn-warning" role="button">Bearbeiten</a>
			<a href="" class="btn btn-danger" role="button">Löschen</a>
		</td>
      </tr>
      <tr>
        <td>
        	<a href="" class="btn btn-success" role="button">29/06/2015</a>
		</td>
        <td style="text-align: right">
        	<a href="" class="btn btn-primary" role="button">PDF herunterladen</a>
			<a href="" class="btn btn-warning" role="button">Bearbeiten</a>
			<a href="" class="btn btn-danger" role="button">Löschen</a>
		</td>
      </tr>
	  <tr>
        <td>
        	<a href="" class="btn btn-success" role="button">03/07/2015</a>
		</td>
        <td style="text-align: right">
        	<a href="" class="btn btn-primary" role="button">PDF herunterladen</a>
			<a href="" class="btn btn-warning" role="button">Bearbeiten</a>
			<a href="" class="btn btn-danger" role="button">Löschen</a>
		</td>
      </tr>
	  <tr>
        <td>
        	<a href="" class="btn btn-success" role="button">05/07/2015</a>
		</td>
        <td style="text-align: right">
        	<a href="" class="btn btn-primary" role="button">PDF herunterladen</a>
			<a href="" class="btn btn-warning" role="button">Bearbeiten</a>
			<a href="" class="btn btn-danger" role="button">Löschen</a>
		</td>
      </tr>--->
	  
	  
	  
    </tbody>
  </table>
</div>



</cfoutput>
