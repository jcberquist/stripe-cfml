component extends=testbox.system.BaseSpec {

    function run() {
        describe( 'The config struct passed at initialization', function() {
            var config = { apiVersion: 'latest', resources: [ 'accounts' ] };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
            prepareMock( httpService );
            httpService.$( 'exec', {
                responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                statuscode: '200 OK',
                filecontent: '{}'
            } );

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

            it( 'sets the major api version from the passed in stripe api version', function() {
                var _config = { apiVersion: '2024-06-20', resources: [ 'accounts' ] };
                var _stripe = new stripe( 'fake_key', _config );
                var majorApiVersion = _stripe.getConfig().get( 'major_api_version' );
                expect( majorApiVersion ).toBe( 'legacy' );
                var _config = { apiVersion: '2025-08-27.basil', resources: [ 'accounts' ] };
                var _stripe = new stripe( 'fake_key', _config );
                var majorApiVersion = _stripe.getConfig().get( 'major_api_version' );
                expect( majorApiVersion ).toBe( 'basil' );
            } );
        } );

        describe( 'The defaultCurrency setting', function() {
            var config = {
                defaultCurrency: 'usd',
                resources: [ 'charges', 'paymentIntents', 'refunds', 'invoiceItems', 'checkout.sessions' ]
            };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
            prepareMock( httpService );
            httpService.$( 'exec', {
                responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                statuscode: '200 OK',
                filecontent: '{}'
            } );

            afterEach( function() {
                httpService.$reset();
            } );

            it(
                "supplies a default iso currency code to requests that don't supply it when a code is required",
                function() {
                    var res = stripe.charges.create( customer = 'customer_id', amount = 2000 );
                    var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                    expect( httpRequest.body ).toBe( 'amount=2000&currency=usd&customer=customer_id' );
                }
            );

            it( "doesn't override iso currency codes passed in to requests", function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 2000, currency = 'gbp' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=gbp&customer=customer_id' );
            } );

            it( 'does not supply a default currency to methods where currency is optional', function() {
                var res = stripe.paymentIntents.update( payment_intent_id = 'pi_123', amount = 2000 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000' );
            } );

            it( 'passes explicit currency values to methods where currency is optional', function() {
                var res = stripe.paymentIntents.update( payment_intent_id = 'pi_123', amount = 2000, currency = 'gbp' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=gbp' );
            } );

            it( 'does not supply a default currency to refunds.create', function() {
                var res = stripe.refunds.create( charge = 'ch_x' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'charge=ch_x' );
            } );

            it(
                'fills nested currency keys that Stripe requires, even where the top-level currency is optional',
                function() {
                    var res = stripe.invoiceItems.create( customer = 'customer_id', price_data = {
                        product: 'prod_x',
                        unit_amount: 100
                    } );
                    var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                    expect( httpRequest.body ).toBe(
                        'customer=customer_id&price_data%5Bcurrency%5D=usd&price_data%5Bproduct%5D=prod_x&price_data%5Bunit_amount%5D=100'
                    );
                }
            );

            it( 'does not fill nested currency keys that are optional', function() {
                var res = stripe.checkout.sessions.create( mode = 'payment', payment_method_options = {
                    acss_debit: { verification_method: 'automatic' }
                } );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe(
                    'mode=payment&payment_method_options%5Bacss_debit%5D%5Bverification_method%5D=automatic'
                );
            } );
        } );

        describe( 'The defaultCurrency setting when it is not configured', function() {
            var config = { resources: [ 'charges', 'invoiceItems' ] };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
            prepareMock( httpService );
            httpService.$( 'exec', {
                responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                statuscode: '200 OK',
                filecontent: '{}'
            } );

            afterEach( function() {
                httpService.$reset();
            } );

            it( 'does not send an empty currency to methods that require one', function() {
                var res = stripe.charges.create( customer = 'customer_id', amount = 2000 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&customer=customer_id' );
            } );

            it( 'does not send empty nested currency keys', function() {
                var res = stripe.invoiceItems.create( customer = 'customer_id', price_data = {
                    product: 'prod_x',
                    unit_amount: 100
                } );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe(
                    'customer=customer_id&price_data%5Bproduct%5D=prod_x&price_data%5Bunit_amount%5D=100'
                );
            } );
        } );

        describe( 'The injectOptionalCurrency setting', function() {
            var config = {
                defaultCurrency: 'usd',
                injectOptionalCurrency: true,
                resources: [ 'paymentIntents', 'coupons', 'refunds', 'checkout.sessions', 'setupIntents' ]
            };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
            prepareMock( httpService );
            httpService.$( 'exec', {
                responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                statuscode: '200 OK',
                filecontent: '{}'
            } );

            afterEach( function() {
                httpService.$reset();
            } );

            it( 'supplies a default currency to every method where currency is optional', function() {
                var res = stripe.paymentIntents.update( payment_intent_id = 'pi_123', amount = 2000 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd' );

                httpService.$reset();
                var res = stripe.coupons.create( amount_off = 500 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount_off=500&currency=usd' );
            } );

            it( 'supplies a default currency to methods called with positional arguments', function() {
                var res = stripe.paymentIntents.update( 'pi_123', { description: 'd' } );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/payment_intents/pi_123' );
                expect( httpRequest.body ).toBe( 'currency=usd&description=d' );
            } );

            it( 'still supplies a default currency to methods that require one', function() {
                var res = stripe.paymentIntents.create( amount = 2000 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd' );
            } );

            it( "doesn't override iso currency codes passed in", function() {
                var res = stripe.paymentIntents.update( payment_intent_id = 'pi_123', amount = 2000, currency = 'gbp' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=gbp' );
            } );

            it( 'fills optional nested currency keys', function() {
                var res = stripe.checkout.sessions.create( mode = 'payment', payment_method_options = {
                    acss_debit: { verification_method: 'automatic' }
                } );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe(
                    'currency=usd&mode=payment&payment_method_options%5Bacss_debit%5D%5Bcurrency%5D=usd&payment_method_options%5Bacss_debit%5D%5Bverification_method%5D=automatic'
                );
            } );

            it( 'fills nested currency keys of methods that have no top-level currency', function() {
                var res = stripe.setupIntents.create( payment_method_options = {
                    klarna: { preferred_locale: 'en-US' }
                } );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe(
                    'payment_method_options%5Bklarna%5D%5Bcurrency%5D=usd&payment_method_options%5Bklarna%5D%5Bpreferred_locale%5D=en-US'
                );
            } );

            it( 'does not supply a default currency to refunds.create, as before 4.3.0', function() {
                var res = stripe.refunds.create( charge = 'ch_x' );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'charge=ch_x' );
            } );

            it( 'can be turned off for a single request', function() {
                var res = stripe.paymentIntents.update(
                    payment_intent_id = 'pi_123',
                    amount = 2000,
                    injectOptionalCurrency = false
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000' );
            } );

            it( 'can be read from the stripe.injectoptionalcurrency system property', function() {
                var system = createObject( 'java', 'java.lang.System' );
                try {
                    system.setProperty( 'stripe.injectoptionalcurrency', 'true' );
                    var _stripe = new stripe( 'fake_key', { resources: [ ] } );
                    expect( _stripe.getConfig().get( 'inject_optional_currency' ) ).toBeTrue();
                } finally {
                    system.clearProperty( 'stripe.injectoptionalcurrency' );
                }
                var _stripe = new stripe( 'fake_key', { resources: [ ] } );
                expect( _stripe.getConfig().get( 'inject_optional_currency' ) ).toBeFalse();
            } );
        } );

        describe( 'The injectOptionalCurrency request option', function() {
            var config = { defaultCurrency: 'usd', resources: [ 'paymentIntents', 'refunds', 'setupIntents' ] };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
            prepareMock( httpService );
            httpService.$( 'exec', {
                responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                statuscode: '200 OK',
                filecontent: '{}'
            } );

            afterEach( function() {
                httpService.$reset();
            } );

            it( 'supplies a default currency to an optional currency parameter for that request only', function() {
                var res = stripe.paymentIntents.update(
                    payment_intent_id = 'pi_123',
                    amount = 2000,
                    injectOptionalCurrency = true
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd' );

                httpService.$reset();
                var res = stripe.paymentIntents.update( payment_intent_id = 'pi_123', amount = 2000 );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000' );
            } );

            it( 'can be given in snake case', function() {
                var res = stripe.paymentIntents.update(
                    payment_intent_id = 'pi_123',
                    amount = 2000,
                    inject_optional_currency = true
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000&currency=usd' );
            } );

            it( 'can be passed positionally in a struct after the params struct', function() {
                var res = stripe.paymentIntents.update(
                    'pi_123',
                    { description: 'd' },
                    { injectOptionalCurrency: true }
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.attrColl.url ).toBe( 'https://api.stripe.com/v1/payment_intents/pi_123' );
                expect( httpRequest.body ).toBe( 'currency=usd&description=d' );
            } );

            it( 'can be passed positionally without passing a params struct', function() {
                var res = stripe.paymentIntents.update( 'pi_123', { injectOptionalCurrency: true } );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'currency=usd' );
            } );

            it( 'is not sent to Stripe as a parameter or a header', function() {
                var res = stripe.paymentIntents.update(
                    payment_intent_id = 'pi_123',
                    amount = 2000,
                    injectOptionalCurrency = true
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).notToInclude( 'inject' );
                for ( var header in httpRequest.headers ) {
                    expect( header.name ).notToInclude( 'inject' );
                    expect( header.value ).notToBe( 'true' );
                }
            } );

            it( 'fills optional nested currency keys', function() {
                var res = stripe.setupIntents.create(
                    payment_method_options = { klarna: { preferred_locale: 'en-US' } },
                    injectOptionalCurrency = true
                );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe(
                    'payment_method_options%5Bklarna%5D%5Bcurrency%5D=usd&payment_method_options%5Bklarna%5D%5Bpreferred_locale%5D=en-US'
                );
            } );

            it( 'applies to refunds.create when asked', function() {
                var res = stripe.refunds.create( charge = 'ch_x', injectOptionalCurrency = true );
                var httpRequest = httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'charge=ch_x&currency=usd' );
            } );

            it( 'does nothing when defaultCurrency is not configured', function() {
                var _stripe = new stripe( 'fake_key', { resources: [ 'paymentIntents' ] } );
                var _httpService = getProperty( _stripe, 'httpService' );
                prepareMock( _httpService );
                _httpService.$( 'exec', {
                    responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                    statuscode: '200 OK',
                    filecontent: '{}'
                } );
                var res = _stripe.paymentIntents.update(
                    payment_intent_id = 'pi_123',
                    amount = 2000,
                    injectOptionalCurrency = true
                );
                var httpRequest = _httpService.$callLog().exec[ 1 ][ 1 ];
                expect( httpRequest.body ).toBe( 'amount=2000' );
            } );
        } );

        describe( 'The convertToCents setting', function() {
            var config = { defaultCurrency: 'usd', convertToCents: true, resources: [ 'charges' ] };
            var stripe = new stripe( 'fake_key', config );
            var httpService = getProperty( stripe, 'httpService' );
            prepareMock( httpService );
            httpService.$( 'exec', {
                responseHeader: { 'Content-Type': 'application/json', 'Request-Id': '' },
                statuscode: '200 OK',
                filecontent: '{"object":"charge","amount":2005}'
            } );

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
