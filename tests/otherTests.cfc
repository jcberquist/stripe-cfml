component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.stripeSecretKey );

	}

	public void function testGetAccountDetails() {

		var result = stripe.getAccountDetails();

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testGetBalance() {

		var result = stripe.getBalance();

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testListBalanceHistory() {

		var result = stripe.listBalanceHistory();

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testListEvents() {

		var result = stripe.listEvents();

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testGetEvent() {

		var events = stripe.listEvents();
		var result = stripe.getEvent( events.data[ 1 ].id );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

}