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
        describe( 'An API call', function() {
            afterEach( function() {
                httpService.$reset();
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

            it( 'supports named arguments', function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 2000, currency = 'usd' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd&customer=customer_id' );
            } );

            it( 'supports positional arguments used in the URL', function() {
                var res = stripe.charges.retrieve( 'charge_id' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/charges/charge_id' );
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

            it( 'throws an error on a missing positional argument used in the URL', function() {
                var exceptionRegex = '`customers.updateSource\(\)` missing positional argument `source_id` at index \[2\]';
                expect( function() {
                    stripe.customers.updateSource( 'customer_id' );
                } ).toThrow( 'StripeValidationException', exceptionRegex );
            } );

            it( 'throws an error when a positional argument used in the URL is not a simple value', function() {
                var exceptionRegex = '`customers.updateSource\(\)` positional argument `source_id` at index \[2\] is not a simple value';
                expect( function() {
                    stripe.customers.updateSource( 'customer_id', { } );
                } ).toThrow( 'StripeValidationException', exceptionRegex );
            } );

            it( 'throws an error on a missing named argument used in the URL', function() {
                var exceptionRegex = '`customers.updateSource\(\)` missing required argument `source_id`';
                expect( function() {
                    stripe.customers.updateSource( customer_id = 'customer_id' );
                } ).toThrow( 'StripeValidationException', exceptionRegex );
            } );

            it( 'throws an error when a named argument used in the URL is not a simple value', function() {
                var exceptionRegex = '`customers.updateSource\(\)` argument `source_id` is not a simple value';
                expect( function() {
                    stripe.customers.updateSource( customer_id = 'customer_id', source_id = { } );
                } ).toThrow( 'StripeValidationException', exceptionRegex );
            } );
        } );

        describe( 'The stripe.accounts.retrieve() method', function() {
            afterEach( function() {
                httpService.$reset();
            } );

            it( 'supports being called with no arguments', function() {
                var res = stripe.accounts.retrieve();
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/account' );
            } );

            it( 'supports being called with a positional account_id', function() {
                var res = stripe.accounts.retrieve( 'account_id' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/accounts/account_id' );
            } );

            it( 'supports being called with a named account_id', function() {
                var res = stripe.accounts.retrieve( account_id = 'account_id' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/accounts/account_id' );
            } );
        } );
    }

}
