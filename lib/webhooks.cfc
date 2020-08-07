component {

    variables.default_tolerance = 300;
    variables.expected_scheme = 'v1';

    public any function init( required any responseParser ) {
        variables.MessageDigest = createObject( 'java', 'java.security.MessageDigest' );
        variables.parserUtils = new parsers.parserUtils();
        variables.responseParser = arguments.responseParser;
        return this;
    }

    public struct function constructEvent(
        required string payload,
        required string header,
        required string secret,
        numeric tolerance = default_tolerance
    ) {
        verifyHeader( payload, header, secret, tolerance );
        var event = deserializeJSON( payload );
        responseParser.parse( event );
        return event;
    }

    private void function verifyHeader(
        required string payload,
        required string header,
        required string secret,
        required numeric tolerance
    ) {
        var details = parseHeader( header );

        if ( details.timestamp == -1 ) {
            verificationFailure( 'Unable to extract timestamp and signatures from header' );
        }

        if ( !arrayLen( details.signatures ) ) {
            verificationFailure( 'No signatures found with expected scheme' );
        }

        var expectedSignature = hmac(
            details.timestamp & '.' & payload,
            secret,
            'hmacSHA256',
            'utf-8'
        ).lcase();

        var validSignatures = arrayFilter( details.signatures, function( s ) {
            return MessageDigest.isEqual( s.getBytes(), expectedSignature.getBytes() );
        } );

        if ( !arrayLen( validSignatures ) ) {
            verificationFailure( 'No signatures found matching the expected signature for payload.' );
        }

        var timestampAge = parserUtils.getUTCTimestamp( now() ) - details.timestamp;

        if ( tolerance > 0 && timestampAge > tolerance ) {
            verificationFailure( 'Timestamp outside the tolerance zone' );
        }
    }

    private struct function parseHeader( required string header ) {
        return arrayReduce(
            listToArray( header ),
            function( parsed, item ) {
                var key = listFirst( item, '=' );
                var value = listRest( item, '=' );

                if ( key == 't' ) {
                    parsed.timestamp = value;
                }

                if ( key == variables.expected_scheme ) {
                    parsed.signatures.append( value );
                }

                return parsed;
            },
            {
                timestamp: -1,
                signatures: [ ]
            }
        );
    }

    private void function verificationFailure( required string message ) {
        throw( type = 'StripeSignatureVerificationException', message = message );
    }

}
