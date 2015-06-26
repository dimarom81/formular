<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=1662438727325970";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>





<cfoutput>Hier kommt der Bewirtungsbeleg:</cfoutput><br><br><br>

<div class="well col-sm-6 col-md-2  sandbox-form">
	
	<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true"></div>
		<br><br>
	
	<label for="tag">Tag der Bewirtung:</label>
		<div>
			<input type="text" name="tag" id="tag" placeholder="dd/mm/yyyy">
		</div>
		
	<label for="ort">Ort der Bewirtung:</label>
		<div>
			<input type="text" name="ort1" size="20" maxlength="40" placeholder="Name">	
		</div>
		<div>
			<input type="text" name="ort2" size="20" maxlength="40" placeholder="Adresse">	
		</div>
		
	<label for="anlass">Anlass der Bewirtung:</label>
		<div>
			<input type="text" name="anlass" size="20" maxlength="128" placeholder="Geschäftstreffen">	
		</div>	
		
	<label for="betrag">Höhe der Bewirtung:</label>
		<div>
			<input type="text" name="anlass" size="20" maxlength="10" placeholder="100">	
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
	
	<label for="datum">Datum:</label>
		<div>
			<input type="text" name="datum" id="datum" placeholder="dd/mm/yyyy">
		</div>
	
	
	
			
</div> 



<script>
	$(document).ready(function () {
		$('#tag').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});
		$('#datum').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});  
		});
</script>

<!--test-->