component {

    variables.headerKeys = {
        'api_key': 'Authorization',
        'api_version': 'Stripe-Version',
        'stripe_version': 'Stripe-Version',
        'idempotency_key': 'Idempotency-Key',
        'stripe_account': 'Stripe-Account'
    };

    public any function init( required any config ) {
        variables.config = config;
        return this;
    }

    public struct function parse(
        required any headersSource,
        required struct methodMetadata,
        required boolean hasPositionalArguments
    ) {
        var headerData = {
            headers: { },
            headerArgNames: [ ]
        };

        for ( var key in headerKeys ) {
            var headerName = headerKeys[ key ];
            var argNames = [ key, key.replace( '_', '' ) ];
            var configSetting = config.get( key );
            if ( len( configSetting ) ) {
                headerData.headers[ headerName ] = configSetting;
            }

            if ( key == 'api_version' && !hasPositionalArguments ) {
                // api_version is not supported as a header named argument
                continue;
            }

            for ( var argName in argNames ) {
                if ( structKeyExists( headersSource, argName ) ) {
                    headerData.headerArgNames.append( argName );
                    headerData.headers[ headerName ] = headersSource[ argName ];
                }
            }
        }

        // auth header is required and needs to be prefixed with `Bearer`
        if ( !headerData.headers.keyExists( 'Authorization' ) ) {
            throw( 'Stripe requires an API key but none has been set.' );
        }
        headerData.headers[ 'Authorization' ] = 'Bearer ' & headerData.headers[ 'Authorization' ];

        return headerData;
    }

}
