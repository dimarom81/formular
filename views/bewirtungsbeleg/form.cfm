<cfoutput>Hier kommt der Bewirtungsbeleg:</cfoutput><br><br><br>

<div class="well col-sm-6 col-md-2  sandbox-form">
	<label for="tag">Tag:</label>
		<div>
			<input type="text" id="tag" placeholder="dd/mm/yyyy">
		</div>
		
	<label for="ort">Ort:</label>
		<div>
			<input type="text" name="ort1" size="20" maxlength="40" placeholder="Name">	
		</div>
		<div>
			<input type="text" name="ort2" size="20" maxlength="40" placeholder="Adresse">	
		</div>
		
	<label for="anlass">Anlass:</label>
		<div>
			<input type="text" name="anlass" size="20" maxlength="128" placeholder="Geschäftstreffen">	
		</div>	
		
	<label for="betrag">Betrag:</label>
		<div>
			<input type="text" name="anlass" size="20" maxlength="10" placeholder="100">	
		</div>		
			
</div> 



<script>
	$(document).ready(function () {
		$('#tag').datepicker({
			format: "dd/mm/yyyy"
			});  
		});
</script>

<!--test-->