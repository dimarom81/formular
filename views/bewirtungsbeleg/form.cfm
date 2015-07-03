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
					$(wrapper).append('<div><input type="text" name="participants"/><a href="#" class="remove_field">Entfernen</a></div>'); //add input box
				}
			});
   
			$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
				e.preventDefault(); $(this).parent('div').remove(); x--;
			})
		});
		
			  
	});
</script>

<cfoutput>

<div class="well col-sm-6 col-md-2  sandbox-form">
	<strong>		
		<div id="greetings">#prc.greetings#
		</div>
	</strong>
	
	</br>
		
	<a href="#event.buildLink('facebook')#" class="btn btn-primary" role="button">Login mit Facebook</a>
	<a href="#event.buildLink('bewirtung/logout')#" class="btn btn-danger" role="button">Logout</a>
		
		<br><br>
		
		<!---<div id="name_and_vorname"></div>--->
	
	
	
	<form action="#event.buildlink('bewirtung/saveDocumentation')#" method="post">
		
	
	<label for="tag">Tag der Bewirtung:</label>
		<div>
			<input type="text" name="mealDate" id="mealDate" placeholder="dd/mm/yyyy">
		</div>
		
	<label for="ort">Ort der Bewirtung:</label>
		<div>
			<input type="text" name="location1" size="20" maxlength="40" placeholder="Name">	
		</div>
		<div>
			<input type="text" name="location2" size="20" maxlength="40" placeholder="Adress">	
		</div></br>
		
	<label for="participants">Personen, die bewirtet wurden:</label>
		
	<div class="input_fields_wrap"> 
	  	<button class="add_field_button btn btn-info">Weitere Personen hinzufügen</button>
    	<div><input type="text" name="participants"></div>		
	</div>	
		
		
	<label for="anlass">Anlass der Bewirtung:</label>
		<div>
			<textarea type="text" name="occasion" rows="3" placeholder="Business meeting"></textarea>	
		</div>	
		
	<label for="betrag">Höhe der Bewirtung:</label>
		<div>
			<input type="text" name="price" size="20" maxlength="10" placeholder="100" value="100">	
		</div>
		
	<label for="waehrung">Währung:</label>			
		<select name="waehrung">
			<cfoutput><option value="EUR">EUR</option></cfoutput>
			<cfoutput><option value="USD">USD</option></cfoutput>
			<cfoutput><option value="GBP">GBP</option></cfoutput>		
		</select>
	
	<div class="radio">
  		<label><input type="radio" name="restaurant" checked = "checked" value="1">In Restaurationsbetrieben</label>
	</div>
	<div class="radio">
  		<label><input type="radio" name="restaurant" value="0">Sonstige Bewirtung</label>
	</div>
	
	<label for="ort">Aktueller Ort:</label>
		<div>
			<input type="text" name="currentLocation" id="currentLocation" placeholder="Frankfurt">
		</div>
		
	<label for="datum">Aktuelles Datum:</label>
		<div>
			<input type="text" name="currentDate" id="currentDate" placeholder="dd/mm/yyyy">
		</div></br>
		
		<!---<a href="#event.buildLink('bewirtung/form')#" class="btn btn-success" role="button">Speichern</a>--->
		<input type="submit" class="btn btn-success" value="Speichern" />
		<a href="#event.buildLink('bewirtung/form')#" class="btn btn-success" role="button">Drücken</a></br>
		
		<strong>		
			<div id="warning1">#prc.warning1#
			</div>
		</strong>
		
		
			<!---<input type="text" name="current_location" id="current_location2" placeholder="testField">--->
			<!---<input type="submit" value="TestButton" />--->
		</form>
		
</div>


</cfoutput>

