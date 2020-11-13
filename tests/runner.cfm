<cfsilent>
<cfscript>
    testBox = new testbox.system.TestBox();
    param name="url.reporter" default="simple";
    param name="url.directory" default="tests.specs";
    args = {
        reporter: url.reporter,
        directory: url.directory,
        coverage: {
            whitelist: "/handlers,/lib,/ModuleConfig.cfc,/stripe.cfc"
        }
    };
    if ( structKeyExists( url, 'bundles' ) ) args.bundles = url.bundles;
    results = testBox.run( argumentCollection = args );
</cfscript>
</cfsilent>
<cfcontent reset="true">
<cfoutput>#trim( results )#</cfoutput>
