component extends=testbox.system.BaseSpec {

    function beforeAll() {
        stripe = new stripe( 'fake_key', { resources: [ 'accounts' ] } );
        httpService = getProperty( stripe, 'httpService' );
        prepareMock( httpService );
        httpService.$( 'exec', {
            responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
            statuscode: '200 OK',
            filecontent: '{}'
        } );
    }

    function run() {
        describe( 'An API response parse', function() {
            afterEach( function() {
                httpService.$reset();
            } );

            it( 'throws an error when the Request-Id header is missing on a 200 request', function() {
                httpService.$( 'exec', {
                    responseHeader: { 'Content-Type': 'application/json' },
                    statuscode: '200 OK',
                    filecontent: '{}'
                } );

                expect( function() {
                    res = stripe.accounts.retrieve();
                } ).toThrow(
                    type = 'StripeResponseException',
                    regex = 'Request-Id is missing from the response headers'
                );
            } );

            it( 'does not throw an error when the Request-Id header is missing on a non 200 request', function() {
                httpService.$( 'exec', {
                    responseHeader: { 'Content-Type': 'application/json' },
                    statuscode: '401 Not Authorized',
                    filecontent: '{}'
                } );

                expect( function() {
                    res = stripe.accounts.retrieve();
                } ).notToThrow(
                    type = 'StripeResponseException',
                    regex = 'Request-Id is missing from the response headers'
                );
            } );
        } );

        describe( 'An API response type conversion', function() {
            var typedStripe = new stripe( 'fake_key', { apiVersion: '2026-09-30.endive', resources: [ 'accounts' ] } );
            var typedHttpService = getProperty( typedStripe, 'httpService' );
            prepareMock( typedHttpService );
            var parserUtils = new lib.parsers.parserUtils();

            afterEach( function() {
                typedHttpService.$reset();
            } );

            it( 'converts `created` timestamps to dates', function() {
                typedHttpService.$( 'exec', {
                    responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                    statuscode: '200 OK',
                    filecontent: '{"object":"customer","created":1700000000}'
                } );
                var res = typedStripe.accounts.retrieve();
                expect( dateCompare( res.content.created, parserUtils.parseUTCTimestamp( 1700000000 ) ) ).toBe( 0 );
            } );

            it( 'converts `created` on objects whose schema does not mark it as unix-time', function() {
                typedHttpService.$( 'exec', {
                    responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                    statuscode: '200 OK',
                    filecontent: '{"object":"subscription_item","created":1700000000}'
                } );
                var res = typedStripe.accounts.retrieve();
                expect( dateCompare( res.content.created, parserUtils.parseUTCTimestamp( 1700000000 ) ) ).toBe( 0 );
            } );

            it( 'does not convert `created` on objects without metadata', function() {
                typedHttpService.$( 'exec', {
                    responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                    statuscode: '200 OK',
                    filecontent: '{"object":"v2.core.event","created":"2025-01-01T00:00:00.000Z"}'
                } );
                var res = typedStripe.accounts.retrieve();
                expect( res.content.created ).toBe( '2025-01-01T00:00:00.000Z' );
            } );
        } );
    }

}
