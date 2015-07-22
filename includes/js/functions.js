function loadEditView(element,belegID){
		//console.log(element);
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