<cfscript>
param name="form.testsToRun" default="";

cfcBase = replace( replace( getDirectoryFromPath( getCurrentTemplatePath() ), expandPath( '/' ), '' ), '/', '.', 'all' );
testSuite = createObject( "component", "mxunit.framework.TestSuite" ).TestSuite();
metadata = { };
cfcNames = directoryList( getDirectoryFromPath( getCurrentTemplatePath() ), false, 'name', '*.cfc' );

for ( cfcName in cfcNames ) {
	if ( arrayFindNoCase( [ 'Application.cfc', 'testBase.cfc' ], cfcName ) ) continue;
	thisCfc = cfcBase & replace( cfcName, '.cfc', '' );
	thisMetadata = getComponentMetaData( thisCfc );
	for ( i = 1; i <= arrayLen( thisMetadata.functions ); i++ ) {
		if ( !structKeyExists( metadata, thisCfc ) ) metadata[ thisCfc ] = [ ];
		if ( !listFind( 'setup,beforeTests,afterTests', thisMetadata.functions[ i ].name ) && thisMetadata.functions[ i ].access == "public" ) {
			arrayAppend( metadata[ thisCfc ], thisMetadata.functions[ i ].name );
		} 
	}
}

for ( cfcName in structKeyArray( metadata ) ) {
	functionsToRun = [ ];
	for ( functionName in metadata[ cfcName ] ) {
		if ( listFind( form.testsToRun, cfcName & ":" & functionName ) ) {
			arrayAppend( functionsToRun, functionName );
		}		
	}
	testSuite.add( cfcName, arrayToList( functionsToRun ) );		
}

results = testSuite.run();

</cfscript>
<cfoutput>
<h1 style="padding:10px;">stripe.cfc tests</h1>

<form action="" method="post" style="padding:10px;">

<label>stripe.com test secret key</label><br>
<input name="stripeTESTSecretKey"type="text" value="#request.stripesecretkey#" size="36">	

<cfloop array="#structKeyArray( metadata )#" index="cfcName">
	<fieldset>
		<legend>#cfcName#</legend>
		<cfloop array="#metadata[ cfcName ]#" index="functionName">
			<label><input type="checkbox" name="testsToRun" value="#cfcName#:#functionName#"<cfif listFind( form.testsToRun, cfcName & ":" & functionName )> checked</cfif>> #functionName#</label><br>
		</cfloop>	
	</fieldset>
</cfloop>
<input type="submit" value="Run tests">
</form>
<h2 style="padding:10px;">Results</h2>
#results.getResultsOutput( 'html' )#
</cfoutput>