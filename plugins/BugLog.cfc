<cfcomponent hint="Wrapper for Buglog, loads configuration and passes to public" output="false" singleton="true">
<!------------------------------------------- CONSTRUCTOR ------------------------------------------->
	<cffunction name="init" access="public" returntype="BugLog" output="false" hint="constructor">
		<cfscript>
			// Plugin Properties
			setPluginName("BugLog");
			setPluginVersion("1.0");
			setPluginDescription("Wrapper for Buglog, loads configuration and passes to public");
			setPluginAuthor("Andy");
			setPluginAuthorURL("");
			try{
				variables.logger = createObject("component","bugLog.bugLogServiceThread")
					.init( bugLogListener=getSetting('bugLogListener'),
						bugEmailRecipients=getSetting('bugEmailRecipients'),
						bugEmailSender=getSetting('bugEmailSender'),
						appname=getSetting('appname'),
						apikey=getSetting('apikey')); 
			}catch(any e){
				throw('could not create BugLogService, check public mapping and akibase settings');
			}
			return this;
		</cfscript>
	</cffunction>
<!------------------------------------------- PUBLIC ------------------------------------------->
	<cffunction name="getLogger" returntype="any" access="public" >
		<cfreturn variables.logger>
	</cffunction>
</cfcomponent>	
