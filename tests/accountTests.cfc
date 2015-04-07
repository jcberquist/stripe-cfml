component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( apiKey = request.apiKey, includeRaw = true );

	}

	public void function testCreateAccount() {

		var result = stripe.createAccount( email = 'test-#createUUID()#@example.com' );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testGetAccountDetails() {

		var result = stripe.getAccountDetails();
		var account = stripe.createAccount( email = 'test-#createUUID()#@example.com' );
		var resultTwo = stripe.getAccount( account.id );

		debug( result );
		debug( account );
		debug( resultTwo );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( 200, account.status_code, "expected a 200 status" );
		assertEquals( 200, resultTwo.status_code, "expected a 200 status" );

	}

	public void function testListAccounts() {

		var result = stripe.listAccounts();

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

}