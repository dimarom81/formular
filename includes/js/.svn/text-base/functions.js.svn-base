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
	var belegID = $('input[name=belegid]').val();	
	var data = {'picID': picID , 'belegID': belegID};
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