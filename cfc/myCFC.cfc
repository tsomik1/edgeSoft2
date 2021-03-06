<cfcomponent displayname="myCFC" hint="Challange cfc">
    <cffunction name="getMembers" access="remote" returnformat="plain" returntype="any">
    	<cfargument name="offset" default="0" type="numeric">
        <cfargument name="limit" default="20" type="numeric">
        <cfargument name="order" default="asc" type="string">
        <cfargument name="sort" default="last" type="string">
        <cfargument name="search" default="" type="string" />
		 <cfargument name="party" default="" type="string" />
         <cfargument name="state" default="" type="string" />

     	<cfquery name="getMembers" datasource="#request.DATASOURCE#">
        	WITH Rows AS
            (
				SELECT	  Title,First,Last,Chamber,Party,LegState,District,
						 ROW_NUMBER() OVER (ORDER BY #sort# #order#) [Row]
                FROM congressMembers 
                
                WHERE 1=1
				<cfif Search NEQ "">
                    and (first like '%#arguments.Search#%' OR last like '%#arguments.Search#%')
                </cfif>
                <cfif Party NEQ "">
                    and (Party = <cfqueryparam value = "#arguments.party#" CFSQLType="cf_sql_varchar">)
                </cfif>
               <cfif state NEQ "">
                    and (LegState = <cfqueryparam value = "#arguments.state#" CFSQLType="cf_sql_varchar">)
                </cfif>
             )
                SELECT
                      *
                FROM
                     Rows
                WHERE Row >= #offset+1# and Row <= #offset+limit#
                 ORDER BY first,last
        </cfquery>

               <cfquery name="qCount" datasource="#request.datasource#">
                        SELECT COUNT(*) as total
                    FROM congressMembers 
                    
                    WHERE 1=1
                    <cfif Search NEQ "">
                        and first like '%#arguments.Search#%' OR last like '%#arguments.Search#%'
                    </cfif>
                <cfif Party NEQ "">
                    and (Party = <cfqueryparam value = "#arguments.party#" CFSQLType="cf_sql_varchar">)
                </cfif>


                <cfif state NEQ "">
                    and (LegState = <cfqueryparam value = "#arguments.state#" CFSQLType="cf_sql_varchar">)
                </cfif>
                    
                </cfquery>




      

        <cfset resultStruct = Structnew() />
      	<cfset resultStuct["total"] = qCount.total />
        <cfset resultStuct["rows"] = ArrayNew(1) />
      	<cfset count = 1/>
      	<cfloop query="getMembers" >
            <cfset resultStuct["rows"][count]['COUNT'] =  Count />
			<cfset resultStuct["rows"][count]['title'] =  getMembers.title />
			<cfset resultStuct["rows"][count]['first'] =  getMembers.first />
            <cfset resultStuct["rows"][count]['last'] =  getMembers.last />
            <cfset resultStuct["rows"][count]['Chamber'] =  getMembers.Chamber />
            <cfset resultStuct["rows"][count]['Party'] =  getMembers.Party />
            <cfset resultStuct["rows"][count]['LegState'] =  getMembers.LegState />
            <cfset resultStuct["rows"][count]['District'] =  getMembers.District />
            <cfset Count = Count + 1/>
      	</cfloop>

      	<cfreturn SerializeJSON(resultStuct) />
    </cffunction>

</cfcomponent>