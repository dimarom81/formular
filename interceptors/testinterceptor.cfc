component extends="coldbox.system.Interceptor"{	
	property name="userBewirtungService" inject="id:userBewirtungService";
	property name="sessionStorage"  inject="coldbox:plugin:SessionStorage";
	
	function configure(){
		
		
	}
	
	function preProcess( event, interceptData ) {		
		var userid	= sessionStorage.getVar( "currentUserReferenceID" );
		var prc		= event.getCollection( private = true );
		prc.userid = "";
		prc.isLoggedIn = false;
		if( userid neq "" ) {
			prc.userid	= userid;
			prc.isLoggedIn = true;
		} 
		//sessionStorage.deleteVar("");
		//writeDump(sessionStorage.exists("currentUserReferenceID"));
		//writeDump(sessionStorage.getStorage());abort;
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
		
		sessionStorage.setVar( "currentUserReferenceID", interceptData.referenceID );
		sessionStorage.setVar( "currentUserName", interceptData.first &' '& interceptData.last );

        flash.put(name="greetings",value ="Sie sind angemeldet als "& interceptData.first &" "& interceptData.last);
     }
		
}