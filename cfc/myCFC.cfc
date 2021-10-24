<cfcomponent displayname="myCFC" hint="Challange cfc">
    <cffunction name="getMembers" access="remote" returnformat="plain" returntype="any">
    	<cfargument name="offset" default="0" type="numeric">
        <cfargument name="limit" default="20" type="numeric">
        <cfargument name="order" default="asc" type="string">
        <cfargument name="sort" default="last" type="string">
        <cfargument name="search" default="" type="string" />
		 <cfargument name="categoryid" default="" type="string" />

     	<cfquery name="getMembers" datasource="#request.DATASOURCE#">
        	WITH Rows AS
            (
				SELECT	  Title,First,Last,Chamber,Party,LegState,District,
						 ROW_NUMBER() OVER (ORDER BY #sort# #order#) [Row]
                FROM congress-memersb 
                
                WHERE 1=1
				
                
               
             )
                SELECT
                      *
                FROM
                     Rows
                
        </cfquery>

      

        <cfset resultStruct = Structnew() />
      	<cfset resultStuct["total"] = getMembers.total />
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