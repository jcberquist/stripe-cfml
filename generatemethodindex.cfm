<cfscript>
metadata = getComponentMetaData( "stripe" );
functionArrayLength = arrayLen( metadata.functions );
functionStruct = { };
functionNameArray = [ ];
apiRoutes = [ 'Charge','Customer','Plan','Coupon','InvoiceItem','Invoice','Recipient','Transfer','Event','Token' ];

for ( i = 1; i <= functionArrayLength; i++ ) {
	if ( metadata.functions[ i ].access == "public" and metadata.functions[ i ].name != "init" ) {
		arrayAppend( functionNameArray, metadata.functions[ i ].name );
		parameters = [ ];
		for ( parameter in metadata.functions[ i ].parameters ) {
			arrayAppend( parameters, ( parameter.required ? 'required ' : '' ) & parameter.type & ' ' & parameter.name & ( parameter.name eq "currency" ? ' = variables.defaultCurrency' : '' ) );
		}
		functionStruct[ metadata.functions[ i ].name ] = '#metadata.functions[ i ].name#( #arrayToList( parameters, ", " )# )';
	}
}

html = '';
markdown = '';

for ( apiRoute in apiRoutes ) {

	aLink = 'https://stripe.com/docs/api###lcase( apiRoute )#s';

	html &= '<h4>' & apiRoute & 's <a href="#aLink#">#aLink#</a></h4>' & chr( 10 ) & '<pre>' & chr( 10 );
	markdown &= chr( 10 ) & '**' & apiRoute & 's** ' & aLink & chr( 10 ) & chr( 10 );

	for ( functionName in functionNameArray ) {
		if ( findNoCase( apiRoute, functionName ) && structKeyExists( functionStruct, functionName ) ) {
			html &= functionStruct[ functionName ] & chr( 10 );
			markdown &= chr( 9 ) & chr( 9 ) & functionStruct[ functionName ] & chr( 10 );
			structDelete( functionStruct, functionName );
		}
	}

	html &= '</pre>' & chr( 10 );

}

html &= '<h4>Miscellaneous</h4><pre>';
markdown &= chr( 10 ) & '**Miscellaneous**' & chr( 10 ) & chr( 10 );


for ( functionName in functionNameArray ) {
	if ( structKeyExists( functionStruct, functionName ) ) {
		html &= functionStruct[ functionName ] & chr( 10 );
		markdown &= chr( 9 ) & chr( 9 ) & functionStruct[ functionName ] & chr( 10 );
	}
}

html &= '</pre>';

</cfscript>

<cfoutput>
<label>html</label><br>
<textarea>#html#</textarea><br>
<br>
<label>markdown</label><br>
<textarea>#markdown#</textarea><br>
</cfoutput>