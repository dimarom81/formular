


<style>
	.navbar-form .control-label {
	    margin-bottom: 0;
	    margin-left: -6px;
	    padding-top: 7px;
	    vertical-align: middle;
	}	
</style>

<script>
	function testFunction(){
		
		var data = {'countryname': $("select[name='land']").val()};
		
		$.post('index.cfm/dmitry/myFunktion', data, function(returnData){
		
			if (returnData.error) {
				alert(returnData.message);
			}
			else {
				$("#mwst").val(returnData);
			}
		}, "json")
	}//end testFunction
				
	function testFunction2(){
					
	$("#res").html('');
					
	$("#myForm").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
			},
			vorname: {
				required: true,
				minlength: 2
			},
			number: {
				number: true,
				min: 0
			}
		},
		
		messages: {
			name: {
				required:  "Bitte geben Sie Ihren Namen an",
				minlength: "Der Name ist zu kurz"
			},
			vorname: {
				required:  "Bitte geben Sie Ihren Namen an",
				minlength: "Der Name ist zu kurz"
			},
			number: {
				number:  "Es muss eine Zahl eingegeben werden",
				min: "Die Zahl muss positiv sein"
			}
		}
	});
		
	var data = {'name': $("input[name='name']").val(),
				'vorname': $("input[name='vorname']").val(),
				'land': $("select[name='land']").val(),
				'number': $("input[name='number']").val() };
					
		if($("input[name='name']").valid() == true && 
		   $("input[name='vorname']").valid()==true&&
		   $("input[name='number']").valid()==true){
							
			$.post('index.cfm/dmitry/result', data, function(returnData){
		
			$("#res").html(returnData); 
			}, "html")
		}//end if
	}//end testFunction2
</script>




<!--

<div class="container-fluid">
	<div class="row">
		<form class="navbar-form navbar-left" id = "myForm" action="index.cfm/dmitry/formular" method="post">
			<p>
			
				
				<div class="form-group">
					<label for="name">
						Name:
					</label>
					<input type="text" class="form-control" name="name" size="20" maxlength="20" >
				</div>
				
				
				<div class="form-group">
					<label for="vorname">
						Vorname:
					</label>
					<input type="text" class="form-control" name="vorname" size="20" maxlength="20">
				</div>
			</p>
			
			
			
			
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="land">
					Land:
				</label>
				<div class="col-sm-6 col-md-2">
					<select name="land" class="form-control" onchange="testFunction()">
						<cfloop index="i" array=#prc.countries.getAll()#>
							<cfoutput>								
								<option value="#i.getShortname()#">
									#i.getName()#
								</option>
							</cfoutput>
						</cfloop>
					</select>
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="mwst">
					MwSt:
				</label>
				<input id="mwst" type="text" class="form-control" name="mwst"
				       size="5" value="" readonly>
			</div>
			
			<br>
			<br>
			
			
			<div class="form-group">
				<label class="control-label2" for="zahl">Zahl:</label>
				<input type="text" class="form-control" name="number" size="20"
				       maxlength="25">
			</div>
			
			<input class="btn btn-success" name="SubmitForm" value="Ok" onclick="testFunction2()">
		</form>
	</div>
	
	<div class="row">
		<div class="form-group">
			<div class="cl" id="res">
				
			</div>
		</div>
	</div>
</div>

-->





<div class="col-sm-6 col-md-2">
	
<form role="form" id = "myForm" action="index.cfm/dmitry/formular" method="post">
	
	<div class="form-group">
		<label for="name">Name:</label>
		<input type="text" class="form-control" name="name" size="20" maxlength="20" >
	</div>
  
	<div class="form-group">
		<label for="vorname">Vorname:</label>
		<input type="text" class="form-control" name="vorname" size="20" maxlength="20">
	</div>
  
	<div class="form-group">
		<label for="land">Land:</label>			
			<select name="land" class="form-control" onchange="testFunction()">
				<cfloop index="i" array=#prc.countries.getAll()#>
					<cfoutput><option value="#i.getShortname()#">#i.getName()#</option></cfoutput>
				</cfloop>
			</select>				
	</div>

	<div class="form-group">
		<label for="mwst">MwSt:</label>
			<input id="mwst" type="text" class="form-control" name="mwst" size="5" value="" readonly>
	</div>

	<div class="form-group">
		<label for="zahl">Zahl:</label>
		<input type="text" class="form-control" name="number" size="20" maxlength="25">
	</div>
	
	<div class="form-group">
		<input class="btn btn-success" name="SubmitForm" value="Ok" onclick="testFunction2()">
 	</div>
</form>

<div class="form-group">
	<div id="res"></div>
</div>


</div> 


	





















<!--ajax test
    <input id="testButton" class="btn btn-primary" name="SubmitFormTest" value="Ajax test" onclick = "testFunction2()">
    
    
	
	
	
	<form role="form">	
<div class="col-sm-6 col-md-2">	
	
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd">
  </div>
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
  
</div> 
</form>-->