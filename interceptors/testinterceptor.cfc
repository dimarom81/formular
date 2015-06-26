component extends="coldbox.system.Interceptor"{
	function configure(){
		
		
	}
	
	
	function afterConfigurationLoad(){
		
	}
	
	
	 function facebookLoginSuccess(event,interceptData){
        writeDump(interceptData);
        	writeOutput('test12');
        	abort;
    }
			
}