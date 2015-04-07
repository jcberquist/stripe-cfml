component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {

		variables.stripe = new stripe.stripe( apiKey = request.apiKey, raw = true );
		variables.source = { object = 'card', number = '4000000000000077', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		variables.charge = stripe.createCharge( amount = 5000, source = source );
		variables.account = stripe.createAccount( email = 'test-#createUUID()#@example.com' );

	}

	public void function testCreateTransfer() {

		var result = stripe.createTransfer( amount = 500, destination = account.id, metadata = { test = "value" } );

		debug( charge );
		debug( account );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "transfer", result.object, "recipient object was not returned" );
		assertEquals( { test = "value" }, result.metadata, "correct metadata was not returned" );

	}

	public void function testGetTransfer() {

		var transferObject = stripe.createTransfer( amount = 500, destination = account.id, metadata = { test = "value" } );
		var result = stripe.getTransfer( transferObject.id );

		debug( charge );
		debug( account );
		debug( transferObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( transferObject.id, result.id, "correct transfer object was not returned" );

	}

	public void function testUpdateTransfer() {

		var transferObject = stripe.createTransfer( amount = 500, destination = account.id, metadata = { test = "value" } );
		var result = stripe.updateTransfer( id = transferObject.id, metadata = { test = "new value" } );

		debug( transferObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( transferObject.id, result.id, "correct transfer object was not returned" );
		assertEquals( { test = "new value" }, result.metadata, "correct metadata was not returned" );

	}

	public void function testListTransfers() {

		var transferObject = stripe.createTransfer( amount = 500, destination = account.id );
		var result = stripe.listTransfers( limit = 2, include = [ 'total_count' ] );

		debug( transferObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.total_count >= 2, "transfers are not listed" );
		assertTrue( arrayLen( result.data ) == 2, "transfers are not listed" );

	}

	public void function testCreateTransferReversal() {

		var transferObject = stripe.createTransfer( amount = 1000, destination = account.id );
		var result = stripe.createTransferReversal( transfer_id = transferObject.id, amount = 500, description = 'test' );

		debug( transferObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testGetTransferReversal() {

		var transferObject = stripe.createTransfer( amount = 1000, destination = account.id );
		var transferReversal = stripe.createTransferReversal( transfer_id = transferObject.id, amount = 500, description = 'test' );
		var result = stripe.getTransferReversal( transfer_id = transferObject.id, id = transferReversal.id );

		debug( transferObject );
		debug( transferReversal );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testUpdateTransferReversal() {

		var transferObject = stripe.createTransfer( amount = 500, destination = account.id, metadata = { test = "value" } );
		var transferReversal = stripe.createTransferReversal( transfer_id = transferObject.id, amount = 500, description = 'test' );
		var result = stripe.updateTransferReversal( transfer_id = transferObject.id, id = transferReversal.id, metadata = { test = "new value" } );

		debug( transferObject );
		debug( transferReversal );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( { test = "new value" }, result.metadata, "correct metadata was not returned" );

	}

	public void function testListTransferReversals() {

		var transferObject = stripe.createTransfer( amount = 500, destination = account.id );
		var result = stripe.listTransferReversals( transfer_id = transferObject.id, limit = 2, include = [ 'total_count' ] );

		debug( transferObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}
}