component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( stripeSecretKey = request.stripeSecretKey );

	}

	public void function testCreateCardToken() {

		var card = { number = '6011000990139424', exp_month = '12', exp_year = '2014', cvc = '123', name = "John Doe" };
		var result = stripe.createCardToken( card );

		debug( result );

		assertEquals( 200, result.status_code, "expected a successful request" );
		assertEquals( "card", result.type, "wrong token created" );
		assertTrue( structKeyExists( result, 'id' ), "token key missing" );

	}

	public void function testCreateCardToken_missing_required_field() {

		var card = { number = '6011000990139424', exp_year = '2014', cvc = '123', name = "John Doe" };
		
		try {
			var result = stripe.createCardToken( card );
			fail( 'method createCardToken was supposed to throw an error' );
		}
		catch( any e ) {
			debug( e );
		}

	}

	public void function testCreateBankAccountToken() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var result = stripe.createBankAccountToken( bank_account );

		debug( result );

		assertEquals( 200, result.status_code, "expected a successful request" );
		assertEquals( "bank_account", result.type, "wrong token created" );
		assertTrue( structKeyExists( result, 'id' ), "token key missing" );

	}
	
	public void function testCreateBankAccountToken_missing_required_field() {

		var bank_account = { routing_number = "110000000", account_number = "000123456789" };
		
		try {
			var result = stripe.createBankAccountToken( bank_account );
			fail( 'method createBankAccountToken was supposed to throw an error' );
		}
		catch( any e ) {
			debug( e );
		}

	}

	public void function testGetToken_card() {

		var card = { number = '378282246310005', exp_month = '12', exp_year = '2014', cvc = '123', name = "John Doe" };
		var tokenCreate = stripe.createCardToken( card );
		var result = stripe.getToken( tokenCreate.id );

		debug( tokenCreate );
		debug( result );

		assertEquals( 200, result.status_code, "expected a successful request" );
		assertEquals( tokenCreate.id, result.id, "wrong token retrieved" );
		assertEquals( right( card.number, 4 ), result.card.last4, "wrong card number retrieved" );

	}


	
}