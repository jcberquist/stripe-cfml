component {

	// Module Properties
	this.title              = "Stripe API";
	this.author             = "John Berquist";
	this.webURL             = "https://github.com/jcberquist/stripe-cfml";
	this.description        = "This module will provide you with connectivity to the Stripe API for any ColdFusion (CFML) application.";
	this.version            = "@version.number@+@build.number@";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup   = true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	this.entryPoint         = 'stripeAPI';
	this.modelNamespace     = 'stripeAPI';
	this.cfmapping          = 'stripeAPI';
	this.autoMapModels      = false;

	/**
	 * Configure
	 */
	function configure(){

		// Settings
		settings = {
			apiKey = '', // Required
			config = {}, // Default value in init
		};
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		parseParentSettings();
		var stripeAPISettings = controller.getConfigSettings().stripeAPI;

		// Map Library
		binder.map( "stripeAPI@stripeAPI" )
			.to( "#moduleMapping#.stripe" )
			.initArg( name="apiKey", value=stripeAPISettings.apiKey )
			.initArg( name="config", value=stripeAPISettings.config );
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
	}

	/**
	* parse parent settings
	*/
	private function parseParentSettings(){
		var oConfig      = controller.getSetting( "ColdBoxConfig" );
		var configStruct = controller.getConfigSettings();
		var stripeAPIDSL = oConfig.getPropertyMixin( "stripeAPI", "variables", structnew() );

		//defaults
		configStruct.stripeAPI = variables.settings;

		// incorporate settings
		structAppend( configStruct.stripeAPI, stripeAPIDSL, true );
	}

}