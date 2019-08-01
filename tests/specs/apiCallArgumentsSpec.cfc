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
        describe( 'An API call', function() {
            afterEach( function() {
                httpService.$reset();
            } );

            it( 'supports named arguments', function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 2000, currency = 'usd' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd&customer=customer_id' );
            } );

            it( 'supports named arguments used in the URL', function() {
                var res = stripe.charges.retrieve( charge_id = 'charge_id' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/charges/charge_id' );
            } );

            it( 'supports named arguments used in the URL and body', function() {
                var res = stripe.customers.updateSource(
                    customer_id = 'customer_id',
                    source_id = 'source_id',
                    metadata = {
                        'a': 1
                    }
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe(
                    'https://api.stripe.com/v1/customers/customer_id/sources/source_id'
                );
                expect( httpRequest.body ).toBe( 'metadata%5Ba%5D=1' );
            } );

            xit( 'supports param arguments used in the URL', function() {
                var res = stripe.usageRecords.create(
                    params = {
                        'subscription_item_id': 'subscription_item_id'
                    }
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                debug(httpRequest.attrColl.url);
                expect( httpRequest.attrColl.url ).toBe(
                    'https://api.stripe.com/v1/subscription_items/subscription_item_id/usage_records'
                );
            } );

            it( 'supports named "params" argument', function() {
                var res = stripe.charges.create(
                    params = {
                        customer: 'customer_id',
                        amount: 2000,
                        currency: 'usd'
                    }
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd&customer=customer_id' );
            } );

            it( 'supports positional arguments', function() {
                var res = stripe.charges.create( {
                    customer: 'customer_id',
                    amount: 2000,
                    currency: 'usd'
                } );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd&customer=customer_id' );
            } );

            it( 'supports positional arguments used in the URL', function() {
                var res = stripe.charges.retrieve( 'charge_id' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/charges/charge_id' );
            } );

            it( 'supports positional arguments used in the URL and body', function() {
                var res = stripe.customers.updateSource(
                    'customer_id',
                    'source_id',
                    {
                        metadata: {
                            'a': 1
                        }
                    }
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe(
                    'https://api.stripe.com/v1/customers/customer_id/sources/source_id'
                );
                expect( httpRequest.body ).toBe( 'metadata%5Ba%5D=1' );
            } );
        } );
    }

}
