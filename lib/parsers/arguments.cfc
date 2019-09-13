component {

    variables.argumentTypes = {
        currencyfilter: {
            _complex: {
                'gt': 'currency',
                'gte': 'currency',
                'lt': 'currency',
                'lte': 'currency'
            },
            _simple: 'currency'
        },
        datefilter: {
            _complex: {
                'gt': 'timestamp',
                'gte': 'timestamp',
                'lt': 'timestamp',
                'lte': 'timestamp'
            },
            _simple: 'timestamp'
        }
    };

    public any function init( required any config ) {
        variables.config = config;
        variables.parserUtils = new parserUtils();
        return this;
    }

    public array function parse(
        required struct argCollection,
        required struct methodArgumentMetdata,
        required array ignoredArgs
    ) {
        var filteredArgs = { };
        var argKeys = structKeyArray( argCollection );
        for ( var argKey in argKeys ) {
            // don't include ignored args (path args and headers)
            if ( ignoredArgs.findNoCase( argKey ) ) {
                continue;
            }
            // don't include null arguments
            if ( isNull( argCollection[ argKey ] ) ) {
                continue;
            }
            filteredArgs[ argKey ] = argCollection[ argKey ];
        }
        var parsed = parseStruct( filteredArgs, methodArgumentMetdata );
        return flatten( parsed );
    }

    private struct function parseStruct( required any args, required struct methodArgumentMetdata ) {
        var parsed = { };

        for ( var key in structKeyArray( args ) ) {
            if ( isNull( args[ key ] ) ) continue;

            var val = args[ key ];
            var argType = parseType( key, methodArgumentMetdata );

            if ( isSimpleValue( val ) ) {
                parsed[ key ] = parseSimpleValue( val, argType._simple );
            } else if ( isBinary( val ) ) {
                parsed[ key ] = val;
            } else if ( isArray( val ) ) {
                parsed[ key ] = [ ];
                for ( var item in val ) {
                    if ( isSimpleValue( item ) ) {
                        parsed[ key ].append( parseSimpleValue( item, argType._simple ) );
                    } else {
                        parsed[ key ].append( parseStruct( item, argType._complex ) );
                    }
                }
            } else if ( isStruct( val ) ) {
                parsed[ key ] = parseStruct( val, argType._complex );
            }
        }

        for ( var key in methodArgumentMetdata ) {
            if (
                isSimpleValue( methodArgumentMetdata[ key ] ) &&
                methodArgumentMetdata[ key ] == 'iso_currency_code' &&
                !parsed.keyExists( key )
            ) {
                parsed[ key ] = config.get( 'default_currency' );
            }
        }

        return parsed;
    }

    private function parseType( key, methodArgumentMetdata ) {
        var base_type = {
            _simple: 'string',
            _complex: { }
        };
        if ( methodArgumentMetdata.keyExists( key ) ) {
            var type = methodArgumentMetdata[ key ];
            if ( isStruct( type ) ) {
                if ( type.keyExists( '_simple' ) || type.keyExists( '_complex' ) ) {
                    base_type.append( type );
                } else {
                    base_type._complex = type;
                }
            } else if ( argumentTypes.keyExists( type ) ) {
                base_type = argumentTypes[ type ];
            } else {
                base_type._simple = type;
            }
        }
        return base_type;
    }

    private function parseSimpleValue( value, type ) {
        switch ( type ) {
            case 'currency':
                var amount = value;
                if ( config.get( 'convert_to_cents' ) ) {
                    amount = round( value * 100 );
                }
                return parseInteger( amount );
            case 'timestamp':
                return parseUTCTimestampField( value );
            case 'integer':
                return parseInteger( value );
        }
        return trim( value );
    }

    private array function flatten( src, base_key ) {
        var flattened = [ ];
        for ( var k in src ) {
            var outKey = !isNull( base_key ) ? '#base_key#[#k#]' : k;
            if ( isNull( base_key ) || base_key != 'metadata' ) {
                outKey = lCase( outKey );
            }

            if ( isSimpleValue( src[ k ] ) ) {
                flattened.append( {
                    name: outKey,
                    value: src[ k ]
                } );
            } else if ( isBinary( src[ k ] ) ) {
                flattened.append( {
                    name: outKey,
                    value: src[ k ]
                } );
            } else if ( isStruct( src[ k ] ) ) {
                if ( !structIsEmpty( src[ k ] ) ) {
                    var nested = flatten( src[ k ], outKey );
                    flattened.append( nested, true );
                }
            } else if ( isArray( src[ k ] ) ) {
                var arrIndex = 0;
                for ( var item in src[ k ] ) {
                    var arr_key = outKey & '[#arrIndex#]';
                    if ( isStruct( item ) ) {
                        flattened.append( flatten( item, arr_key ), true );
                    } else {
                        flattened.append( {
                            name: arr_key,
                            value: item
                        } );
                    }
                    arrIndex++;
                }
            }
        }
        return flattened;
    }

    private any function parseUTCTimestampField( required any utcField ) {
        if ( parserUtils.isInteger( utcField ) ) return utcField;
        if ( isDate( utcField ) ) return parserUtils.getUTCTimestamp( utcField );
        if ( utcField == 'now' ) return 'now';
        throw( 'utc timestamp field is in an invalid format' );
    }

    private function parseInteger( v ) {
        if ( !parserUtils.isInteger( v ) ) {
            throw( '`#v#` must be an integer.' );
        }
        return int( v );
    }

}
