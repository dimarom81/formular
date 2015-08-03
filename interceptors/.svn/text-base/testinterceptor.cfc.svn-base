component extends="coldbox.system.Interceptor"{	
	property name="userBewirtungService" inject="id:userBewirtungService";
	property name="sessionStorage"  inject="coldbox:plugin:SessionStorage";
	
	function configure(){
	
	}
	//always execute
	//always have a user in my application
	function preProcess( event, interceptData ) {	
		//ORMReload(); //NEED TO REMOVE THIS LATER	
		var prc		= event.getCollection( private = true );
		var userid	= sessionStorage.getVar( "currentUserReferenceID","");
		prc.user = userBewirtungService.new();
		var userToCheck = userBewirtungService.findAllWhere( criteria = { referenceID = userid } );
		if(arraylen(userToCheck) gt 0)
			prc.user = userToCheck[1];
	}
	function facebookLoginSuccess(event,interceptData){ 
		//override empty user when we come over Facebook. 
		var prc	= event.getCollection( private = true );
		var userToCheck = userBewirtungService.findAllWhere( criteria = { referenceID = interceptData.referenceID } );
		//check if user is in our DB
		if(Arraylen(userToCheck) gt 0){
			prc.user = userToCheck[1]; //Take first user if exists. Should only be there or not!
		}
		//not in DB - user logs in first time
		if( !prc.user.isloaded()){
		 	prc.user = userBewirtungService.populate( target = userBewirtungService.new(),memento = interceptData ,include= "referenceID,first,last,gender,locale,socialservice,email");
			userBewirtungService.saveUser(prc.user);
		}
		else{
			//update  user!
			prc.user = userBewirtungService.populate( target = prc.user, memento = interceptData ,include= "referenceID,first,last,gender,locale,socialservice,email");
			userBewirtungService.saveUser(prc.user);
		}
		sessionStorage.setVar( "currentUserReferenceID", interceptData.referenceID );
     }
     
}