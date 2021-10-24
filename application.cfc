<cfcomponent output="no">
	<cfset this.name="NEW_#lcase(cgi.server_name)#">
	<cfset this.clientManagement=true>
	<cfset this.sessionManagement=true>
	<!---<cfset this.setclientcookies = true>--->
	<cfset this.scriptprotect = "all">
	<cfset this.sessiontimeout = CreateTimeSpan(0,1,0,0)>
	<cfset this.DATASOURCE = "test">


	

	<cffunction name="onMissingTemplate" returnType="boolean" output="true">
		<cfargument name="targetPage" type="string" required=true/>

		<cftry>
			<!--- Log all errors. --->
			<cflog type="error" file="myapp_errors" text="Missing template: #Arguments.targetPage#">
			<!--- Display an error message. --->
			<cfoutput>
			<h3>#Arguments.targetPage# could not be found.</h3>
			<p>You requested a non-existent page.<br />
			Please check the URL.</p>
			</cfoutput>
			<cflocation url="/index.cfm" addtoken="no">
			<cfreturn true />

			<!--- If an error occurs, return false and the default error
			handler will run. --->
			<cfcatch>

			<cfreturn false />
			</cfcatch>
			</cftry>



		<cflocation url="/index.cfm" addtoken="no">
	</cffunction>

	<cffunction name="onSessionStart">

	  
  	</cffunction>

  	<cffunction name="onApplicationStart" returnType="boolean">

		

		


		<cfreturn 1>
	</cffunction>


	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="false" hint="Fires at first part of page processing.">
		<cfargument name="TargetPage" type="string" required="true"/>




		<cfreturn true />
	</cffunction>

	<cffunction
		name="OnRequest"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">

		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>

		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<cffunction
		name="OnRequestEnd"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after the page processing is complete.">

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<cffunction
		name="OnSessionEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is terminated.">

		<!--- Define arguments. --->
		<cfargument
			name="SessionScope"
			type="struct"
			required="true"
			/>

		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<cffunction
		name="OnApplicationEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the application is terminated.">

		<!--- Define arguments. --->
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>

		<!--- Return out. --->
		<cfreturn />
	</cffunction>


	<!--- <cffunction name="onCFCRequest"
                returntype="void">
        <cfargument name="cfcname"
                    type="string"
                    required="true" />

        <cfargument name="method"
                    type="string"
                    required="true" />

        <cfargument name="args"
                    type="Struct"
                    required="true" />

        <cfinvoke component = "#ARGUMENTS.cfcname#"
                  method = "#ARGUMENTS.method#"
                  returnVariable = "LOCAL.result"
                  argumentCollection = "#ARGUMENTS.args#" />

        <cfdump var="#LOCAL.result#" />

    </cffunction>--->


</cfcomponent>
