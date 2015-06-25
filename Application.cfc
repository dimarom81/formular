/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.gocontentbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************
*/
component{
	// THIS LOADS THE DSN CREATOR WHEN INSTALLING CONTENTBOX FOR THE FIRST TIME
	// THIS CAN BE REMOVED AFTER INSTALLATION, USUALLY IT IS REMOVED BY THE INSTALLER
	

	// Application properties, modify as you see fit
	this.name 				= "ContentBox-Shell-" & hash( getCurrentTemplatePath() );
	this.sessionManagement 	= true;
	this.sessionTimeout 	= createTimeSpan(0,0,45,0);
	this.setClientCookies 	= true;
	this.scriptProtect		= false;
	
	/**************************************
	Railo Specific Settings
	**************************************/
	// buffer the output of a tag/function body to output in case of a exception
	this.bufferOutput 					= true;
	// Activate Railo Gzip Compression
	this.compression 					= false;
	// Turn on/off white space managemetn
	this.whiteSpaceManagement 			= "smart";
	// Turn on/off remote cfc content whitespace
	this.suppressRemoteComponentContent = false;

	// ColdBox Application Specific, Modify if you need to
	COLDBOX_APP_ROOT_PATH 	= getDirectoryFromPath( getCurrentTemplatePath() );
	COLDBOX_APP_MAPPING		= "";
	COLDBOX_CONFIG_FILE 	= "";
	COLDBOX_APP_KEY 		= "";
	// LOCATION MAPPINGS
	this.mappings["/contentbox"] 		= COLDBOX_APP_ROOT_PATH & "modules/contentbox";
	this.mappings["/contentbox-ui"] 	= COLDBOX_APP_ROOT_PATH & "modules/contentbox-ui";
	this.mappings["/contentbox-admin"] 	= COLDBOX_APP_ROOT_PATH & "modules/contentbox-admin";
	// THE LOCATION OF EMBEDDED COLDBOX
	this.mappings["/coldbox"] = COLDBOX_APP_ROOT_PATH & "coldbox";

	// THE DATASOURCE FOR CONTENTBOX MANDATORY
	this.datasource = "contentbox_dmitry";
	// ORM SETTINGS
	this.ormEnabled = true;
	this.ormSettings = {
		// ENTITY LOCATIONS, ADD MORE LOCATIONS AS YOU SEE FIT
		cfclocation=[ "model", "modules" ],
		// THE DIALECT OF YOUR DATABASE OR LET HIBERNATE FIGURE IT OUT, UP TO YOU TO CONFIGURE
		//dialect 			= "MySQLwithInnoDB",
		// DO NOT REMOVE THE FOLLOWING LINE OR AUTO-UPDATES MIGHT FAIL.
		dbcreate = "update",
		// FILL OUT: IF YOU WANT CHANGE SECONDARY CACHE, PLEASE UPDATE HERE
		secondarycacheenabled = false,
		cacheprovider		= "ehCache",
		// ORM SESSION MANAGEMENT SETTINGS, DO NOT CHANGE
		logSQL 				= true,
		flushAtRequestEnd 	= false,
		autoManageSession	= false,
		// ORM EVENTS MUST BE TURNED ON FOR CONTENTBOX TO WORK
		eventHandling 		= true,
		eventHandler		= "modules.contentbox.model.system.EventHandler",
		// THIS IS ADDED SO OTHER CFML ENGINES CAN WORK WITH CONTENTBOX
		skipCFCWithError	= true
	};

	/************************************** METHODS *********************************************/

	// application start
	public boolean function onApplicationStart(){
		application.cbBootstrap = new coldbox.system.Coldbox( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// request start
	public boolean function onRequestStart( string targetPage ){

		//if( structKeyExists(url,"ormReload") ){ ormReload(); }
		//applicationstop();abort;

		// Bootstrap Reinit
		if( not structKeyExists(application,"cbBootstrap") or application.cbBootStrap.isfwReinit() ){
			lock name="coldbox.bootstrap_#this.name#" type="exclusive" timeout="5" throwonTimeout=true{
				structDelete(application,"cbBootStrap");
				application.cbBootstrap = new coldbox.system.ColdBox( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
			}
		}

		// ColdBox Reload Checks
		application.cbBootStrap.reloadChecks();

		//Process a ColdBox request only
		if( findNoCase( 'index.cfm', listLast( arguments.targetPage, "/" ) ) ){
			application.cbBootStrap.processColdBoxRequest();
		}

		return true;
	}

	public void function onSessionStart(){
		if( structKeyExists( application, "cbBootstrap") ){
			application.cbBootStrap.onSessionStart();
		}
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}

	public boolean function onMissingTemplate(template){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}

	//@cf9-onError@
}