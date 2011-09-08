<cfcomponent output="false" hint="My App Configuration">
<cfscript>
/**
structures to create for configuration

- coldbox
- settings
- conventions
- environments
- ioc
- models DEPRECATED use wirebox instead
- wirebox
- debugger
- mailSettings
- i18n
- webservices
- datasources
- layoutSettings
- layouts
- cacheEngine
- interceptorSettings
- interceptors
- modules

Available objects in variable scope
- controller
- logBoxConfig
- appMapping (auto calculated by ColdBox)

Required Methods
- configure() : The method ColdBox calls to configure the application.
Optional Methods
- detectEnvironment() : If declared the framework will call it and it must return the name of the environment you are on.
- {environment}() : The name of the environment found and called by the framework.

*/
	
// Configure ColdBox Application
function configure(){

	// coldbox directives
	coldbox = {
		//Application Setup
		appName 				= "cbhyrule",
		
		//Development Settings
		debugMode				= true,
		debugPassword			= "",
		reinitPassword			= "",
		handlersIndexAutoReload = true,
		configAutoReload		= false,
		
		//Implicit Events
		defaultEvent			= "dashboard.index",
		requestStartHandler		= "",
		requestEndHandler		= "",
		applicationStartHandler = "",
		applicationEndHandler	= "",
		sessionStartHandler 	= "",
		sessionEndHandler		= "",
		missingTemplateHandler	= "",
		
		//Error/Exception Handling
		exceptionHandler		= "",
		onInvalidEvent			= "",
		customErrorTemplate		= "",
			
		//Application Aspects
		handlerCaching 			= false,
		eventCaching			= false
	};
	
	// global settings - if you wanted to you could move these to environment specific settings
	settings = {
		validator="annotation",
		rbPath="/hyrule/samples/frameworks/coldbox/includes/i18n"
	};
	
	// environment settings, create a detectEnvironment() method to detect it yourself.
	// create a function with the name of the environment so it can be executed if that environment is detected
	// the value of the environment is a list of regex patterns to match the cgi.http_host.
	environments = {
		//development = "^cf8.,^railo."
	};
	
	// Module Directives
	modules = {
		//Turn to false in production
		autoReload = false,
		// An array of modules names to load, empty means all of them
		include = [],
		// An array of modules names to NOT load, empty means none
		exclude = [] 
	};
	
	//WireBox Integration
	wireBox = { 
		enabled = true,
		//binder="config.WireBox", 
		singletonReload=true 
	};
	

	//Layout Settings
	layoutSettings = {
		defaultLayout = "Layout.Main.cfm"
	};
	
	//Register interceptors as an array, we need order
	interceptors = [
		 //Autowire
		 {class="coldbox.system.interceptors.Autowire"},
		 //SES
		 {class="coldbox.system.interceptors.SES"}
	];
	
}
	
</cfscript>
</cfcomponent>