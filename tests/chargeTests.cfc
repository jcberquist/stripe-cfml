component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( stripeSecretKey = request.stripeSecretKey, includeRaw = true );

	}

	public void function testCreateChargeWithCard() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var result = stripe.createCharge( amount = 1999,  card = card );

		debug( result );

		assertEquals( 200, result.status_code, "expected a successful charge" );
		assertTrue( result.captured, "charge was not captured" );

	}

	public void function testCreateChargeWithToken() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var token = stripe.createCardToken( card );
		var result = stripe.createCharge( amount = 2000,  card = token.id );

		debug( token );
		debug( result );

		assertEquals( 200, result.status_code, "expected a successful charge" );
		assertTrue( result.captured, "charge was not captured" );

	}

	public void function testCreateChargeWithCustomer() {

		var card = { number = '5555555555554444', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customer = stripe.createCustomer( email = 'johndoe@example.com', description = 'customer description', card = card );
		var result = stripe.createCharge( amount = 2000,  customer = customer.id );

		debug( customer );
		debug( result );

		assertEquals( 200, result.status_code, "expected a successful charge" );
		assertTrue( result.captured, "charge was not captured" );
		assertEquals( 2000, result.amount, "wrong amount charged" );

	}


	public void function testCreateChargeWithCustomerAndCardID() {

		var card = { number = '5555555555554444', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customer = stripe.createCustomer( email = 'johndoe@example.com', description = 'customer expand', card = card );
		var result = stripe.createCharge( amount = 2000,  customer = customer.id, card = customer.default_card, expand = ['customer','invoice'] );

		debug( customer );
		debug( result );

		assertEquals( 200, result.status_code, "expected a successful charge" );
		assertTrue( result.captured, "charge was not captured" );
		assertEquals( 2000, result.amount, "wrong amount charged" );

	}

	// test only passes if stripe.com is set to decline charges with failed zip checks
	public void function testFailedZipCreateChargeWithCard() {

		var card = { number = '4000000000000010', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ), address_zip = '12345' };
		var result = stripe.createCharge( amount = 2000,  card = card );

		debug( result );

		assertEquals( 402, result.status_code, "expected a 402 status" );
		assertTrue( structKeyExists( result, 'error' ) && isStruct( result.error ), "missing error struct" );
		assertEquals( result.error.code, 'incorrect_zip', "wrong error code" );
	}

	// test only passes if stripe.com is set to decline charges with failed cvc checks
	public void function testFailedCvcCreateChargeWithCard() {

		var card = { number = '4000000000000101', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ), cvc = '123' };
		var result = stripe.createCharge( amount = 2000,  card = card );

		debug( result );

		assertEquals( 402, result.status_code, "expected a 402 status" );
		assertTrue( structKeyExists( result, 'error' ) && isStruct( result.error ), "missing error struct" );
		assertEquals( result.error.code, 'incorrect_cvc', "wrong error code" );
	}

	public void function testChargeRetrieval() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 2000,  card = card );
		var result = stripe.getCharge( charge.id );

		debug( charge );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( charge.id, result.id, "wrong charge retrieved" );
		assertEquals( right( card.number, 4 ), result.card.last4, "wrong card retrieved" );

	}

	public void function testChargeRefund() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  card = card );
		var result = stripe.refundCharge( charge.id, 1000 );

		debug( charge );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( result.amount_refunded, 1000, "wrong amount refunded" );
		assertFalse( result.refunded, "charge supposed to be only partially refunded" );

	}

	public void function testChargeCapture() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  card = card, capture = false );
		var result = stripe.captureCharge( charge.id, 2500 );

		debug( charge );
		debug( result );

		assertFalse( charge.captured, "original charge not supposed to be captured" );
		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( result.amount_refunded, 500, "wrong amount charged" );
		assertTrue( result.captured, "charge supposed to be captured" );

	}

	public void function testListChargesWithCreatedDate() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  card = card );
		var result = stripe.listCharges( created = charge.created );

		debug( charge );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testListChargesWithCreatedTimestamp() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  card = card );
		var result = stripe.listCharges( created = charge.created );

		debug( charge );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testListChargesWithCreatedDictionary() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var chargeOne = stripe.createCharge( amount = 3000,  card = card );
		var chargeTwo = stripe.createCharge( amount = 2500,  card = card );
		var created = { "gte" = chargeOne.created, "lt" = dateAdd( "d", 1, chargeOne.created ) };
		var result = stripe.listCharges( created = created, count = 2 );

		debug( chargeOne );
		debug( chargeTwo );
		debug( created );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testUpdateChargeDispute() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  card = card );
		var result = stripe.updateChargeDispute( charge.id, "Here's evidence showing this charge is legitimate." );

		debug( charge );
		debug( result );

		assertEquals( 404, result.status_code, "expected a 404 invalid_request_error" );

	}



}