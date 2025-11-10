component accessors="true" {

    property resourceName;
    property metadata;

    function init( required any stripe, required string resourceName, required struct resourceMetadata ) {
        variables.stripe = arguments.stripe;
        variables.defaultHost = arguments.stripe.getConfig().get( 'host' );
        variables.resourceName = arguments.resourceName;
        variables.metadata = parseMetadata( arguments.resourceMetadata );
        return this;
    }

    public struct function onMissingMethod( missingMethodName, missingMethodArguments ) {
        if ( !metadata.methods.keyExists( missingMethodName ) ) {
            // special case for accounts.retrieve
            if ( variables.resourceName == 'accounts' && missingMethodName == 'retrieve' ) {
                return accountsRetrieve( argumentCollection = arguments.missingMethodArguments );
            }

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

    private struct function parseMetadata( metadata ) {
        var parsed = duplicate( arguments.metadata );
        for ( var methodName in parsed.methods ) {
            var meta = parsed.methods[ methodName ];
            meta.append( getBaseMethodMetadata(), false );
            meta[ 'pathArgs' ] = parsePath( meta.path );
            if ( !meta.keyExists( 'positionalArgs' ) ) {
                meta[ 'positionalArgs' ] = meta.pathArgs;
            }
        }

        var methodNameArray = parsed.methods.keyArray();
        arraySort( methodNameArray, 'text' );
        parsed.methodNameList = arrayMap( methodNameArray, function( mn ) {
            return 'stripe.#resourceName#.#mn#()';
        } );
        var length = arrayLen( parsed.methodNameList );
        if ( length > 1 ) {
            parsed.methodNameList[ length ] = 'and ' & parsed.methodNameList[ length ];
        }
        parsed.methodNameList = parsed.methodNameList.toList( ', ' );

        return parsed;
    }

    private struct function getBaseMethodMetadata() {
        return {
            host: variables.defaultHost,
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

    private struct function accountsRetrieve() {
        if (
            arrayLen( arguments ) == 0 ||
            (
                !structKeyExists( arguments, 'account_id' ) &&
                !( structKeyExists( arguments, '1' ) && isSimpleValue( arguments[ 1 ] ) )
            )
        ) {
            // special case return `/account` instead of default since no account id was supplied
            var methodMetadata = getBaseMethodMetadata();
            methodMetadata.path = '/v1/account';
            methodMetadata.pathArgs = [ ];
            methodMetadata.positionalArgs = [ ];
            return stripe.call(
                'accounts',
                'retrieve',
                arguments,
                methodMetadata
            );
        }

        var methodMetadata = getBaseMethodMetadata();
        methodMetadata.path = '/v1/accounts/{account_id}';
        methodMetadata.pathArgs = [ 'account_id' ];
        methodMetadata.positionalArgs = [ 'account_id' ];
        return stripe.call(
            'accounts',
            'retrieve',
            arguments,
            methodMetadata
        );
    }

}
