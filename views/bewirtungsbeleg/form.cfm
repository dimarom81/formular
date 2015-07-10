<script>
	$(document).ready(function () {
		$('#mealDate').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});
		$('#currentDate').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});
			
		$(document).ready(function() { //sanwebe.com/2013/03/addremove-input-fields-dynamically-with-jquery
			var max_fields      = 20; //maximum input boxes allowed
			var wrapper         = $(".input_fields_wrap"); //Fields wrapper
			var add_button      = $(".add_field_button"); //Add button ID
   
			var x = 1; //initlal text box count
			$(add_button).click(function(e){ //on add input button click
				e.preventDefault();
				if(x < max_fields){ //max input box allowed
					x++; //text box increment
					$(wrapper).append('<div><input class="form-control" type="text" name="participants"/><a href="#" class="remove_field">Entfernen</a></div>'); //add input box
				}
			});
   
			$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
				e.preventDefault(); $(this).parent('div').remove(); x--;
			})
		});			  
	});
	

	
</script>



<cfoutput>


<!---<div class="container">
	<div class="well well-sm col-sm-12 col-md-12">
		<strong><div id="greetings">#prc.greetings# (Temp)</div></strong>
	</div>
</div>--->


<div class="container">
	<div class="well well-sm col-sm-12 col-md-12 text-center">
		<div id="title"><h3>Angaben über Bewirtungsaufwendungen</h3></div>
	</div>
</div>


<form id="integerForm" action="#event.buildlink('bewirtung/saveDocumentation')#" method="post" enctype="multipart/form-data">
	
<div class="container"><!---container_1--->
	<div class="well col-sm-12 col-md-12"><!---well_1--->
				
				
		<div class="form-group col-md-6">
			<label for="tag">Tag der Bewirtung</label>
		  		<div>
		  			<input class="form-control" type="text" name="mealDate" id="mealDate" placeholder="dd/mm/yyyy">
		 		</div>
		</div>	
			
			
		<div class="form-group col-md-6">
			<label for="ort">Ort der Bewirtung</label>
		  		<div>
		  			<textarea class="form-control" type="text" name="location" rows="4" placeholder="Adresse"></textarea>
		 		</div>
		</div>	
			
			
			
		
			
			
			
		<div class="form-group col-md-6">
			<label for="participants">Personen, die bewirtet wurden</label>	
				<div class="input_fields_wrap"> 
			  		<button class="add_field_button btn-link">Weitere Personen hinzufügen</button>
		    			<div><input class="form-control" type="text" name="participants"></div></br>		
				</div>
		</div>
		
		
		
		
		
		
		
		
		
			
			
			
		<div class="form-group col-md-12">
			<label for="anlass">Anlass der Bewirtung</label>
				<div>
					<textarea class="form-control" type="text" name="occasion" rows="3" placeholder="Business meeting"></textarea>	
				</div>
		</div>	
				
				
		<div class="form-group col-md-3">
			<label for="betrag">Höhe der Bewirtung</label>
				<div>
					<input class="form-control" style="-moz-appearance: textfield" type="number" step="0.01" min="0" name="price" size="10" maxlength="10" placeholder="100" value="100">	
				</div>
		</div>
		
			
			
				
		<div class="form-group col-md-2">
			<label for="currency">Währung</label>			
				<select class="form-control" name="currency">
					<option value="EUR">EUR</option>
					<option value="USD">USD</option>
					<option value="GBP">GBP</option>
					<option value="JPY">JPY</option>
					<option value="RUB">RUB</option>
				</select>
		</div>			


	</div><!---well_1--->
</div><!---container_1--->	






<div class="container"><!---container_2--->
	<div class="well col-sm-12 col-md-12"><!---well_2--->			
			
		<div class="form-group col-md-3 radio-inline">
			<label for="Restaurant">
				<input type="radio" name="restaurant" checked = "checked" value="1">In Restaurationsbetrieben
			</label>	
		</div>		
		
		
		<div class="form-group col-md-3 radio-inline">
		  	<label for="Sonstige">
		  		<input type="radio" name="restaurant" value="0">Sonstige Bewirtung
			</label>	
		</div>		
		
		
	</div><!---well_2--->
</div><!---container_2--->		




<div class="container"><!---container_3--->
	<div class="well col-sm-12 col-md-12"><!---well_3--->			
		
			
		<div class="form-group col-md-6">
			<label for="ort">Aktueller Ort:</label>
				<div>
					<input class="form-control" type="text" name="currentLocation" id="currentLocation" placeholder="Frankfurt">
				</div>
		</div>	
		
		
		<div class="form-group col-md-6">
		  	<label for="datum">Aktuelles Datum:</label>
				<div>
					<input class="form-control" type="text" name="currentDate" id="currentDate" placeholder="dd/mm/yyyy">
				</div>
		</div>				
		
		
	</div><!---well_3--->
</div><!---container_3--->



<div class="container"><!---container_4--->
	<div class="well col-md-12 col-md-12"><!---well_4--->			
		<div class="form-group col-md-5">
			<label for="beleg">Rechnung hochladen:</label>
			<!---<input id="input-1" type="file" class="file" name="documentScan">--->
			<input type="file" class="filestyle" data-buttonBefore="true" data-buttonName="btn-primary" name="documentScan">
			<input type="file" class="filestyle" data-buttonBefore="true" data-buttonName="btn-primary" name="documentScan">
		</div>						
	</div><!---well_4--->
</div><!---container_4--->				
	
	
	
	
	
	

	
<div class="container"><!---container_5--->
	<div class="col-sm-12 col-md-12 text-center"><!---well_5--->			
		<input type="submit" class="btn btn-success btn-lg" value="Bewirtungsbeleg speichern" name="submit_upload"/>
		<a href="#event.buildLink('bewirtung/form')#" class="btn btn-warning btn-lg" role="button">Als PDF herunterladen</a>
		
		
	</div><!---well_5--->
</div><!---container_5--->		


		<strong>		
			<div id="warning1">#prc.warning1#
			</div>
		</strong>

	</form>
		
</cfoutput>

