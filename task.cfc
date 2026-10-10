component accessors="true" {

    function run( string majorVersion = 'endive' ) {
        var bundle = deserializeJSON( fileRead( resolvePath( 'resources/#majorVersion#.json' ), 'utf-8' ) );
        var resourceNames = bundle.keyArray().sort( 'text' );

        var ref = [
            '## stripe-cfml reference',
            'For documentation on which arguments can be passed to each method please see the [Stripe API Reference](https://stripe.com/docs/api). The arguments that are listed here are named arguments that ultimately appear in the URL of an API HTTP request. Since the Node library passes these arguments by position, you can refer to this page to see the names to use when passing these arguments by name.'
        ];

        for ( var resourceName in resourceNames ) {
            ref.append( reference( resourceName, bundle[ resourceName ] ) );
        }

        print.line( 'Writing reference.md' );
        fileWrite(
            resolvePath( './reference.md' ),
            ref.toList( server.separator.line & server.separator.line ) & server.separator.line,
            'utf-8'
        );
    }

    function reference( resourceName, meta ) {
        var patternClass = createObject( 'java', 'java.util.regex.Pattern' );
        var urlKeyRegex = patternClass.compile( '\{([a-z_]+)\}' );
        var lf = server.separator.line;

        var methods = [ ];
        for ( var methodName in meta.methods ) {
            var pathVariables = [ ];
            if ( meta.methods[ methodName ].keyExists( 'positionalArgs' ) ) {
                pathVariables = meta.methods[ methodName ].positionalArgs;
            } else {
                var urlKeyMatcher = urlKeyRegex.matcher( meta.methods[ methodName ].path );
                while ( urlKeyMatcher.find() ) {
                    pathVariables.append( urlKeyMatcher.group( 1 ) );
                }
            }
            methods.append( 'stripe.#resourceName#.#methodName#(#pathVariables.toList( ', ' )#);' );
        }

        // add overrides for accounts.retrieve();
        if ( resourceName == 'accounts' ) {
            methods.append( 'stripe.accounts.retrieve();' );
            methods.append( 'stripe.accounts.retrieve(account_id);' );
        }

        return '#### stripe.#resourceName##lf##lf#```cfc#lf##methods.sort( 'text' ).toList( lf )##lf#```';
    }

}
