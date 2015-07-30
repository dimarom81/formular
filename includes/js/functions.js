//sending belegID to the action "edit"
function loadEditView(element,belegID){
		//console.log($(element));
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
	$('#integerForm').attr('action', $('#integerForm').attr('action2'));
	$('#integerForm').attr('target', '_blank');
	$('#integerForm').submit();
	$('#integerForm').attr('action', actionURL);
	$('#integerForm').attr('target', '_self');
}

function removePicture(btn){					
	var picID = $(btn).attr("data-id");			
	var data = {'picID': picID};
		$.post('index.cfm/bewirtung/removeImage', data, function(returnData){
		if (returnData.error) {
			alert(returnData.message);
		}
		else {
			if(returnData == true){
				$(".menu-overlay-container[data-pic="+picID+"]").remove();
				console.log(1);
			}
			else{
				alert("Error removing the image");
				console.log(2);
			}
		}
	}, "json")
}