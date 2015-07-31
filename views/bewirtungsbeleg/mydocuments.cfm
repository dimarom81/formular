<cfoutput>	
	<div class="container well" style="margin-bottom:150px;">
	 <h3>Mein Belegarchiv</h3>               
	  <div>		
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<cfloop index="i" array=#prc.belege#>
			  <div class="panel panel-default">
			    <div class="panel-heading" role="tab" id="headingOne">
			      <h4 class="panel-title">			   
					<button role="button" data-toggle="collapse" data-parent="##accordion" href="###i.getID()#" aria-expanded="false" aria-controls="#i.getID()#" class="btn btn-success" onclick="loadEditView(this, #i.getID()#)">
			         #dateTimeFormat(i.getMealDate() , "dd.MM.yyyy")#
			        </button>
			      </h4>
			    </div>
			    <div id="#i.getID()#" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			      <div class="panel-body">
			      </div>
			    </div>
			  </div>
			</cfloop> 
		</div>						
	  </div>
	</div>
</cfoutput>
