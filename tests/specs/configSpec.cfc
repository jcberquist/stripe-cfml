component extends=testbox.system.BaseSpec {

    function run() {
        describe( 'The config struct passed at initialization', function() {
            var config = {
                apiVersion: 'latest',
                defaultCurrency: 'usd'
            };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
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

            afterEach( function() {
                httpService.$reset();
            } );

            it( 'can specify an api version to use', function() {
                var res = stripe.accounts.retrieve( account_id = 'account_id' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.headers ).toHaveLength( 2 );
                expect( httpRequest.headers[ 2 ].name ).toBeWithCase( 'Stripe-Version' );
                expect( httpRequest.headers[ 2 ].value ).toBeWithCase( 'latest' );
            } );

            it( 'can supply a default iso currency code to requests that don''t supply it', function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 2000 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd&customer=customer_id' );
            } );

            it( 'doesn''t override iso currency codes passed in to requests', function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 2000, currency = 'gbp' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=gbp&customer=customer_id' );
            } );
        } );

        describe( 'The convertToCents setting', function() {
            var config = {
                defaultCurrency: 'usd',
                convertToCents: true
            };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
            prepareMock( httpService );
            httpService.$(
                'exec',
                {
                    responseHeader: {
                        'Content-Type': 'application/json',
                        'Request-Id': ''
                    },
                    statuscode: '200 OK',
                    filecontent: '{"object":"charge","amount":2005}'
                }
            );

            afterEach( function() {
                httpService.$reset();
            } );

            it( 'when true, currency amounts are multiplied by 100 before being passed to the Stripe API', function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 20.05 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2005&currency=usd&customer=customer_id' );
            } );

            it( 'when true, currency amounts are divided by 100 before being returned in the response', function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 20.05 );
                expect( res.content.amount ).toBe( 20.05 );
            } );
        } );
    }

}
