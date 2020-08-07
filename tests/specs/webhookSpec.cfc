component extends=testbox.system.BaseSpec {

    function beforeAll() {
        stripe = new stripe( 'fake_key' );
    }

    function run() {
        describe( 'Webhook signature verification', function() {
            it( 'throws a `StripeSignatureVerificationException` on failures', function() {
                expect( function() {
                    stripe.webhooks.constructEvent( '{}', 't=1,v1=a,v0=b', 'abc' );
                } ).toThrow( 'StripeSignatureVerificationException' );
            } );
        } );
    }

}
