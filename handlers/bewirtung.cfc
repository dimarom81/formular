﻿component output="false" singleton{	property name="userBewirtungService"   inject="id:userBewirtungService";	property name="bildBewirtungService"   inject="id:bildBewirtungService";	property name="belegBewirtungService"  inject="id:belegBewirtungService";	property name="GmWrapperService" 	   inject="id:GmWrapperService";	property name="sessionStorage"    	   inject="coldbox:plugin:SessionStorage";	property name="fullImgPath"            inject="coldbox:setting:fullImgPath";	property name="partialImgPath"         inject="coldbox:setting:partialImgPath";	function preHandler(event,rc,prc){		prc.validationErrors = [];		prc.fileErrors = 'aaaa';	}			// Default Action	function index(event,rc,prc){		setNextEvent('bewirtung.form');		}			function form(event,rc,prc){		prc.beleg = belegBewirtungService.new();				event.setView( view="bewirtungsbeleg/form_edit", layout="layouts/bewirtungLayout" );			}		function myprofile(event,rc,prc){			if(prc.user.isLoaded()){			event.setView( view="bewirtungsbeleg/myprofile", layout="layouts/bewirtungLayout" );
		}		else{			event.setView( view="bewirtungsbeleg/form_edit", layout="layouts/bewirtungLayout" );
		}		}			function logout(event,rc,prc){		prc.beleg = belegBewirtungService.new();		prc.user = userBewirtungService.new();		prc.isLoggedIn = false;		sessionStorage.clearAll();		event.setView( view="bewirtungsbeleg/form_edit", layout="layouts/bewirtungLayout" );	}			function mydocuments(event,rc,prc){				prc.belege = belegBewirtungService.getAllDocumentations( prc.user.getReferenceID() );			event.setView( view="bewirtungsbeleg/mydocuments", layout="layouts/bewirtungLayout" );
	}		function edit(event,rc,prc){		var belegID = event.getValue('belegID','0');		prc.beleg = belegBewirtungService.get(belegID);				//var belegID = rc.belegID; //coming from ajax: function loadEditView		event.setView( view="bewirtungsbeleg/form_edit", layout="layouts/ajax" );		}		function saveDocumentation(event,rc,prc){		var belegID = event.getValue('belegID','0');		if(belegID eq 0){			prc.beleg = belegBewirtungService.new(); // save a new
		}					else{			prc.beleg = belegBewirtungService.get(belegID); // edit existing beleg!
		}				prc.beleg = belegBewirtungService.populate( target = prc.beleg, memento = rc ,include= "mealDate,location,participants,occasion,price,currency,restaurant,currentDate,currentLocation");				prc.beleg.setReferenceID(prc.user.getReferenceID());		prc.beleg.setUser(prc.user);				var result = validateModel(prc.beleg);					prc.validationErrors = result.getErrors();		if(result.GETERRORCOUNT() eq 0){			belegBewirtungService.saveDocumentation(prc.beleg);						//saving the pictures			for (i=1; i LE 5; i=i+1) {  // 5 is max file count documentScan_"&i: documentScan_1//documentScan_2//documentScan_3						if(event.getValue( "documentScan_"&i, "" ) neq "" ){//pictures are there										ui = createUUID();					ui_preview = createUUID();										/*if(){						
					}*/													var tempFile = getPlugin("FileUtils").uploadFile(fileField="documentScan_" & i ,destination=fullImgPath,accept="image/jpeg,image/jpg,image/png,image/tiff,image/gif",nameConflict="makeunique");					var picturename = tempFile.CLIENTFILE; // for saving in db										GmWrapperService.makeJPG(fullImgPath & tempFile.SERVERFILE ); //making jpg from every file, need to change this later only for not jpg files					FileCopy( fullImgPath & tempFile.SERVERFILENAME & ".jpg", fullImgPath & ui & ".jpg"); //changing name to uuid								GmWrapperService.scale( fullImgPath & ui & ".jpg", 200, fullImgPath & ui_preview & ".jpg"); // creating preview image with name ui_preview								//GmWrapperService.sharpen(fullImgPath & ui_preview & ".jpg" , "0.5" , "90");					getPlugin("FileUtils").removeFile( fullImgPath & tempFile.SERVERFILE); // remove original file					getPlugin("FileUtils").removeFile( fullImgPath & tempFile.SERVERFILENAME & ".jpg" ); // remove converted jpg file with original name						prc.bild = bildBewirtungService.new();					prc.bild.setBildName(picturename);					prc.bild.setUUID(ui);					prc.bild.setUUIDpreview(ui_preview);					prc.bild.setBelegBewirtung(prc.beleg); // setting FK					//writedump(prc.beleg.getID());abort;					//writedump(prc.bild);abort;					bildBewirtungService.savePictures(prc.bild);						}//end if event.getValue			}//end for			}		setNextEvent('bewirtung.mydocuments');	}		function generatePDF(event,rc,prc){				//default values		prc.mealDate = event.getValue("mealDate", "");		prc.location = event.getValue("location", "");		prc.participants = event.getValue("participants", "");		prc.occasion = event.getValue("occasion", "");		prc.price = event.getValue("price", "100");				if( event.getValue("restaurant", "1") == 1 ){			prc.restaurant = "In Restaurationsbetrieben";
		}		else{			prc.restaurant = "Sonstige Bewirtung";
		}		prc.currentLocation = event.getValue("currentLocation", "");		prc.currentDate = event.getvalue("currentDate", "");				prc.warning1 = flash.get("warning", 'Sie sind nicht angemeldet' );		event.renderData(data=renderView("bewirtungsbeleg/pdf"), type="PDF");		}			function removeDocumentation(event,rc,prc){		if(isnumeric(event.getValue('belegID','0'))){			var documentToDelete = belegBewirtungService.get( event.getValue('belegID','0') );			if(prc.user.isLoaded() and  belegBewirtungService.belongs( documentToDelete, prc.user.getReferenceID() ) ){				for (i=1; i LE ArrayLen( documentToDelete.getbilder() ); i=i+1) { //remove from disk					getPlugin("FileUtils").removeFile(fullImgPath & documentToDelete.getbilder()[i].getUUID() & ".jpg" );					getPlugin("FileUtils").removeFile(fullImgPath & documentToDelete.getbilder()[i].getUUIDpreview() & ".jpg" );					}							belegBewirtungService.deleteDocumentation(documentToDelete); //remove from DB			}		}
		setNextEvent('bewirtung.mydocuments');	}			function removeImage(event,rc,prc){		var picID = event.getValue('picID','0');		var belegID = event.getValue('belegID','0');		prc.beleg = belegBewirtungService.get(belegID);			//writedump(bildBewirtungService.get(picID).getBelegBewirtung().getUser().getReferenceID());abort;		var imageToDelete = bildBewirtungService.get(picID);			                    		if( prc.user.isLoaded() and bildBewirtungService.belongs( imageToDelete, prc.user.getReferenceID() ) ){										var UUID = imageToDelete.getUUID();			var UUIDpreview = imageToDelete.getUUIDpreview();			bildBewirtungService.deleteImage(imageToDelete);			var checkIfRemoved = bildBewirtungService.findAllWhere( criteria = { id = picID} );									if( ArrayLen(checkIfRemoved) == 0 ){ //if deleted from DB remove the pictures from the disk				getPlugin("FileUtils").removeFile(fullImgPath & UUID & ".jpg" );				getPlugin("FileUtils").removeFile(fullImgPath & UUIDpreview & ".jpg" );					event.renderData(data="true",type="json");			}			else{				event.renderData(data="false",type="json");			}		}		
	}			/************************************** IMPLICIT ACTIONS *********************************************/	function onAppInit(event,rc,prc){	}	function onRequestStart(event,rc,prc){	}	function onRequestEnd(event,rc,prc){	}	function onSessionStart(event,rc,prc){	}	function onSessionEnd(event,rc,prc){		var sessionScope = event.getValue("sessionReference");		var applicationScope = event.getValue("applicationReference");	}	function onException(event,rc,prc){		//Grab Exception From request collection, placed C:/inetpub/www_akibase/test1/includes/img ColdBox		var exceptionBean = event.getValue("ExceptionBean");		abort;		//Place exception handler below:	}	function onMissingTemplate(event,rc,prc){		//Grab missingTemplate From request collection, placed by ColdBox		var missingTemplate = event.getValue("missingTemplate");		abort;	}}