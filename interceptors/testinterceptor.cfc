component extends="coldbox.system.Interceptor"{
	function configure(){
		
		
	}
	
	
	function afterConfigurationLoad(){
		
	}
	
	
	 function facebookLoginSuccess(event,interceptData){ 
	 	//writeDump(interceptData);abort;
	 	prc = event.getCollection(private=true);	
        var service = getModel( "userBewirtungService" );
        //writeDump(service);abort;      
        flash.put(name="loginText",value ="You are logged in as "& interceptData.first &" "& interceptData.last);
        service.saveUser(interceptData.referenceID,interceptData.first,interceptData.last,interceptData.gender,interceptData.locale,interceptData.socialservice);
    }
		
}