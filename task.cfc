component accessors="true" {

    property name="formatterUtil" inject="Formatter";

    function run() {
        organizeResources();
        organizeMetadata();
        buildReference();
    }

    function organizeResources() {
        var resourcePath = resolvePath( 'lib/resources/' );
        var resources = directoryList( resourcePath, true, 'path', '*.cfc' ).sort( 'text' );

        for ( var srcPath in resources ) {
            var relativePath = srcPath.replace( resourcePath, '' ).replace( '\', '/', 'all' );

            var srcCode = fileRead( srcPath, 'utf-8' );
            var meta = loadMetadata( srcCode );

            if ( !isNull( meta ) ) {
                print.line( 'Organizing #relativePath#' );
                fileWrite( srcPath, organize( srcCode, meta ), 'utf-8' );
            }
        }
    }

    function organizeMetadata() {
        var metadataPath = resolvePath( './metadata/' );
        var md = directoryList( metadataPath, true, 'path', '*.json' ).sort( 'text' );

        for ( var srcPath in md ) {
            var relativePath = srcPath.replace( metadataPath, '' ).replace( '\', '/', 'all' );
            print.line( 'Organizing #relativePath#' );
            var src = fileRead( srcPath, 'utf-8' );
            var formatted = formatterUtil.formatJson( json = src, spaceAfterColon = true, sortKeys = 'text' );
            fileWrite( srcPath, formatted & server.separator.line, 'utf-8' );
        }
    }

    function buildReference() {
        var resourcePath = resolvePath( 'lib/resources/' );
        var resources = directoryList( resourcePath, true, 'path', '*.cfc' ).sort( 'text' );

        var ref = [
            '## stripe-cfml reference',
            'For documentation on which arguments can be passed to each method please see the [Stripe API Reference](https://stripe.com/docs/api). The arguments that are listed here are named arguments that ultimately appear in the URL of an API HTTP request. Since the Node library passes these arguments by position, you can refer to this page to see the names to use when passing these arguments by name.'
        ];

        for ( var srcPath in resources ) {
            var relativePath = srcPath.replace( resourcePath, '' ).replace( '\', '/', 'all' );
            var srcCode = fileRead( srcPath, 'utf-8' );
            var meta = loadMetadata( srcCode );
            ref.append( reference( relativePath, srcCode, meta ) );
        }

        print.line( 'Writing reference.md' );
        fileWrite(
            resolvePath( './reference.md' ),
            ref.toList( server.separator.line & server.separator.line ) & server.separator.line,
            'utf-8'
        );
    }

    function compare( string stripeNodePath ) {
        var jsPath = resolvePath( stripeNodePath ).replace( '\', '/', 'all' ) & 'lib/resources/';
        var resourcePath = resolvePath( './lib/resources/' );

        var jsResources = directoryList( jsPath, true, 'path', '*.js' ).sort( 'text' );
        var resources = directoryList( resourcePath, true, 'path', '*.cfc' ).sort( 'text' );

        var jsMap = jsResources.reduce( ( r, p ) => {
            var key = p
                .replace( '\', '/', 'all' )
                .replace( jsPath, '' )
                .lcase()
                .left( -3 );
            r[ key ] = p;
            return r;
        }, { } );

        var resourceMap = resources.reduce( ( r, p ) => {
            var key = p
                .replace( resourcePath, '' )
                .replace( '\', '/', 'all' )
                .lcase()
                .left( -4 );
            r[ key ] = p;
            return r;
        }, { } );

        var count = 0;

        for ( var rp in jsMap.keyArray().sort( 'text' ) ) {
            if ( resourceMap.keyExists( rp ) ) {
                var jsSrcCode = fileRead( jsMap[ rp ], 'utf-8' );
                var srcCode = fileRead( resourceMap[ rp ], 'utf-8' );
                var jsMethods = findJSMethods( jsSrcCode );
                var methods = loadMetadata( srcCode ).data.methods.keyArray();
                for ( var m in jsMethods ) {
                    // we use `delete` not `del`
                    if ( m == 'del' ) m = 'delete';
                    if ( !methods.findNoCase( m ) ) {
                        print.redLine( 'Resource `#rp#` is missing method `#m#`.' )
                    }
                }
                for ( var m in methods ) {
                    // we use `delete` not `del`
                    if ( m == 'delete' ) m = 'del';
                    if ( !jsMethods.findNoCase( m ) ) {
                        print.redLine( 'Resource `#rp#` has extra method `#m#`.' )
                    }
                }
            } else {
                print.redLine( 'Resource `#rp#` is missing.' );
            }
        }
    }

    function organize( srcCode, meta ) {
        var patternClass = createObject( 'java', 'java.util.regex.Pattern' );
        var quoteKeyRegex = patternClass.compile( '"([A-Za-z_]+)"\s*:' );
        var methodNameRegex = patternClass.compile( '\n\s{8}([A-Za-z]+):' );

        var formattedMeta = formatterUtil.formatJson( json = meta.data, spaceAfterColon = true, sortKeys = 'text' );
        formattedMeta = quoteKeyRegex
            .matcher( formattedMeta )
            .replaceAll( '$1:' )
            .replace( '"', '''', 'all' );
        formattedMeta = methodNameRegex
            .matcher( formattedMeta )
            .replaceAll( '#chr( 10 )#        ''$1'':' )
            .replace( '#chr( 10 )#', '#chr( 10 )#    ', 'all' );

        return srcCode.replace( meta.raw, formattedMeta );
    }

    function reference( relativePath, srcCode, meta ) {
        var patternClass = createObject( 'java', 'java.util.regex.Pattern' );
        var urlKeyRegex = patternClass.compile( '\{([a-z_]+)\}' );
        var lf = server.separator.line;

        var cfcName = relativePath.replace( '/', '.', 'all' ).left( -4 );
        var cfcDoc = meta.doc.len() ? '#lf##lf##meta.doc#' : '';

        var methods = [ ];
        for ( var methodName in meta.data.methods ) {
            var pathVariables = [ ];
            if ( meta.data.methods[ methodName ].keyExists( 'positionalArgs' ) ) {
                pathVariables = meta.data.methods[ methodName ].positionalArgs;
            } else {
                var urlKeyMatcher = urlKeyRegex.matcher( meta.data.methods[ methodName ].path );
                while ( urlKeyMatcher.find() ) {
                    pathVariables.append( urlKeyMatcher.group( 1 ) );
                }
            }
            methods.append( 'stripe.#cfcName#.#methodName#(#pathVariables.toList( ', ' )#);' );
        }

        // add override for accounts.retrieve();
        if ( cfcName == 'accounts' ) {
            methods.append( 'stripe.accounts.retrieve();' );
        }


        return '#### stripe.#cfcName##cfcDoc##lf##lf#```cfc#lf##methods.sort( 'text' ).toList( lf )##lf#```';
    }

    function loadMetadata( srcCode ) {
        var patternClass = createObject( 'java', 'java.util.regex.Pattern' );

        var unquoteKeyRegex = patternClass.compile( '\b([A-Za-z_]+)\s*:' );
        var metaRegex = patternClass.compile( 'this\.metadata\s*=\s*(\{.*?\n\s{4}\})', 32 );
        var docRegex = patternClass.compile( '^/\*\*(.*?)\*/', 32 );

        var metaMatcher = metaRegex.matcher( srcCode );

        if ( metaMatcher.find() ) {
            var rawMeta = metaMatcher.group( 1 );
            var meta = unquoteKeyRegex
                .matcher( rawMeta )
                .replaceAll( '"$1":' )
                .replace( '''', '"', 'all' );

            var docMatcher = docRegex.matcher( srcCode );
            var doc = '';
            if ( docMatcher.find() ) {
                doc = docMatcher
                    .group( 1 )
                    .reReplace( '(\n)\s*\*\s*', '\1', 'all' )
                    .trim();
            }

            return {
                raw: rawMeta,
                data: deserializeJSON( meta ),
                doc: doc
            }
        }
    }

    function findJSMethods( srcCode ) {
        var patternClass = createObject( 'java', 'java.util.regex.Pattern' );
        var basicRegex = patternClass.compile( 'includeBasic:\s*\[([^\]]+)\]', 2 );
        var stripeMethodRegex = patternClass.compile( '^\s*(\w+):\s*stripeMethod\(', 10 );
        var methodRegex = patternClass.compile( '^  (\w+)\(', 10 );

        var methods = [ ];

        var basicMethodsMatcher = basicRegex.matcher( srcCode );
        if ( basicMethodsMatcher.find() ) {
            methods.append(
                basicMethodsMatcher
                    .group( 1 )
                    .listToArray()
                    .map( ( m ) => m.trim().replace( '''', '', 'all' ) ),
                true
            );
        }

        var stripeMethodsMatcher = stripeMethodRegex.matcher( srcCode );
        while ( stripeMethodsMatcher.find() ) {
            methods.append( stripeMethodsMatcher.group( 1 ) );
        }

        var methodsMatcher = methodRegex.matcher( srcCode );
        while ( methodsMatcher.find() ) {
            methods.append( methodsMatcher.group( 1 ) );
        }

        return methods;
    }

}
