component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.stripeSecretKey );

	}

	public void function testIntegerFieldValidation() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
	
		try {
			var result = stripe.createCharge( amount = 20.45,  card = card );
			fail( 'invalid amount "20.45" supposed to throw error' );
		} 
		catch( any e ) {
			debug( e );
			assertTrue( e.message != 'invalid amount "20.45" supposed to throw error', e.message );
		}

	}

	
	public void function testListChargesWithInvalidCreatedDate() {

		var failMessage = 'invalid date supposed to throw error';

		try {
			var result = stripe.listCharges( created = "badDateString" );
			fail( failMessage );
		} 
		catch( any e ) {
			debug( e );
			assertTrue( e.message != failMessage, e.message );
		}

	}

	public void function testCreateCoupon() {

		var failMessage = 'invalid date supposed to throw error';

		try {
			var result = stripe.listCharges( created = "badDateString" );
			fail( failMessage );
		} 
		catch( any e ) {
			debug( e );
			assertTrue( e.message != failMessage, e.message );
		}

	}

	
}