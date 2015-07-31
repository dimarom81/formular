<script>

	$(document).ready(function () {

		$('#confirm-delete').on('show.bs.modal', function(e) {
            //$(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
			$(this).find('.btn-ok').attr('data-id', $(e.relatedTarget).data('picid'));
        });
		
		$('#confirm-delete-documentation').on('show.bs.modal', function(e) {
			$(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            //console.log("here");
        });
		
		$.MenuOverlay({vertical: 'bottom', horizontal: 'bottom'});	
		
		$('#mealDate').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});
		$('#currentDate').datepicker({
			format: "dd/mm/yyyy", autoclose:"true"
			});			
		 //sanwebe.com/2013/03/addremove-input-fields-dynamically-with-jquery
			var max_fields      = 20; //maximum input boxes allowed
			var wrapper         = $(".input_fields_wrap"); //Fields wrapper
			var add_button      = $(".add_field_button"); //Add button ID
   
			var text_box_count = 1; //initlal text box count			
			var file_count = 1;     //initial file count
			var file_index = 1;     //initial file index count
			
			$(add_button).click(function(e){ //on add input button click
				e.preventDefault();
				if(text_box_count < max_fields){ //max input box allowed
					text_box_count++; //text box increment
					$(wrapper).append('<div><input class="form-control" type="text" name="participants"/><a href="#" class="remove_field">Entfernen</a></div>'); //add input box
				}
			});
   
			$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
				e.preventDefault(); $(this).parent('div').remove(); x--;
			})
									
			//FILES			
			var max_files             = 5; //maximum input files allowed
			var wrapper_files         = $(".input_files_wrap"); //Fields wrapper
			var add_button_files      = $(".add_files_input"); //Add button ID
			  
			$(add_button_files).click(function(e){ //on add input button click
				e.preventDefault();
				if(file_count < max_files){ //max input box allowed
					file_count++; //text box increment
					//documentScan_1//documentScan_2//documentScan_3
					file_index++;
					//console.log(file_count);
					//console.log(file_index);
					var next_index = "documentScan_" + file_index;
					var html_text = '<div><input type="file" class="filestyle" data-buttonBefore="true" data-buttonName="btn-primary" name=' + next_index + '><a href="" class="remove_file">Entfernen</a></div>';
					$(wrapper_files).append(html_text);
					//console.log( $(wrapper_files).find( 'input'));
						
					var options = {
						'input' : $(".filestyle").attr('data-input') === 'false' ? false : true,
						'icon' : $(".filestyle").attr('data-icon') === 'false' ? false : true,
						'buttonBefore' : $(".filestyle").attr('data-buttonBefore') === 'true' ? true : false,
						'disabled' : $(".filestyle").attr('data-disabled') === 'true' ? true : false,
						'size' : $(".filestyle").attr('data-size'),
						'buttonText' : $(".filestyle").attr('data-buttonText'),
						'buttonName' : $(".filestyle").attr('data-buttonName'),
						'iconName' : $(".filestyle").attr('data-iconName'),
						'badge' : $(".filestyle").attr('data-badge') === 'false' ? false : true
					};

					$(wrapper_files).find('input').filestyle(options);
				}
			});
   
			$(wrapper_files).on("click",".remove_file", function(e){ //user click on remove text
				e.preventDefault(); $(this).parent('div').remove(); text_box_count--;file_count--;file_index--;
			})
	});		
</script>


<cfoutput>

<div class="container">
	<div class="well well-sm col-sm-12 col-md-12 text-center">
		<div id="title"><h3>Angaben über Bewirtungsaufwendungen</h3></div>
		
		<cfloop index="i" array=#prc.validationErrors#>
			<cfoutput><div align="left" style="color:red"><em>#i.getMessage()#</em></div></cfoutput>
		</cfloop>
		
	</div>
</div>

	<!---<form id="integerForm" action2="#event.buildlink('bewirtung/generatePDF')#" action="#event.buildlink('bewirtung/overrideDocumentation?belegID=#prc.belegID#')#" method="post" enctype="multipart/form-data" target="_self">--->
	<form id="integerForm" action="#event.buildlink('bewirtung/saveDocumentation')#" action2="#event.buildlink('bewirtung/generatePDF')#" method="post" enctype="multipart/form-data" target="_self" style="margin-bottom:150px;">
	
	<input type="hidden" name="belegid" value="#prc.beleg.getID()#">
	
