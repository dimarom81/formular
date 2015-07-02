<script>
	$(document).ready(function () {
		$('#tag_bewirtung').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});
		$('#tag_aktuell').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});
			
		$(document).ready(function() {
			var max_fields      = 10; //maximum input boxes allowed
			var wrapper         = $(".input_fields_wrap"); //Fields wrapper
			var add_button      = $(".add_field_button"); //Add button ID
   
			var x = 1; //initlal text box count
			$(add_button).click(function(e){ //on add input button click
				e.preventDefault();
				if(x < max_fields){ //max input box allowed
					x++; //text box increment
					$(wrapper).append('<div><input type="text" name="personen[]"/><a href="#" class="remove_field">Entfernen</a></div>'); //add input box
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
		<div id="anmeldung">#prc.message#
		</div>
	</strong>
	
	</br>
		
	<a href="#event.buildLink('facebook')#" class="btn btn-primary" role="button">Login mit Facebook</a>
		
		<br><br>
		
		<div id="name_and_vorname"></div>
		
	
	<label for="tag">Tag der Bewirtung:</label>
		<div>
			<input type="text" name="tag_bewirtung" id="tag_bewirtung" placeholder="dd/mm/yyyy">
		</div>
		
	<label for="ort">Ort der Bewirtung:</label>
		<div>
			<input type="text" name="ort1" size="20" maxlength="40" placeholder="Name">	
		</div>
		<div>
			<input type="text" name="ort2" size="20" maxlength="40" placeholder="Adresse">	
		</div></br>
		
	<label for="personen">Personen, die bewirtet wurden:</label>
		
	<div class="input_fields_wrap"> 
	  	<button class="add_field_button btn btn-info">Weitere Personen hinzufügen</button>
    	<div><input type="text" name="personen[]"></div>		
	</div>	
		
		
	<label for="anlass">Anlass der Bewirtung:</label>
		<div>
			<textarea type="text" name="anlass" rows="3" placeholder="Geschäftstreffen"></textarea>	
		</div>	
		
	<label for="betrag">Höhe der Bewirtung:</label>
		<div>
			<input type="text" name="betrag" size="20" maxlength="10" placeholder="100">	
		</div>
		
	<label for="waehrung">Währung:</label>			
		<select name="waehrung">
			<cfoutput><option value="EUR">EUR</option></cfoutput>
			<cfoutput><option value="USD">USD</option></cfoutput>
			<cfoutput><option value="GBP">GBP</option></cfoutput>		
		</select>
	
	<div class="radio">
  		<label><input type="radio" name="optradio" checked = "checked">In Restaurationsbetrieben</label>
	</div>
	<div class="radio">
  		<label><input type="radio" name="optradio">Sonstige Bewirtung</label>
	</div>
	
	<label for="ort">Aktueller Ort:</label>
		<div>
			<input type="text" name="ort" id="ort" placeholder="Aktuelles Ort">
		</div>
		
	<label for="datum">Aktuelles Datum:</label>
		<div>
			<input type="text" name="tag_aktuell" id="tag_aktuell" placeholder="dd/mm/yyyy">
		</div></br>
		
		<a href="#event.buildLink('bewirtung/form')#" class="btn btn-success" role="button">Speichern</a>
		<a href="#event.buildLink('bewirtung/form')#" class="btn btn-success" role="button">Drücken</a></br></br></br>
		
		<a href="#event.buildLink('bewirtung/test')#" class="btn btn-info" role="button">TEST</a>
		
		
</div>


</cfoutput>

