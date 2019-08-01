component {

    public any function init( required any config, required struct objectMetadata ) {
        variables.config = arguments.config;
        variables.objectMetadata = arguments.objectMetadata;
        variables.parserUtils = new parserUtils();
        return this;
    }

    public void function parse( required struct response ) {
        if ( response.keyExists( 'object' ) && isSimpleValue( response.object ) ) {
            var metadata = objectMetadata.keyExists( response.object ) ? objectMetadata[ response.object ] : { };

            // almost all objects have a `created` timestamp
            // adding a check here so any object metadata that only
            // needs to register `created` can be implicit
            if ( !metadata.keyExists( 'created' ) ) {
                metadata[ 'created' ] = 'datetime';
            }

            parseResTypes( response, metadata );
        }

        for ( var key in response ) {
            if ( !response.keyExists( key ) || isNull( response[ key ] ) ) continue;
            if ( isStruct( response[ key ] ) ) {
                parse( response[ key ] );
            } else if ( isArray( response[ key ] ) ) {
                for ( var item in response[ key ] ) {
                    if ( isStruct( item ) ) {
                        parse( item );
                    }
                }
            }
        }
    }

    private void function parseResTypes( res, metadata ) {
        for ( var key in metadata ) {
            if ( !structKeyExists( res, key ) || isNull( res[ key ] ) ) {
                continue;
            }

            if ( isStruct( metadata[ key ] ) ) {
                if ( isStruct( res[ key ] ) ) {
                    parseResTypes( res[ key ], metadata[ key ] );
                } else if ( isArray( res[ key ] ) ) {
                    for ( var item in res[ key ] ) {
                        if ( isStruct( item ) ) {
                            parseResTypes( item, metadata[ key ] );
                        }
                    }
                }
            } else {
                switch ( metadata[ key ] ) {
                    case 'datetime':
                        if ( config.get( 'convert_timestamps' ) ) {
                            res[ key ] = parserUtils.parseUTCTimestamp( res[ key ] );
                        }
                        break;
                    case 'currency':
                        if ( config.get( 'convert_to_cents' ) ) {
                            res[ key ] = res[ key ] / 100;
                        }
                        break;
                }
            }
        }
    }

}
