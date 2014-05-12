component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.apiKey );

	}

	public void function testCreateRecipient() {

		var result = stripe.createRecipient( name = "John Doe", type = "individual", metadata = { foo = "bar" } );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "recipient", result.object, "recipient object was not returned" );
		assertEquals( { foo = "bar" }, result.metadata, "correct metadata was not returned" );

	}

	public void function testCreateRecipientWithBankAccount() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var result = stripe.createRecipient( name = "John Doe", type = "individual", bank_account = bank_account );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "recipient", result.object, "recipient object was not returned" );
		assertTrue( structKeyExists( result, "active_account" ), "created account missing" );
		assertEquals( right( bank_account.account_number, 4 ), result.active_account.last4, "wrong account number in response" );

	}

	public void function testCreateRecipientWithToken() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var bank_account_token = stripe.createBankAccountToken( bank_account );
		var result = stripe.createRecipient( name = "John Doe", type = "individual", bank_account = bank_account_token.id );

		debug( bank_account_token );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "recipient", result.object, "recipient object was not returned" );
		assertTrue( structKeyExists( result, "active_account" ), "created account missing" );
		assertEquals( right( bank_account.account_number, 4 ), result.active_account.last4, "wrong account number in response" );

	}

	public void function testGetRecipient() {

		var recipient = stripe.createRecipient( name = "John Doe", type = "individual" );
		var result = stripe.getRecipient( recipient.id );

		debug( recipient );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( recipient.id, result.id, "correct recipient object was not returned" );

	}

	public void function testUpdateRecipient() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var recipientObject = stripe.createRecipient( name = "John Doe", type = "individual", email = "testOne@example.com", bank_account = bank_account , metadata = { foo = "bar" } );
		var result = stripe.updateRecipient( id = recipientObject.id, email = "testTwo@example.com", metadata = { foo = "new" } );

		debug( recipientObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( recipientObject.id, result.id, "correct customer object was not returned" );
		assertEquals( "testOne@example.com", recipientObject.email, "correct original recipient object was not returned" );
		assertEquals( "testTwo@example.com", result.email, "correct new recipient object was not returned" );
		assertEquals( { foo = "new" }, result.metadata, "correct new metadata was not returned" );

	}

	public void function testDeleteRecipient() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var recipientObject = stripe.createRecipient( name = "John Doe", type = "individual", email = "testOne@example.com", bank_account = bank_account );
		var result = stripe.deleteRecipient( recipientObject.id );

		debug( recipientObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( recipientObject.id, result.id, "correct customer object was not returned" );
		assertTrue( result.deleted, "recipient not marked not as deleted" );

	}

	public void function testListRecipients() {

		var recipientOneObject = stripe.createRecipient( name = "John Doe", type = "individual" );
		var recipientTwoObject = stripe.createRecipient( name = "Jane Doe", type = "corporation" );
		var result = stripe.listRecipients( limit = 2, include = [ 'total_count' ] );

		debug( recipientOneObject );
		debug( recipientTwoObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.total_count >= 2, "total_count is missing or invalid" );
		assertTrue( arrayLen( result.data ) == 2, "recipients are not listed" );

	}

}