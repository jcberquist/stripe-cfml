component {

    public struct function init( string apiKey = '', struct config = { } ) {
        var configObj = new lib.config( apiKey, config );
        var basePath = getDirectoryFromPath( getMetadata( this ).path ).replace( '\', '/', 'all' );
        variables.objectMetadata = loadMetadata( basePath );
        variables.httpService = new lib.httpService();
        variables.parsers = {
            arguments: new lib.parsers.arguments( configObj ),
            headers: new lib.parsers.headers( configObj ),
            response: new lib.parsers.response( configObj, objectMetadata )
        };

        for ( var resourcePath in listResources( basePath ) ) {
            var resourceParts = resourcePath.listFirst( '.' ).listToArray( '/' );
            var parent = this;
            for ( var i = 1; i < resourceParts.len(); i++ ) {
                if ( !structKeyExists( parent, resourceParts[ i ] ) ) {
                    parent[ resourceParts[ i ] ] = { };
                }
                parent = parent[ resourceParts[ i ] ];
            }
            parent[ resourceParts[ i ] ] = new lib.apiResource( this, configObj, resourceParts.toList( '.' ) );
        }

        this[ 'webhooks' ] = new lib.webhooks( parsers.response );

        return this;
    }

    public any function call(
        required string resourceName,
        required string methodName,
        required any argCollection,
        required struct methodMetadata,
        struct argOverrides = { }
    ) {
        var hasPositionalArguments = arrayLen( argCollection ) == 0 || structKeyExists( argCollection, '1' );
        var sources = getSources( argCollection, methodMetadata, hasPositionalArguments );
        var ignoredArgs = [ ];

        // collect positional args and add to params
        if ( hasPositionalArguments ) {
            var argIndex = 1;
            for ( var argName in methodMetadata.positionalArgs ) {
                if ( arrayLen( argCollection ) < argIndex ) {
                    validationFailure(
                        '`#resourceName#.#methodName#()` missing positional argument `#argName#` at index [#argIndex#]'
                    );
                } else if ( !isSimpleValue( argCollection[ argIndex ] ) ) {
                    validationFailure(
                        '`#resourceName#.#methodName#()` positional argument `#argName#` at index [#argIndex#] is not a simple value'
                    );
                } else {
                    sources.params[ argName ] = argCollection[ argIndex ];
                }

                argIndex++;
            }
        } else {
            for ( var argName in methodMetadata.positionalArgs ) {
                if ( !structKeyExists( argCollection, argName ) ) {
                    validationFailure( '`#resourceName#.#methodName#()` missing required argument `#argName#`' );
                } else if ( !isSimpleValue( argCollection[ argName ] ) ) {
                    validationFailure( '`#resourceName#.#methodName#()` argument `#argName#` is not a simple value' );
                }
            }
        }

        sources.params.append( argOverrides, true );

        // path
        var path = 'https://' & methodMetadata.endpoint & methodMetadata.path;
        for ( var argName in methodMetadata.pathArgs ) {
            path = path.replace( '{#argName#}', sources.params[ argName ] );
            ignoredArgs.append( argName );
        }

        // headers
        var headerData = parsers.headers.parse( sources.headers, methodMetadata, hasPositionalArguments );
        if ( !hasPositionalArguments ) {
            ignoredArgs.append( headerData.headerArgNames, true );
        }

        // params
        var params = parsers.arguments.parse( sources.params, methodMetadata.arguments, ignoredArgs );

        var requestStart = getTickCount();
        var rawResponse = httpService.makeRequest(
            methodMetadata.httpmethod,
            path,
            headerData.headers,
            params,
            methodMetadata.multipart
        );

        // if we weren't able to connect to Stripe at all, throw an error
        if ( rawResponse.statuscode.startswith( 'Connection Failure' ) ) {
            throw(
                type = 'StripeConnectionFailure',
                message = 'Could not connect to Stripe API: ' & rawResponse.status_text,
                detail = rawResponse.errorDetail
            );
        }

        var response = { };
        response[ 'duration' ] = getTickCount() - requestStart;
        response[ 'headers' ] = rawResponse.responseheader;
        response[ 'status' ] = listFirst( rawResponse.statuscode, ' ' );
        response[ 'content' ] = rawResponse.filecontent;

        if ( structKeyExists( response.headers, 'Request-Id' ) ) {
            response[ 'requestId' ] = response.headers[ 'Request-Id' ];
        } else if ( int( response.status ) >= 200 && int( response.status ) < 300 ) {
            throw(
                type = 'StripeResponseException',
                message = 'Request-Id is missing from the response headers',
                extendedInfo = serializeJSON( response )
            );
        }

        if ( response.headers[ 'Content-Type' ] == 'application/json' ) {
            response.content = deserializeJSON( response.content );
            parsers.response.parse( response.content );
        }

        return response;
    }

    private any function getSources(
        required any argCollection,
        required struct methodMetadata,
        required boolean hasPositionalArguments
    ) {
        var sourceKeys = [
            {
                name: 'params',
                offset: 1
            },
            {
                name: 'headers',
                offset: 2
            }
        ];
        var sources = { };
        for ( var source in sourceKeys ) {
            if ( hasPositionalArguments ) {
                var sourceIndex = arrayLen( methodMetadata.positionalArgs ) + source.offset;
                sources[ source.name ] = arrayLen( argCollection ) >= sourceIndex ? argCollection[ sourceIndex ] : { };
            } else {
                sources[ source.name ] = argCollection;
            }
        }
        return sources;
    }

    private struct function loadMetadata( required string basePath ) {
        var metadataPath = basePath & 'metadata/';
        var metadata = { };
        var jsonFiles = directoryList( metadataPath, true, 'path', '*.json' );
        for ( var path in jsonFiles ) {
            var metaName = path
                .replace( '\', '/', 'all' )
                .replace( metadataPath, '' )
                .listFirst( '.' )
                .replace( '/', '.', 'all' );
            metadata[ metaName ] = deserializeJSON( fileRead( path ) );
        }
        return metadata;
    }

    private array function listResources( required string basePath ) {
        var resourcePath = basePath & 'lib/resources/';
        var paths = directoryList( resourcePath, true, 'path', '*.cfc' );
        return paths.map( function( path ) {
            return path.replace( '\', '/', 'all' ).replace( resourcePath, '' );
        } );
    }

    private void function validationFailure( required string message ) {
        throw( type = 'StripeValidationException', message = message );
    }

}
