component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    property name="endpointSecret" inject="coldbox:setting:endpointSecret@stripecfml";
    property name="interceptorService" inject="coldbox:interceptorService";

    function beforeAll() {
        super.beforeAll();
        variables.interceptorService.registerInterceptor( interceptorObject = this );
    }

    function run() {
        describe( 'coldbox webhooks to interceptors', function() {
            beforeEach( function() {
                variables.stripeChargeSucceededCalled = { };
            } );

            it( 'returns a 400 for a bad signature', function() {
                var stripeEvent = fileRead( expandPath( '/tests/data/webhook_event.json' ) );
                var header = 't=1,v1=a,v0=b';
                prepareMock( getRequestContext() )
                    .$( 'getHTTPHeader' )
                    .$args( 'Stripe-Signature', '' )
                    .$results( header );
                prepareMock( getRequestContext() )
                    .$( 'getHTTPContent' )
                    .$args()
                    .$results( stripeEvent );
                prepareMock( getRequestContext() )
                    .$( 'getHTTPContent' )
                    .$args( json = true )
                    .$results( deserializeJSON( stripeEvent ) );

                var event = post( '/stripecfml/webhooks' );

                var res = event.getRenderData();
                expect( res.statusCode ).toBe( 400 );
                expect( res.data ).toBe( 'Invalid Webhook Signature' );
                expect( variables.stripeChargeSucceededCalled ).toBeEmpty();
            } );

            it( 'translates an event into an interceptor call', function() {
                var stripeEvent = fileRead( expandPath( '/tests/data/webhook_event.json' ) );
                var t = int( now().getTime() / 1000 );
                var signature = hmac(
                    t & '.' & stripeEvent,
                    variables.endpointSecret,
                    'hmacSHA256',
                    'utf-8'
                ).lcase();
                var header = 't=#t#,v1=#signature#,v0=b';

                prepareMock( getRequestContext() )
                    .$( 'getHTTPHeader' )
                    .$args( 'Stripe-Signature', '' )
                    .$results( header );
                prepareMock( getRequestContext() )
                    .$( 'getHTTPContent' )
                    .$args()
                    .$results( stripeEvent );
                prepareMock( getRequestContext() )
                    .$( 'getHTTPContent' )
                    .$args( json = true )
                    .$results( deserializeJSON( stripeEvent ) );

                var event = post( '/stripecfml/webhooks' );

                var res = event.getRenderData();
                expect( res.statusCode ).toBe( 200 );
                expect( res.data ).toBe( {
                    'received': true
                } );
                expect( variables.stripeChargeSucceededCalled ).notToBeEmpty();
            } );
        } );
    }

    function onStripeChargeSucceeded(
        event,
        interceptData,
        buffer,
        rc,
        prc
    ) {
        variables.stripeChargeSucceededCalled = arguments.interceptData;
    }

}
