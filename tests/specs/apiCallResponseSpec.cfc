component extends=testbox.system.BaseSpec {

    function beforeAll() {
        stripe = new stripe( 'fake_key' );
        httpService = getProperty( stripe, 'httpService' );
        prepareMock( httpService );
        httpService.$(
            'exec',
            {
                responseHeader: {
                    'Content-Type': 'application/json',
                    'Request-Id': ''
                },
                statuscode: '200 OK',
                filecontent: '{}'
            }
        );
    }

    function run() {
        describe( 'An API response parse', function() {
            afterEach( function() {
                httpService.$reset();
            } );

            it( 'throws an error when the Request-Id header is missing on a 200 request', function() {
                httpService.$(
                    'exec',
                    {
                        responseHeader: {
                            'Content-Type': 'application/json'
                        },
                        statuscode: '200 OK',
                        filecontent: '{}'
                    }
                );

                expect( function() {
                    res = stripe.accounts.retrieve();
                } ).toThrow(
                    type = 'StripeResponseException',
                    regex = 'Request-Id is missing from the response headers'
                );
            } );

            it( 'does not throw an error when the Request-Id header is missing on a non 200 request', function() {
                httpService.$(
                    'exec',
                    {
                        responseHeader: {
                            'Content-Type': 'application/json'
                        },
                        statuscode: '401 Not Authorized',
                        filecontent: '{}'
                    }
                );

                expect( function() {
                    res = stripe.accounts.retrieve();
                } ).notToThrow(
                    type = 'StripeResponseException',
                    regex = 'Request-Id is missing from the response headers'
                );
            } );
        } );
    }

}
