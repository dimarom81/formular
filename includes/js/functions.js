function loadEditView(element,belegID){
		console.log($(element));
		$(element).removeAttr( "onclick" );
		$elem = $(element);
		var data = {'belegID': belegID};
			
		$.post('index.cfm/bewirtung/edit', data, function(returnData){
						
		if (returnData.error) {
			alert(returnData.message);
		}
		else {
			$("#" + belegID).append(returnData);
		}
	}, "html")	
}

function toggleURL(){
	var actionURL = $('#integerForm').attr('action');
	$('#integerForm').attr('action',$('#integerForm').attr('action2'));
	$('#integerForm').attr('target','_blank');
	$('#integerForm').submit();
	$('#integerForm').attr('action',actionURL);
	$('#integerForm').attr('target','_self');
}