<script>
	
	$('#belegID').on('shown.bs.collapse', function () {
 		console.log("here1");
	})
	
	$('#belegID').on('hidden.bs.collapse', function () {
 		console.log("here2");
	})
	
	
	function loadEditView(element,belegID){
		console.log(element);
		$elem = $(element);
		var data = {'belegID': belegID};

		
		$.post('index.cfm/bewirtung/edit', data, function(returnData){
					
			if (returnData.error) {
				alert(returnData.message);
			}
			else { 
				$elem.parent().append(returnData);
			}
		}, "html")	
	}
	
	
	
</script>


<!---<cfdump var = "#i#"><cfabort>--->

<cfoutput>



<div class="container well">
 <h3>Mein Belegarchiv</h3>               
  <div>
		<!---<cfloop index="i" array=#prc.belege#>
			<div class="row well  well-lg">
		        <span>
		        	<button style="margin-bottom:5px;" type="button" class="btn btn-success" role="button" id ="#i.getID()#" onclick="loadEditView(this,#i.getID()#)"><cfoutput>#dateTimeFormat(i.getMealDate() , "dd.MM.yyyy")#</cfoutput></button>
				</span>	
		    </div>			
		</cfloop>--->
		
		
		<!--- teste --->
		
<div class="panel-group" id="accordion">
	
	<cfloop index="i" array=#prc.belege#>
		
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <!---<a  data-toggle="collapse" data-parent="##accordion" data-target="###i.getID()#">
		          #dateTimeFormat(i.getMealDate() , "dd.MM.yyyy")#
		        </a>--->
				<button data-toggle="collapse" data-parent="##accordion" data-target="###i.getID()#" type="button" class="btn btn-success" role="button" id ="#i.getID()#" onclick="loadEditView(this,#i.getID()#)"><cfoutput>#dateTimeFormat(i.getMealDate() , "dd.MM.yyyy")#</cfoutput></button>
		      </h4>
		    </div>
		    <div id="#i.getID()#" class="panel-collapse collapse">
		      <div class="panel-body">
		      	<!--- hier kommt der beleg --->		        
		      </div>
		    </div>
		  </div>
	
	</cfloop>	  
  
</div>			

		
		<!--- teste ende  --->
  </div>
</div>


</cfoutput>
