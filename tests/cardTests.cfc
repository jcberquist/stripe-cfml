component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( stripeSecretKey = request.stripeSecretKey, includeJSON = true );

	}

	public void function testCreateCustomerCard() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( description = 'Test Customer' );
		var result = stripe.createCustomerCard( customerObject.id, card );

		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "card", result.object, "card object was not returned" );

	}

	public void function testGetCustomerCard() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( card = card );
		var result = stripe.getCustomerCard( customerObject.id, customerObject.default_card );

		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "card", result.object, "card object was not returned" );
		assertEquals( customerObject.default_card, result.id, "correct card object was not returned" );

	}

	public void function testUpdateCustomerCard() {

		var card = { number = '4242424242424242', exp_month = 5, exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( description = 'Test Customer' );
		var cardObject = stripe.createCustomerCard( customerObject.id, card );
		var result = stripe.updateCustomerCard( customer_id = customerObject.id, id = cardObject.id, exp_year = 2015 );

		debug( customerObject );
		debug( cardObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "card", result.object, "card object was not returned" );
		assertEquals( 2015, result.exp_year, "correct card exp_year was not returned" );

	}

	public void function testDeleteCustomerCard() {

		var card = { number = '4242424242424242', exp_month = 5, exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( card = card );
		var result = stripe.deleteCustomerCard( customer_id = customerObject.id, id = customerObject.default_card );

		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.deleted, "card object was not deleted" );

	}


	public void function testListCustomerCards() {

		var cardOne = { number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var cardTwo = { number = '5105105105105100', exp_month = '10', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };

		var customerObject = stripe.createCustomer( card = cardOne );
		var cardCreate = stripe.createCustomerCard( customerObject.id, cardTwo );
		var result = stripe.listCustomerCards( customer_id = customerObject.id );

		debug( customerObject );
		debug( cardCreate );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.count == 2, "cards are not listed" );
		assertTrue( arrayLen( result.data ) == 2, "cards are not listed" );

	}

}