component extends=testbox.system.BaseSpec {

    function beforeAll() {
        stripe = new stripe( 'fake_key' );
        httpService = getProperty( stripe, 'httpService' );
        prepareMock( httpService );
        httpService.$(
            'exec',
            {
                responseHeader: {
                    'Request-Id': ''
                },
                statuscode: 200,
                filecontent: '{}'
            }
        );
    }

    function run() {
        describe( 'A Header for an API call', function() {
            afterEach( function() {
                httpService.$reset();
            } );

            it( 'can be passed as a named argument', function() {
                var res = stripe.charges.create(
                    customer = 'customer_id',
                    amount = 2000,
                    currency = 'usd',
                    stripeAccount = 'account_id'
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.headers ).toHaveLength( 3 );
                expect( httpRequest.headers[ 3 ].name ).toBeWithCase( 'Stripe-Account' );
                expect( httpRequest.headers[ 3 ].value ).toBeWithCase( 'account_id' );
            } );

            it( 'can be passed in a named argument struct', function() {
                var res = stripe.charges.create(
                    params = {
                        customer: 'customer_id',
                        amount: 2000,
                        currency: 'usd'
                    },
                    headers = {
                        stripeAccount: 'account_id'
                    }
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.headers ).toHaveLength( 3 );
                expect( httpRequest.headers[ 3 ].name ).toBeWithCase( 'Stripe-Account' );
                expect( httpRequest.headers[ 3 ].value ).toBeWithCase( 'account_id' );
            } );

            it( 'can be passed positionally in a struct', function() {
                var res = stripe.charges.create(
                    {
                        customer: 'customer_id',
                        amount: 2000,
                        currency: 'usd'
                    },
                    {
                        stripeAccount: 'account_id'
                    }
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.headers ).toHaveLength( 3 );
                expect( httpRequest.headers[ 3 ].name ).toBeWithCase( 'Stripe-Account' );
                expect( httpRequest.headers[ 3 ].value ).toBeWithCase( 'account_id' );
            } );

            it( 'overrides the corresponding config setting', function() {
                var res = stripe.accounts.retrieve( apiKey = 'fake_key_2' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.headers ).toHaveLength( 1 );
                expect( httpRequest.headers[ 1 ].name ).toBeWithCase( 'Authorization' );
                expect( httpRequest.headers[ 1 ].value ).toBeWithCase( 'Bearer fake_key_2' );
            } );
        } );
    }

}
