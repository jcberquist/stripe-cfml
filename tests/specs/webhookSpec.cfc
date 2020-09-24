component extends=testbox.system.BaseSpec {

    function beforeAll() {
        stripe = new stripe(
            'fake_key',
            {
                convertToCents: true
            }
        );
    }

    function run() {
        describe( 'Webhook signature verification', function() {
            it( 'throws a `StripeSignatureVerificationException` on failures', function() {
                expect( function() {
                    stripe.webhooks.constructEvent( '{}', 't=1,v1=a,v0=b', 'abc' );
                } ).toThrow( 'StripeSignatureVerificationException' );
            } );
        } );

        describe( 'Webhook events', function() {
            it( 'are parsed by the response parser', function() {
                var secret = 'abc';
                var event = fileRead( expandPath( '/tests/data/webhook_event.json' ) );
                var t = int( now().getTime() / 1000 );
                var signature = hmac(
                    t & '.' & event,
                    secret,
                    'hmacSHA256',
                    'utf-8'
                ).lcase();
                var header = 't=#t#,v1=#signature#,v0=b';


                var event = stripe.webhooks.constructEvent( event, header, secret );
                expect( event.data.object.created ).toBeTypeOf( 'date' );
                expect( event.data.object.amount ).toBe( 221.50 );
            } );
        } );
    }

}
