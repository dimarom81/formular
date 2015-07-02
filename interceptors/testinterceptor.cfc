component extends="coldbox.system.Interceptor"{	
	property name="userBewirtungService" inject="id:userBewirtungService";
	
	function configure(){
		
		
	}
	
	
	function afterConfigurationLoad(){
		
	}
	
	
	 function facebookLoginSuccess(event,interceptData){ 
	
		var temp = userBewirtungService.findAllWhere( criteria = { referenceID = arguments.interceptData.referenceID } );
			
		//if( ArrayLen(temp) eq 0){		
		if( !ArrayLen(temp) or (ArrayLen(temp) AND  isNull(temp[1].getreferenceID()))){
		
		 	prc.user = userBewirtungService.populate( target = userBewirtungService.new(),memento = interceptData ,include= "referenceID,first,last,gender,locale,socialservice,email");
			userBewirtungService.saveUser(prc.user);
		}
		else{
			userBewirtungService.populate( target = temp[1], memento = interceptData ,include= "referenceID,first,last,gender,locale,socialservice,email");
			userBewirtungService.saveUser(temp[1]);
		}

        flash.put(name="loginText",value ="You are logged in as "& interceptData.first &" "& interceptData.last);
     }
		
}