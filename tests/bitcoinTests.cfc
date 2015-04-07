component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( apiKey = request.apiKey );

	}

	public void function testCreateBitcoinReceiver() {

		var result = stripe.createBitcoinReceiver( amount = 2000, email = 'test_' & createUUID() & '@example.com' );

		debug( result );

		assertEquals( 200, result.status_code, "expected a successful request" );

	}

	public void function testgetBitcoinReceiver() {

		var receiver = stripe.createBitcoinReceiver( amount = 2000, email = 'test_' & createUUID() & '@example.com' );
		var result = stripe.getBitcoinReceiver( receiver.id );

		debug( receiver );
		debug( result );

		assertEquals( 200, result.status_code, "expected a successful request" );

	}

	public void function testListBitcoinReceivers() {

		var result = stripe.listBitcoinReceivers();

		debug( result );

		assertEquals( 200, result.status_code, "expected a successful request" );

	}

	public void function testCreateChargeWithBitcoin() {

		var receiver = stripe.createBitcoinReceiver( amount = 2000, email = 'test_' & createUUID() & '@example.com' );
		sleep( 3000 );
		var result = stripe.createCharge( amount = 2000, source = receiver.id );


		debug( receiver );
		debug( result );

		assertEquals( 200, result.status_code, "expected a successful request" );

	}

}