<div class="container"><!---container_1--->
	<div class="well col-sm-12 col-md-12"><!---well_1--->
				
				
		<div class="form-group col-md-6">
			<label for="tag">Tag der Bewirtung</label>
		  		<div>
		  			<input class="form-control" type="text" name="mealDate" id="mealDate" placeholder="dd/mm/yyyy" value="#dateTimeFormat( prc.beleg.getMealDate(), "dd/MM/yyyy" )#"     >
		 		</div>
		</div>		
	
	<!---<cfdump var = "#prc#">
		<cfabort>--->
			
		<div class="form-group col-md-6">
			<label for="ort">Ort der Bewirtung</label>
		  		<div>
		  			<textarea class="form-control" type="text" name="location" rows="4" placeholder="Adresse"      >#prc.beleg.getLocation()#</textarea>
		 		</div>
		</div>	
			
				
		<div class="form-group col-md-6">
			<label for="participants">Personen, die bewirtet wurden</label>	
				<div class="input_fields_wrap"> 
			  		<button class="add_field_button btn-link">Weitere Personen hinzufügen</button>
		    			<div><input class="form-control" type="text" name="participants" value="#prc.beleg.getParticipants()#"    ></div></br>		
				</div>
		</div>
			
			
		<div class="form-group col-md-12">
			<label for="anlass">Anlass der Bewirtung</label>
				<div>
					<textarea class="form-control" type="text" name="occasion" rows="3" placeholder="Business meeting"     >#prc.beleg.getOccasion()#</textarea>	
				</div>
		</div>	
				
				
		<div class="form-group col-md-3">
			<label for="betrag">Höhe der Bewirtung</label>
				<div>
					<input class="form-control" style="-moz-appearance: textfield" type="number" step="0.01" min="0" name="price" size="10" maxlength="10" placeholder="100.00" value="#prc.beleg.getPrice()#" required>
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
					<input class="form-control" type="text" name="currentLocation" id="currentLocation" placeholder="Frankfurt" value="#prc.beleg.getCurrentLocation()#"     >
				</div>
		</div>	
		
		
		<div class="form-group col-md-6">
		  	<label for="datum">Aktuelles Datum:</label>
				<div>
					<input class="form-control" type="text" name="currentDate" id="currentDate" placeholder="dd/mm/yyyy" value="#dateTimeFormat( prc.beleg.getCurrentDate(), "dd/MM/yyyy" )#"     >
				</div>
		</div>				
		
		
	</div><!---well_3--->
</div><!---container_3--->


<!---modal delete picture--->
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Remove picture</h4>
                </div>
            
                <div class="modal-body">
                    <p>Are you sure you want to delete this picture?</p>           
                    <!---<p class="debug-url"></p>--->
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <a onclick="$('[data-dismiss=modal]').click();removePicture(this)" class="btn btn-danger btn-ok">Delete</a>
                </div>
            </div>
        </div>
    </div>
<!---modal delete picture end--->


<!---modal delete documentation--->
<div class="modal fade" id="confirm-delete-documentation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Remove documentation</h4>
                </div>
            
                <div class="modal-body">
                    <p>Are you sure you want to delete this documentation?</p>           
                    <!---<p class="debug-url"></p>--->
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <a onclick="$('[data-dismiss-documentation=modal]').click()" class="btn btn-danger btn-ok">Delete</a>
                </div>
            </div>
        </div>
    </div>
<!---modal delete documentation end--->


<cfif prc.beleg.isloaded()>
	<div class="container"><!---container_pictures--->
		<div class="well col-md-12 col-md-12"><!---well_pictures--->			
			<div class="form-group col-md-12" id="pictures">
				<cfloop index="i" array=#prc.beleg.getBilder()#>
						<div data-pic="#i.getID()#" class="menu-overlay-container" style="float:left;margin-right:25px;margin-top:25px;">
							<a href="#i.getUUID(true)#"  target="_blank" onclick="window.open('#i.getUUID(true)#', 'popup', 'height=500, width=500'); return false;">
							<div class="menu-overlay"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
													
								<a href="##" data-picid="#i.getID()#" class="btn btn-default" data-toggle="modal" data-target="##confirm-delete"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
							
							</div>
						<img class="to-hover"  src="#i.getUUIDpreview(true)#" alt="#i.getbildName()#">  					
					</div>				
				</cfloop>
			</div>									
		</div><!---well_pictures--->
	</div><!---container_pictures--->
</cfif>







<div class="container"><!---container_4--->
	<div class="well col-md-12 col-md-12"><!---well_4--->			
		<div class="form-group input_files_wrap col-md-12">
			<label for="beleg"></label>	
				<button class="add_files_input btn-link">Weitere Dateien hochladen</button>
			<input type="file" class="filestyle" data-buttonBefore="true" data-buttonName="btn-primary" name="documentScan_1"></br>
		</div>
		
		<p style="margin-left:15px;">
			<i>Unterstützte Dateiformate: jpg, jpeg, png, gif, tiff.</i>
		</p>
									
	</div><!---well_4--->
		
</div><!---container_4--->
	
	

	
<div class="container"><!---container_5--->
	<div class="col-sm-12 col-md-12 text-center"><!---well_5--->	
	
		<cfif prc.user.isloaded()>
			<button type="submit" class="btn btn-success btn-lg" name="submit_upload">
				<span class="glyphicon glyphicon-edit" aria-hidden="true" style="margin-right:5px;">
				</span>Bewirtungsbeleg speichern
			</button>
		</cfif>
		
		<a href="##" onclick="toggleURL(); return false;" class="btn btn-warning btn-lg" role="button">
			<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true" style="margin-right:5px;">
			</span>Als PDF herunterladen</a>
			
		<cfif prc.beleg.isloaded()>
			<a href="##" data-href="#event.buildLink('bewirtung/removeDocumentation?belegID=#prc.beleg.getId()#')#" class="btn btn-danger btn-lg" role="button" data-toggle="modal" data-target="##confirm-delete-documentation">
				<span class="glyphicon glyphicon-remove" aria-hidden="true" style="margin-right:5px;">
			</span>Bewirtungsbeleg löschen</a>
		</cfif>
			
		
	</div><!---well_5--->
</div><!---container_5--->	



	</form>
		
</cfoutput>

