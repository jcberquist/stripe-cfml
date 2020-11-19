component {

    public any function init() {
        variables.serverVersion = server.keyExists( 'lucee' ) ? 'Lucee' : 'ColdFusion';
        return this;
    }

    public any function makeRequest(
        required string httpMethod,
        required string path,
        struct headers = { },
        array params = [ ],
        boolean multipart = false,
        numeric timeout = 50
    ) {
        var httpRequest = {
            attrColl: {
                method: httpMethod,
                url: path,
                timeout: timeout
            }
        };

        if ( serverVersion == 'lucee' ) {
            httpRequest.attrColl[ 'encodeurl' ] = false;
        }

        if ( arrayFindNoCase( [ 'POST', 'PUT' ], httpMethod ) ) {
            if ( multipart ) {
                var multipartEntity = multipartFormData( params );
                headers[ 'Content-Type' ] = multipartEntity.contentType;
                httpRequest.body = multipartEntity.body;
            } else {
                headers[ 'Content-Type' ] = 'application/x-www-form-urlencoded';
                httpRequest.body = parseQueryParams( params );
            }
        } else if ( !params.isEmpty() ) {
            httpRequest.attrColl.url &= '?' & parseQueryParams( params );
        }

        httpRequest.headers = parseHeaders( headers );

        // writeDump( arguments );
        // writeDump( httpRequest );

        return exec( httpRequest );
    }

    private struct function exec( required struct httpRequest ) {
        var result = '';
        httpRequest.attrColl.result = 'result';
        cfhttp( attributeCollection = httpRequest.attrColl ) {
            for ( var header in httpRequest.headers ) {
                cfhttpparam( type = "header", name = header.name, value = header.value );
            }
            if ( arrayFindNoCase( [ 'POST', 'PUT' ], httpRequest.attrColl.method ) ) {
                cfhttpparam( type = "body", value = httpRequest.body );
            }
        }
        return result;
    }

    private array function parseHeaders( required struct headers ) {
        var sortedKeyArray = headers.keyArray();
        sortedKeyArray.sort( 'textnocase' );
        var processedHeaders = sortedKeyArray.map( function( key ) {
            return {
                name: key,
                value: trim( headers[ key ] )
            };
        } );
        return processedHeaders;
    }

    private string function parseQueryParams( required array params ) {
        params.sort( function( a, b ) {
            return a.name > b.name ? 1 : a.name < b.name ? -1 : 0;
        } );
        var queryStringElements = arrayMap( params, function( param ) {
            return encodeUrl( param.name ) & '=' & encodeUrl( param.value );
        } );
        return queryStringElements.toList( '&' );
    }

    private struct function multipartFormData( required array params ) {
        var entityBuilder = createObject( 'java', 'org.apache.http.entity.mime.MultipartEntityBuilder' ).create();
        var binaryFields = [ ];
        for ( var param in params ) {
            if ( isBinary( param.value ) ) {
                var prefix = param.name.replace( '[data]', '' );
                var contentTypeKey = prefix & '[type]';
                var filenameKey = prefix & '[name]';

                var filenameIndex = params.find( function( p ) {
                    return p.name == filenameKey;
                } );
                var filename = params[ filenameIndex ].value;

                var contentTypeIndex = params.find( function( p ) {
                    return p.name == contentTypeKey;
                } );
                var contentTypeValue = contentTypeIndex ? params[ contentTypeIndex ].value : 'application/octet-stream';
                var contentType = createObject( 'java', 'org.apache.http.entity.ContentType' ).create(
                    contentTypeValue
                );

                entityBuilder.addBinaryBody(
                    javacast( 'string', prefix ),
                    param.value,
                    contentType,
                    javacast( 'string', filename )
                );
                binaryFields.append( [ param.name, contentTypeKey, filenameKey ], true );
            }
        }
        for ( var param in params ) {
            if ( !binaryFields.find( param.name ) ) {
                entityBuilder.addTextBody( javacast( 'string', param.name ), javacast( 'string', param.value ) );
            }
        }
        var entity = entityBuilder.build();
        var outputStream = createObject( 'java', 'java.io.ByteArrayOutputStream' ).init( entity.getContentLength() );
        entity.writeTo( outputStream );
        return {
            contentType: entity.getContentType().getValue(),
            body: outputStream.toByteArray()
        };
    }

    private string function encodeUrl( required string str ) {
        return replaceList( urlEncodedFormat( arguments.str, 'utf-8' ), '%2D,%2E,%5F,%7E', '-,.,_,~' );
    }

}

