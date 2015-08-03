<cfcomponent extends="bugLogService">
	<cffunction name="log" access="public" returntype="void" hint="Use this method to tell the bugTrackerService that an error has ocurred" output="false">
		<cfargument name="message" type="string" required="true">
		<cfargument name="exception" type="any" required="false" default="#structNew()#">
		<cfargument name="extraInfo" type="any" required="false" default="">
		<cfargument name="severityCode" type="string" required="false" default="#variables.defaultSeverityCode#">
		<cfargument name="maxDumpDepth" type="numeric" required="false" default="#variables.maxDumpDepth#">
		<cfargument name="writeToCFLog" type="boolean" required="false" default="#variables.writeToCFLog#">
		<cfargument name="AppName" type="string" required="false" default="#variables.appName#">
		<!--- if a thread is already running, we cannot open a child thread. --->
		<!--- problem came up with railo feature of threading loop --->
		<cftry>
			<!--- serialize args. Problem is on railo CGI cannot be passed to thread. so we use simple type!--->
			<cfset var serData = serializeJSON(arguments)>
			<cfthread action="run" name="#createUUID()#" ThreadArgsSer="#serData#">
				<!--- and convert it back! --->
				<cfset var ThreadArgs = deserializeJSON(ThreadArgsSer)>
				<cfset super.notifyService( ThreadArgs.message,
										ThreadArgs.exception,
										ThreadArgs.extraInfo,
										ThreadArgs.severityCode,
										ThreadArgs.maxDumpDepth,
										ThreadArgs.writeToCFLog,
										ThreadArgs.AppName)>
			</cfthread>
		<cfcatch>
			<cfset super.notifyService( arguments.message,
										arguments.exception,
										arguments.extraInfo,
										arguments.severityCode,
										arguments.maxDumpDepth,
										arguments.writeToCFLog,
										arguments.AppName)>
		</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="logCFCATCH" access="public" returntype="void" hint="This method will log the cfcatch struct and auto append further infos!" output="false">
		<cfargument name="catchStr" type="any" required="true">
		<cfargument name="Message" type="string" required="false" default="">
		<cfset var errorMore = structnew()>
		<cfset var i=0>
		<cfif Server.ColdFusion.ProductName eq 'Railo' OR Server.ColdFusion.ProductName eq 'Lucee'>
			<cfset errorMore[1] = variables>
			<cfset errorMore[2] = request>
			<cfset errorMore[3] = form>
			<cfset errorMore[4] = url>
			<cfset errorMore[5] = session>
			<cfset errorMore[6] = cookie>
			<cfset errorMore[7] = cgi>
			<cfif isDefined("client")>
				<cfset errorMore[8] = client>
			</cfif>
		<cfelse>
			<cfset var allScopes = getPageContext().getCFScopes()>
			<cfloop from="1" to="#arraylen(allScopes)#" index="i">
				<cfset errorMore[i] = allScopes[i]>
			</cfloop>
		</cfif>
		<cfif arguments.Message eq "">
			<cfset this.log(arguments.catchStr.message, arguments.catchStr,errorMore)>
		<cfelse>
			<cfset this.log(arguments.message, arguments.catchStr,errorMore)>
		</cfif>			
	</cffunction>
	
	<cffunction name="logTEXT" access="public" returntype="void" hint="This method will log the given message and append  CF Scopes by default" output="false">
		<cfargument name="txtMessage" type="string" required="true">
		<cfargument name="severity" type="string" required="false" default="error">
		<cfargument name="appendCFScope" type="boolean" required="false" default="true">
		<cfset var errorMore = structnew()>
		<cfif arguments.appendCFScope>
			<cfif Server.ColdFusion.ProductName eq 'Railo'>
				<cfset errorMore[1] = variables>
				<cfset errorMore[2] = request>
				<cfset errorMore[3] = form>
				<cfset errorMore[4] = url>
				<cfset errorMore[5] = session>
				<cfset errorMore[6] = cookie>
				<cfset errorMore[7] = cgi>
				<cfif isDefined("client")>
					<cfset errorMore[8] = client>
				</cfif>
			<cfelse>
				<cfset var allScopes = getPageContext().getCFScopes()>
				<cfloop from="1" to="#arraylen(allScopes)#" index="i">
					<cfset errorMore[i] = allScopes[i]>
				</cfloop>
			</cfif>
			<cfset this.log(message=arguments.txtMessage, extraInfo=errorMore, severityCode = arguments.severity)>			
		<cfelse>
			<cfset this.log(message=arguments.txtMessage,severityCode = arguments.severity)>				
		</cfif>
	</cffunction>	
</cfcomponent>
