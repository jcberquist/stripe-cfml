component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( apiKey = request.apiKey, includeRaw = true );

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

	public void function testGetBalanceTransaction() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var chargeObject = stripe.createCharge( amount = 1999,  card = card );
		var balanceHistory = stripe.listBalanceHistory();
		var result = stripe.getBalanceTransaction( balanceHistory.data[ 1 ].id );

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

	public void function testAlternateApiKey() {

		var result = stripe.getAccountDetails( apiKey = 'foo' );

		debug( result );

		assertEquals( 401, result.status_code, "expected a 401 status" );

	}

}