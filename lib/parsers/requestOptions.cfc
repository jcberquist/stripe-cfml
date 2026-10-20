/**
 * Parses the per-request options that accompany a method's parameters: the arguments
 * that become Stripe request headers, and the options that only steer how the request is
 * built (`optionKeys`). Both are accepted as named arguments, or positionally in the
 * struct that follows the params struct, and none of them are sent as parameters.
 */
component {

    variables.headerKeys = {
        'api_key': 'Authorization',
        'api_version': 'Stripe-Version',
        'stripe_version': 'Stripe-Version',
        'idempotency_key': 'Idempotency-Key',
        'stripe_account': 'Stripe-Account'
    };

    // options that are not sent to Stripe at all
    variables.optionKeys = [ 'inject_optional_currency' ];

    public any function init( required any config ) {
        variables.config = config;
        return this;
    }

    public boolean function containsRequestArgs( required struct source ) {
        var keys = structKeyArray( headerKeys );
        keys.append( optionKeys, true );
        for ( var key in keys ) {
            if ( structKeyExists( source, key ) || structKeyExists( source, key.replace( '_', '', 'all' ) ) ) {
                return true;
            }
        }
        return false;
    }

    /**
     * Returns `headers` (to send to Stripe), `options` (keyed by their snake_case names) and
     * `argNames`, every argument consumed here, so the caller can keep them out of the params.
     */
    public struct function parse(
        required any source,
        required struct methodMetadata,
        required boolean hasPositionalArguments
    ) {
        var requestOptions = { headers: { }, options: { }, argNames: [ ] };

        for ( var key in optionKeys ) {
            for ( var argName in [ key, key.replace( '_', '', 'all' ) ] ) {
                if ( structKeyExists( source, argName ) ) {
                    requestOptions.argNames.append( argName );
                    requestOptions.options[ key ] = source[ argName ];
                }
            }
        }

        for ( var key in headerKeys ) {
            var headerName = headerKeys[ key ];
            var argNames = [ key, key.replace( '_', '' ) ];
            var configSetting = config.get( key );
            if ( len( configSetting ) ) {
                requestOptions.headers[ headerName ] = configSetting;
            }

            if ( key == 'api_version' && !hasPositionalArguments ) {
                // api_version is not supported as a header named argument
                continue;
            }

            for ( var argName in argNames ) {
                if ( structKeyExists( source, argName ) ) {
                    requestOptions.argNames.append( argName );
                    requestOptions.headers[ headerName ] = source[ argName ];
                }
            }
        }

        // auth header is required and needs to be prefixed with `Bearer`
        if ( !requestOptions.headers.keyExists( 'Authorization' ) ) {
            throw( 'Stripe requires an API key but none has been set.' );
        }
        requestOptions.headers[ 'Authorization' ] = 'Bearer ' & requestOptions.headers[ 'Authorization' ];

        return requestOptions;
    }

}
