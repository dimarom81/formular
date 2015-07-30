//log error. Error CFM has no logic
component output="false" singleton{
	property name="buglog" inject="coldbox:myplugin:BugLog";
	property name="isDevEnv" inject="coldbox:setting:isDevEnv";
	
	function onException(event,rc,prc){
		rc = event.getCollection();
		//Grab Exception From request collection, placed by ColdBox
		var exceptionBean = event.getValue("ExceptionBean");
		buglog.getLogger().logCFCATCH(exceptionBean.getExceptionStruct());
		if(isDevEnv and false){
			writeDump(exceptionBean.getExceptionStruct()); 
			abort;
		}
		//check if AJAX call was done, return nothing instead of error page!!!
		if(event.isAJAX()){
			event.renderData(type="json",data='');			
			abort;
		}
		else{
			//show error page!
			event.setView( view="bewirtungsbeleg/error");
		}
	}
}