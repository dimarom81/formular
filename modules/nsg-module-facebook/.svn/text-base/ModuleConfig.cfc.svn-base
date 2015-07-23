component {

	// Module Properties
	this.title 				= "facebook";
	this.author 			= "Jeremy R DeYoung";
	this.webURL 			= "http://www.nextstep.guru";
	this.description 		= "Coldbox Module to allow Social Login via Facebook";
	this.version			= "1.0.5";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "facebook";
	// Model Namespace
	this.modelNamespace		= "facebook";
	// CF Mapping
	this.cfmapping			= "facebook";
	// Module Dependencies
	this.dependencies 		= ["nsg-module-security","nsg-module-oauth"];

	function configure(){

		// parent settings
		parentSettings = {

		};

		// module settings - stored in modules.name.settings
		settings = {
			oauth = {
				oauthVersion 		= 2,
				authorizeRequestURL = "https://www.facebook.com/dialog/oauth",
				tokenRequestURL 	= "https://graph.facebook.com/oauth/access_token"
			}
		};

		// Layout Settings
		layoutSettings = {
		};

		// datasources
		datasources = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="oauth",action="index"},
			{pattern="/oauth/:id?", handler="oauth",action="index"}
		];

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = "facebookLoginFailure,facebookLoginSuccess"
		};

		// Custom Declared Interceptors
		interceptors = [
		];

		// Binder Mappings
		binder.mapDirectory( "#moduleMapping#.models" );

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		var nsgSocialLogin = controller.getSetting('nsgSocialLogin',false,arrayNew(1));
			arrayAppend(nsgSocialLogin,{"name":"facebook","icon":"facebook","title":"Facebook"});
			controller.setSetting('nsgSocialLogin',nsgSocialLogin);
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}