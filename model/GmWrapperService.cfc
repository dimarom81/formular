<cfcomponent output="false" hint="using this wrapper to work with graphics magick" singleton>
	<cfproperty name="exec" inject="coldbox:setting:CFGGRAPHICSMAGICK">
	
	<!--- constructor --->
	<cffunction name="init" access="public" output="false" hint="Constructor" returntype="GmWrapperService">
		<!--- normally C:\Program Files\GraphicsMagick-VERSION-Q16\mp.exe --->
		<cfargument name="exec" type="string" required="false" default="" hint="path to the gm.exe" />
		<!--- if not used, filename has to be full path! --->
		<cfargument name="workingDir" type="string" required="false" default="" hint="folder of incomming images " />
		<!--- if createobject() is used, we can use a different version, than defined in global config. so exec path points to different folder --->
		<!--- uasge then on own risk :) --->
		<cfif isdefined('arguments.exec') and arguments.exec neq ''>
			<cfset variables.exec = arguments.exec />
		</cfif>
		<cfif isdefined('arguments.workingDir') and arguments.workingDir neq ''>
			<cfset variables.workingDir = arguments.workingDir />
		<cfelse>
			<cfset variables.workingDir = '' />
		</cfif>
				
	   <cfreturn this>
	</cffunction>

	<cffunction name="scale" access="public" output="false" >
		<cfargument name="filename" type="string">
		<cfargument name="maxSize" type="string">
		<cfargument name="destination" type="string" default="" required="false">
		<cfargument name="quality" type="numeric" default="85">
		<cfif structKeyExists(application,'CFGCONHIGHQUALITY') and isNumeric(application.CFGCONHIGHQUALITY)>
			<cfset arguments.quality = application.CFGCONHIGHQUALITY>
		</cfif>
		<cfif arguments.destination eq "">
			<cfset arguments.destination = arguments.filename>
		</cfif>
		<cfset var ret ='' >
		<cfexecute name="#variables.exec#" arguments='convert -sample #arguments.maxSize# "#variables.workingDir##arguments.filename#" -quality #arguments.quality# "#variables.workingDir##arguments.destination#"' variable="ret" timeout="60"/>
	</cffunction>
	
	<cffunction name="scaleTo" access="public" output="false" >
		<cfargument name="source" type="string" required="true" >
		<cfargument name="destination" type="string" required="true" >
		<cfargument name="width" required="false" default="">
		<cfargument name="height" required="false" default="">
		<cfargument name="quality" type="numeric" default="85">
		<cfif structKeyExists(application,'CFGCONHIGHQUALITY') and isNumeric(application.CFGCONHIGHQUALITY)>
			<cfset arguments.quality = application.CFGCONHIGHQUALITY>
		</cfif>		
		<cfset var ret ='' >
		<cfexecute name="#variables.exec#" arguments='convert -resize #arguments.width#x#arguments.height# "#variables.workingDir##arguments.source#" -quality #arguments.quality# "#variables.workingDir##arguments.destination#"' variable="ret" timeout="20"/>
	</cffunction>


	<cffunction name="crop" access="public" output="false" >
		<cfargument name="source" type="string" required="true" >
		<cfargument name="destination" type="string" required="true" >
		<cfargument name="width" type="string" required="false" default="">
		<cfargument name="height" type="string" required="false" default="">
		<cfargument name="quality" type="numeric" default="85">
		<cfset var cropstring =''>
		<cfif structKeyExists(application,'CFGCONHIGHQUALITY') and isNumeric(application.CFGCONHIGHQUALITY)>
			<cfset arguments.quality = application.CFGCONHIGHQUALITY>
		</cfif>		
		<cfif arguments.width neq "">
			<cfset cropstring = arguments.width&'x'>
		</cfif>
		<cfif arguments.height neq '' and cropstring neq ''>
			<cfset cropstring = cropstring&arguments.height>
		</cfif>
		<cfif  arguments.height neq '' and cropstring eq ''>
			<cfset cropstring = 'x'&arguments.height>
		</cfif>
		<cfif cropstring neq ''>
			<cfset var ret ='' >
			<cfexecute name="#variables.exec#" arguments='convert -crop #cropstring# "#variables.workingDir##arguments.source#" -quality #arguments.quality# "#variables.workingDir##arguments.destination#"' variable="ret" timeout="20"/>
		</cfif>
	</cffunction>	
	
	<cffunction name="notBroken" access="public" returntype="boolean" hint="is this not korrupted image" output="false" >
		<cfargument name="filename" type="string">
		<cfset var tmp=getDimensions(arguments.filename)>
		<cfif (tmp[1] neq 0 and tmp[2] neq 0) >
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<cffunction name="notLargerThan" access="public" returntype="boolean" hint="checks if image is not larger than given size" output="false" >
		<cfargument name="filename" type="string">
		<cfargument name="size" type="numeric">
		<cfset var tmp=getDimensions(arguments.filename)>
		<cfif (tmp[1] lt arguments.size and tmp[2] lte arguments.size)>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<cffunction name="getDimensions" access="public" returntype="array" hint="array with dimensions of the given Image 1-->x 2-->y" output="false" >
		<cfargument name="filename"  type="string" hint="filename of the image you want to analyze ->like 123.jpg">
		<cfset var ret ='' >
		<cfexecute name="#variables.exec#" arguments='identify -format %wx%h "#variables.workingDir##filename#"' variable="ret" timeout="10"/>
		<cfset var arr=arrayNew(1)>
		<cfset var t_x=listfirst(ret,'x')>
		<cfset var t_y=listlast(ret,'x')>

		<cfif isnumeric(t_x)>
			<cfset arrayappend(arr,t_x)>
		<cfelse>
			<cfset arrayappend(arr,0)>
		</cfif>
		<cfif isnumeric(t_y)>
			<cfset arrayappend(arr,t_y)>
		<cfelse>
			<cfset arrayappend(arr,0)>
		</cfif>
		<cfreturn arr>
	</cffunction>
	
	<cffunction name="getDimensionStruct" access="public" returntype="struct" hint="struct with dimensions of the given Image width/height" output="false" >
		<cfargument name="filename"  type="string" hint="filename of the image you want to analyze ->like 123.jpg">
		<cfset var retStr=''>
		<cfset var t_x=''>
		<cfset var t_y=''>
		<cfset var ret ='' >
		<cftry>
			<cfexecute name="#variables.exec#" arguments='identify -format %wx%h "#variables.workingDir##filename#"' variable="ret" timeout="10"/>
			<cfset retStr=structnew()>
			<cfset t_x=listfirst(ret,'x')>
			<cfset t_y=listlast(ret,'x')>
			<cfif isnumeric(t_x)>
				<cfset retStr.width=t_x>
			<cfelse>
				<cfset retStr.width=0>
			</cfif>
			<cfif isnumeric(t_y)>
				<cfset retStr.height=t_y>
			<cfelse>
				<cfset retStr.height=0>
			</cfif>
		<cfcatch type="any" >
			<cfmail from="errors@akibase.com" to="errors@akibase.com" subject="[AKIBASE] [#cgi.server_name#] [public] [error] - gmwrapper - getDimensionStruct()" type="html">
				<cfdump var="#cfcatch#">
			</cfmail>
			<cfset retStr=structnew()>
			<cfset retStr.width=0>
			<cfset retStr.height=0>
		</cfcatch>
		</cftry>
		<cfreturn retStr>
	</cffunction>	
	
	<cffunction name="makeJPG" access="public" hint="makes jpg file out of file" output="false" >
		<cfargument name="filename" type="string">
		<cfset var ret ='' >
		<cfexecute name="#variables.exec#" arguments='convert "#variables.workingDir##arguments.filename#" "#variables.workingDir##listfirst(arguments.filename,'.')#.jpg"' variable="ret" timeout="60"/>
	</cffunction>	

	<cffunction name="sharpen" access="public" hint="sharpen image, overwrite original" output="false" >
		<cfargument name="filename" type="string">
		<cfargument name="sharpenFactor" type="string" default="0" hint="0.5">
		<cfargument name="quality" type="string" default="90" >
		<cfif arguments.sharpenFactor neq 0>
			<cfset var ret ='' >
			<cfexecute name="#variables.exec#" arguments='convert "#variables.workingDir##arguments.filename#" -sharpen 0x#arguments.sharpenFactor# -quality #arguments.quality# "#variables.workingDir##arguments.filename#"' variable="ret" timeout="60"/>
		</cfif>
	</cffunction>		
	
	<cffunction name="composite" access="public" hint="overlays filename with image2" output="true" >
		<cfargument name="filename" type="string" required="true">
		<cfargument name="overlayImage" type="string" required="true">
		<cfargument name="overlayPosSize" hint="startX,startY,SizeX,sizeY" required="true">
		<cfargument name="gravity" default="NorthWest" required="false">
		<!--- gm convert 6226097.jpg -gravity NorthWest -draw "image over 0,0,50,50 import140.png" out.jpg --->
		<cfset var ret ='' >
		<cfexecute name="#variables.exec#" arguments='convert #variables.workingDir##arguments.filename# -gravity #arguments.gravity# -draw "image over #arguments.overlayPosSize# #arguments.overlayImage#"  #variables.workingDir##listfirst(arguments.filename,'.')#.jpg' variable="ret" timeout="15"/>
	</cffunction>	
	
</cfcomponent>