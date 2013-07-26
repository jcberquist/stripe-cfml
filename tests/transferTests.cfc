component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( stripeSecretKey = request.stripeSecretKey, raw = true );

	}

	public void function testCreateTransfer() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var recipientObject = stripe.createRecipient( name = "John Doe", type = "individual", bank_account = bank_account );
		var result = stripe.createTransfer( amount = 500, recipient = recipientObject.id );

		debug( recipientObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "transfer", result.object, "recipient object was not returned" );

	}

	public void function testGetTransfer() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var recipientObject = stripe.createRecipient( name = "John Doe", type = "individual", bank_account = bank_account );
		var transferObject = stripe.createTransfer( amount = 500, recipient = recipientObject.id );
		var result = stripe.getTransfer( transferObject.id );

		debug( recipientObject );
		debug( transferObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( transferObject.id, result.id, "correct transfer object was not returned" );

	}

	public void function testCancelTransfer() {

		var expected_error = 'Transfer cannot be canceled, because it has already been submitted. You can currently only cancel pending transfers.';
		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var recipientObject = stripe.createRecipient( name = "John Doe", type = "individual", bank_account = bank_account );
		var transferObject = stripe.createTransfer( amount = 500, recipient = recipientObject.id );
		var result = stripe.cancelTransfer( transferObject.id );

		debug( recipientObject );
		debug( transferObject );
		debug( result );

		assertEquals( 400, result.status_code, "expected a 400 status" );
		assertEquals( expected_error, result.error.message, "expected error was not returned" );

	}

	public void function testListTransfers() {

		var bank_account = { country = "US", routing_number = "110000000", account_number = "000123456789" };
		var recipientObject = stripe.createRecipient( name = "John Doe", type = "individual", bank_account = bank_account );
		var transferObject = stripe.createTransfer( amount = 500, recipient = recipientObject.id );
		var result = stripe.listTransfers( 2 );

		debug( recipientObject );
		debug( transferObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.count >= 2, "transfers are not listed" );
		assertTrue( arrayLen( result.data ) == 2, "transfers are not listed" );

	}

}