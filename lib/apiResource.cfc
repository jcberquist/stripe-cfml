component {

    variables.metadata = { };

    function init( required any stripe, required any config, required string resourceName ) {
        variables.stripe = arguments.stripe;
        variables.config = arguments.config;
        variables.resourceName = resourceName;
        var resource = new 'resources.#resourceName#'( );
        variables.metadata = loadMetadata( resource.metadata );
        var resourceMetadata = getMetadata( resource );
        if ( resourceMetadata.keyExists( 'functions' ) ) {
            for ( var func in getMetadata( resource ).functions ) {
                if ( func.access == 'public' ) {
                    this[ func.name ] = resource[ func.name ];
                }
            }
        }
        return this;
    }

    public struct function onMissingMethod( missingMethodName, missingMethodArguments ) {
        if ( !metadata.methods.keyExists( missingMethodName ) ) {
            var message = '`stripe.#resourceName#.#missingMethodName#()` is not a valid method for `stripe.#resourceName#`. Available methods are #metadata.methodNameList#.';
            throw( message );
        }
        return stripe.call(
            resourceName,
            missingMethodName,
            missingMethodArguments,
            metadata.methods[ missingMethodName ]
        );
    }

    private struct function loadMetadata( metadata ) {
        var loaded = duplicate( metadata );
        var baseMethodMeta = getBaseMethodMetadata();
        for ( var methodName in loaded.methods ) {
            loaded.methods[ methodName ].append( baseMethodMeta, false );
            loaded.methods[ methodName ][ 'pathArgs' ] = parsePath( loaded.methods[ methodName ].path );
            if ( !loaded.methods[ methodName ].keyExists( 'positionalArgs' ) ) {
                loaded.methods[ methodName ][ 'positionalArgs' ] = loaded.methods[ methodName ].pathArgs;
            }
        }

        var methodNameArray = loaded.methods.keyArray();
        arraySort( methodNameArray, 'text' );
        loaded.methodNameList = arrayMap( methodNameArray, function( mn ) {
            return 'stripe.#resourceName#.#mn#()';
        } );
        var length = arrayLen( loaded.methodNameList );
        loaded.methodNameList[ length ] = 'and ' & loaded.methodNameList[ length ];
        loaded.methodNameList = loaded.methodNameList.toList( ', ' );

        return loaded;
    }

    private struct function getBaseMethodMetadata() {
        return {
            endpoint: config.get( 'endpoint' ),
            httpMethod: 'get',
            multipart: false,
            arguments: { }
        };
    }

    private array function parsePath( required string path ) {
        return arrayMap( reMatch( '\{([a-z_]+)\}', path ), function( s ) {
            return mid( s, 2, len( s ) - 2 );
        } );
    }

}
