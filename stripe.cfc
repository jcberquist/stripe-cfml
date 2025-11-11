component accessors="true" {

    property basePath;
    property config;
    property httpService;
    property parsers;
    property objectMetadata;
    property resources;

    public struct function init( string apiKey = '', struct config = { } ) {
        variables.basePath = getDirectoryFromPath( getCurrentTemplatePath() ).replace( '\', '/', 'all' );
        variables.config = new lib.config( apiKey, arguments.config );
        variables.httpService = new lib.httpService();
        variables.objectMetadata = new lib.objectMetadata( this );
        variables.parsers = {
            arguments: new lib.parsers.arguments( variables.config ),
            headers: new lib.parsers.headers( variables.config ),
            response: new lib.parsers.response( variables.config, variables.objectMetadata )
        };

        variables.resources = list( 'resources', variables.config.get( 'resources' ) );

        for ( var resource in variables.resources ) {
            var resourceParts = resource.listToArray( '.' );
            var parent = this;
            for ( var i = 1; i < resourceParts.len(); i++ ) {
                if ( !structKeyExists( parent, resourceParts[ i ] ) ) {
                    parent[ resourceParts[ i ] ] = { };
                }
                parent = parent[ resourceParts[ i ] ];
            }
            parent[ resourceParts[ i ] ] = new lib.apiResource(
                this,
                resource,
                loadJSONFile( variables.resources[ resource ] )
            );
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
        var path = 'https://' & methodMetadata.host & methodMetadata.path;
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

        if ( structKeyExists( response.headers, 'Content-Type' ) ) {
            if ( response.headers[ 'Content-Type' ] == 'application/json' ) {
                response.content = deserializeJSON( response.content );
                parsers.response.parse( response.content );
            }
        } else if ( int( response.status ) >= 200 && int( response.status ) < 300 ) {
            throw(
                type = 'StripeResponseException',
                message = 'Content-Type is missing from the response headers',
                extendedInfo = serializeJSON( response )
            );
        }

        return response;
    }

    public struct function list( required string dataType, array filter = [ ] ) {
        var majorVersion = variables.config.get( 'major_api_version' );
        var fullPath = '#variables.basePath##dataType#/#majorVersion#/';
        var result = { };
        var jsonFiles = directoryList( fullPath, true, 'path', '*.json' );
        for ( var path in jsonFiles ) {
            var dotName = path
                .replace( '\', '/', 'all' )
                .replace( fullPath, '' )
                .listFirst( '.' )
                .replace( '/', '.', 'all' );
            if ( !arrayLen( arguments.filter ) || arguments.filter.find( dotName ) ) {
                result[ dotName ] = path;
            }
        }
        return result;
    }

    public struct function loadJSONFile( required string fullPath ) {
        return deserializeJSON( fileRead( fullPath ) );
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

    private void function validationFailure( required string message ) {
        throw( type = 'StripeValidationException', message = message );
    }

}
