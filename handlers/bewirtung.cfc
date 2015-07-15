﻿component output="false" singleton{	property name="userBewirtungService"   inject="id:userBewirtungService";	property name="bildBewirtungService"   inject="id:bildBewirtungService";	property name="belegBewirtungService"  inject="id:belegBewirtungService";	property name="GmWrapperService" 	   inject="id:GmWrapperService";	property name="sessionStorage"    	   inject="coldbox:plugin:SessionStorage";		// Default Action	function index(event,rc,prc){		rc.Summe = warenkoirn.summe();		prc.welcomeMessage = "Welcome to ContentBox Modular CMS!!!!!";		prc.testString = "testString";		event.setView( "main/index" );	}		function form(event,rc,prc){				//default values		rc.mealDate = "";		rc.location = "";		rc.participants = "";		rc.occasion = "";		rc.price = "100";		rc.currentLocation = "";		rc.currentDate = "";				/*writeDump(GmWrapperService.scale('C:\inetpub\www_akibase\test1\includes\imginput.jpg', 80, 'C:\inetpub\www_akibase\test1\includes\imgout2.jpg'));*/				/*writeDump(GmWrapperService);abort;*/		prc.validationErrors = [];		prc.greetings="Sie sind nicht angemeldet";		prc.warning1 = flash.get("warning", '' );		//getPlugin('sessionstorage').setVar(name="test", value="test2");		//writeDump(getPlugin('sessionstorage').getStorage());abort;		//prc.user = populateModel( userBewirtungService.new());		//writeDump(prc.user);abort;		//writeDump(prc.user.getreferenceID());abort;		//UserBewirtungService.save(prc.user);		//abort;		//writeDump(prc.service);		//writeDump(prc.service);abort;			event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutNotLoggedIn" );	}		function loginSuccess(event,rc,prc){		//default values		rc.mealDate = "";		rc.location = "";		rc.participants = "";		rc.occasion = "";		rc.price = "100";		rc.currentLocation = "";		rc.currentDate = "";				prc.validationErrors = [];		prc.greetings = flash.get("greetings",'');		prc.warning1 = flash.get("warning", '' );		prc.service = getModel( "userBewirtungService" );				populateModel(prc.service);		prc.currentUser= sessionStorage.getVar( "currentUserName" );		event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutLoggedIn" );	}		function myprofile(event,rc,prc){				if(sessionStorage.exists("currentUserReferenceID")){			var temp = userBewirtungService.findAllWhere( criteria = { referenceID = sessionStorage.getVar( "currentUserReferenceID" ) } );			prc.name = temp[1].getFirst();			prc.lastname = temp[1].getLast();			prc.gender = temp[1].getGender();			prc.network = temp[1].getSocialservice();						if(not len(temp[1].getEmail())){ //check if the property exists				prc.email = "Disabled by you";
			}			else{				prc.email = temp[1].getEmail();
			}						
		}		prc.currentUser= sessionStorage.getVar( "currentUserName" );		event.setView( view="bewirtungsbeleg/myprofile", layout="layouts/bewirtungLayoutLoggedIn" );	}		function logout(event,rc,prc){		//writeDump(sessionStorage.getStorage());		sessionStorage.deleteVar("currentuserReferenceID");		sessionStorage.deleteVar("currentUserName");		//writeDump(sessionStorage.getStorage());		sessionStorage.clearAll();		//writeDump(sessionStorage.getStorage());abort;		prc.greetings = flash.get("greetings", 'Sie sind nicht angemeldet' );		prc.warning1 = flash.get("warning", '' );		prc.service = getModel( "userBewirtungService" );				populateModel(prc.service);		event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutNotLoggedIn" );	}			function mydocuments(event,rc,prc){				var belege = belegBewirtungService.findAllWhere( criteria = { referenceID = sessionStorage.getVar( "currentUserReferenceID" ) } );				prc.belege = belege[1].getUser().getBelege();				/*writeDump(belege[1].getUser().getBelege()[1].getMealDate()); abort;*/												if(sessionStorage.exists("currentUserName")){			prc.warning1 = flash.get("warning", '' );			prc.currentUser=sessionStorage.getVar( "currentUserName" );			event.setView( view="bewirtungsbeleg/mydocuments", layout="layouts/bewirtungLayoutLoggedIn" );
		}else{			prc.warning1 = flash.get("warning", '' );			event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutNotLoggedIn" );
		}			}				function edit(event,rc,prc){				prc.validationErrors = [];				rc.mealDate = "";		rc.location = "";		rc.participants = "";		rc.occasion = "";		rc.price = "100";		rc.currentLocation = "";		rc.currentDate = "";						if(sessionStorage.exists("currentUserName")){			prc.warning1 = flash.get("warning", '' );			prc.currentUser=sessionStorage.getVar( "currentUserName" );			event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutEdit" ); //TODO new view		}else{			prc.warning1 = flash.get("warning", '' );			event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutNotLoggedIn" );		}				/*var x = {test='test'};	    event.renderData(data=x,type="json");*/	    	
	}			function saveDocumentation(event,rc,prc){						if(sessionStorage.exists("currentUserReferenceID")){			prc.belegBewirtung = belegBewirtungService.new();
			prc.belegBewirtung = belegBewirtungService.populate( target = prc.belegBewirtung, memento = rc ,include= "mealDate,location,participants,occasion,price,currency,restaurant,currentDate,currentLocation");						prc.belegBewirtung.setReferenceID(sessionStorage.getVar( "currentUserReferenceID" ));			var temp = userBewirtungService.findAllWhere( criteria = { referenceID = sessionStorage.getVar( "currentUserReferenceID" ) } );						prc.belegBewirtung.setUser(EntityLoadByPK ("userBewirtung", temp[1].getID()));	//setting FK																		var result = validateModel(prc.belegBewirtung);			/*writeDump(result);abort;*/			/*writeDump(ArrayLen(result.geterrors()));abort;*/			/*writeDump(result.geterrors()[1].getmessage());abort;*/			/*writeDump(result.GETERRORCOUNT());abort;*/			/*writeDump(result.getConstraints);abort;*/						/*prc.errors = result.geterrors()[1].getmessage();*/						/*writeDump(prc.validationErrors);abort;*/						prc.validationErrors = result.getErrors();									if(result.GETERRORCOUNT() eq 0){								belegBewirtungService.saveDocumentation(prc.belegBewirtung);				/*writeDump(prc.belegBewirtung.getId()); abort;*/																var belegID = prc.belegBewirtung.getId(); // use this later as FK in bild table								//var tempBeleg = belegBewirtungService.findAllWhere( criteria = { referenceID = 906743779390926 } );				/*writeDump(tempBeleg[1].getID()); abort;*/				var tempBeleg = belegBewirtungService.findAllWhere( criteria = { id = belegID } );																				for (i=1; i LE 5; i=i+1) {  // 5 is max file count documentScan_"&i: documentScan_1//documentScan_2//documentScan_3							if(event.getValue( "documentScan_"&i, "" ) neq "" ){											ui = createUUID();					ui_preview = createUUID();								var tempFile = getPlugin("FileUtils").uploadFile(fileField="documentScan_" & i ,destination="C:/inetpub/www_akibase/test1/includes/img",accept="image/jpeg,image/jpg,image/png,image/tiff,image/gif",nameConflict="makeunique");					var picturename = tempFile.CLIENTFILE; // for saving in db									    GmWrapperService.makeJPG("C:/inetpub/www_akibase/test1/includes/img/" & tempFile.SERVERFILE ); //making jpg from every file, need to change this later only for not jpg files					FileCopy("C:/inetpub/www_akibase/test1/includes/img/" & tempFile.SERVERFILENAME & ".jpg", "C:/inetpub/www_akibase/test1/includes/img/" & ui & ".jpg"); //changing name to uuid								GmWrapperService.scale("C:/inetpub/www_akibase/test1/includes/img/" & ui & ".jpg", 80, "C:/inetpub/www_akibase/test1/includes/img/" & ui_preview & ".jpg"); // creating preview image with name ui_preview								/*GmWrapperService.sharpen("C:/inetpub/www_akibase/test1/includes/img/" & ui_preview & ".jpg" , "0.5" , "90");*/					getPlugin("FileUtils").removeFile("C:/inetpub/www_akibase/test1/includes/img/" & tempFile.SERVERFILE); // remove original file					getPlugin("FileUtils").removeFile("C:/inetpub/www_akibase/test1/includes/img/" & tempFile.SERVERFILENAME & ".jpg" ); // remove converted jpg file with original name											prc.bildBewirtung = bildBewirtungService.new();										prc.bildBewirtung.setBildName(picturename);					prc.bildBewirtung.setUUID(ui);					prc.bildBewirtung.setUUIDpreview(ui_preview);															prc.bildBewirtung.setBelegBewirtung(EntityLoadByPK ("belegBewirtung", tempBeleg[1].getID()));										/*writeDump(EntityLoadByPK ("belegBewirtung", tempBeleg[1].getID()));					writeDump(tempBeleg[1].getID());abort;*/										/*prc.bildBewirtung.setBelegBewirtung(tempBeleg[1].getID());*/										/*writeDump(prc.bildBewirtung);abort;*/					bildBewirtungService.savePictures(prc.bildBewirtung);																			}//end if event.getValue				}//end for								
			} //end if geterrorcount												//prc.belegBewirtung.setParticipants(rc.participants);			//writeDump(listtoarray(rc.participants));			//abort;			//prc.belegBewirtung.setParticipants(listtoarray(rc.participants)[1]);			//writeDump(prc.belegBewirtung);abort;			prc.greetings = flash.get("greetings",  "Sie sind angemeldet als " & sessionStorage.getVar( "currentUserName" ));			prc.warning1 = flash.get("warning", 'Saved in DB' );			prc.currentUser= sessionStorage.getVar( "currentUserName" );			event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutLoggedIn" );			
		}		else{			prc.greetings = flash.get("greetings",'Sie sind nicht angemeldet');			prc.warning1 = flash.get("warning", 'Sie sind nicht angemeldet' );			event.setView( view="bewirtungsbeleg/form", layout="layouts/bewirtungLayoutNotLoggedIn" );		}							}			/************************************** IMPLICIT ACTIONS *********************************************/	function onAppInit(event,rc,prc){	}	function onRequestStart(event,rc,prc){	}	function onRequestEnd(event,rc,prc){	}	function onSessionStart(event,rc,prc){	}	function onSessionEnd(event,rc,prc){		var sessionScope = event.getValue("sessionReference");		var applicationScope = event.getValue("applicationReference");	}	function onException(event,rc,prc){		//Grab Exception From request collection, placed by ColdBox		var exceptionBean = event.getValue("ExceptionBean");		//Place exception handler below:	}	function onMissingTemplate(event,rc,prc){		//Grab missingTemplate From request collection, placed by ColdBox		var missingTemplate = event.getValue("missingTemplate");	}}