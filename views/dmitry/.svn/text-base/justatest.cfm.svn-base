<!--- Param form data. --->
<cfparam name="FORM.id" type="numeric" default="0" />
<cfparam name="FORM.name" type="string" default="" />
<cfparam name="FORM.hotness" type="string" default="" />
<cfparam name="FORM.photo" type="string" default="" />
<cfparam name="FORM.submitted" type="boolean" default="false" />
 
 
<!--- Check to see if the form as been submitted. --->
<cfif FORM.submitted>
 
    <!---
        Normally, this is where we would validate data, but for
        this demo, we are not going to worry about valid data.
    --->
 
 
    <!---
        Check to see if are inserting or updating data. For this
        part, we are not going to worry about the photo - that
        will come afterwards.
    --->
    <cfif FORM.id>
 
        <!--- Update the record. --->
        <cfquery name="qUpdate" datasource="#REQUEST.DSN#">
            UPDATE
                hottie
            SET
                name =
                    <cfqueryparam
                        value="#FORM.name#"
                        cfsqltype="cf_sql_varchar"
                        />,

                hotness =
                    <cfqueryparam
                        value="#FORM.hotness#"
                        cfsqltype="cf_sql_decimal"
                        scale="1"
                        />
            WHERE
                id =
                    <cfqueryparam
                        value="#FORM.id#"
                        cfsqltype="cf_sql_integer"
                        />
        </cfquery>
 
    <cfelse>
 
        <!--- Insert the new record. --->
        <cfquery name="qInsert" datasource="#REQUEST.DSN#">
            INSERT INTO hottie
            (
                name,
                hotness
            ) VALUES (
                <cfqueryparam
                    value="#FORM.name#"
                    cfsqltype="cf_sql_varchar"
                    />,

                <cfqueryparam
                    value="#FORM.hotness#"
                    cfsqltype="cf_sql_decimal"
                    scale="1"
                    />
            );

            <!--- Return the new ID. --->
            SELECT
                ( LAST_INSERT_ID() ) AS id
            ;
        </cfquery>
 
        <!--- Store the new id into our form variable. --->
        <cfset FORM.id = qInsert.id />
 
    </cfif>
 
 
    <!---
        ASSERT: At this point, we have either created or
        updated the given record and the ID of that record
        is stored in FORM.id.
    --->
 
 
    <!---
        Now that we have created a hottie record, let's check
        to see if we need to update photo.
    --->
    <cfif Len( FORM.photo )>
 
        <!--- Upload the file. --->
        <cffile
            action="upload"
            filefield="photo"
            destination="#ExpandPath( './' )#"
            nameconflict="makeunique"
            />
 
        <!--- Read in the binary data. --->
        <cffile
            action="readbinary"
            file="#ExpandPath( './' )##CFFILE.ServerFile#"
            variable="binPhoto"
            />
 
        <!--- Delete photo from server. --->
        <cffile
            action="delete"
            file="#ExpandPath( './' )##CFFILE.ServerFile#"
            />
 
 
        <!---
            Insert the binary data as a BLOB into the current
            hottie record.
        --->
        <cfquery name="qInsert" datasource="#REQUEST.DSN#">
            UPDATE
                hottie
            SET
                photo =
                    <cfqueryparam
                        value="#binPhoto#"
                        cfsqltype="cf_sql_blob"
                        />
            WHERE
                id =
                    <cfqueryparam
                        value="#FORM.id#"
                        cfsqltype="cf_sql_integer"
                        />
        </cfquery>
 
    </cfif>
 
</cfif>
 
 
<!---
    Query for the selected hottie. At first, this will return
    no records, but once the form is submitted, it will return
    the selected hottie.
--->

 
 
<cfoutput>
 
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html>
    <head>
        <title>ColdFusion / MySQL Blob Demo</title>
    </head>
    <body>
 
        <h1>
            ColdFusion / MySQL Blob Demo
        </h1>
 
 
        <form
            action="#CGI.script_name#"
            method="post"
            enctype="multipart/form-data">
 
            <!--- Send submission flag. --->
            <input type="hidden" name="submitted" value="true" />
 
            <!---
                Send back the ID of the record we are working
                with. This will be zero the first time.
            --->
            <input type="hidden" name="id" value="#FORM.id#" />
 
 
            <p>
                Name:<br />
                <input
                    type="text"
                    name="name"
                    value="#FORM.name#"
                    size="20"
                    maxlength="40"
                    />
            </p>
 
            <p>
                Hotness:<br />
                <input
                    type="text"
                    name="hotness"
                    value="#FORM.hotness#"
                    size="10"
                    maxlength="4"
                    />
            </p>
 
            <p>
                Photo:<br />
                <input
                    type="file"
                    name="photo"
                    size="150"
                    />
            </p>
 
            <!--- Check to see if a photo is available. --->
            
 
            <p>
                <input type="submit" value="Submit" />
            </p>
 
        </form>
 
    </body>
    </html>
 
</cfoutput>
