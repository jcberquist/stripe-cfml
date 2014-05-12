component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.apiKey );

	}

	public void function testCreateCustomer() {

		var result = stripe.createCustomer( description = 'Test Customer' );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "customer", result.object, "customer object was not returned" );

	}

	public void function testCreateCustomerWithEmailAndDescription() {

		var result = stripe.createCustomer( email = "test@example.com", description = "this is a test description" );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "customer", result.object, "customer object was not returned" );
		assertEquals( "test@example.com", result.email, "correct customer object was not returned" );
		assertEquals( "this is a test description", result.description, "correct customer object was not returned" );

	}

	public void function testCreateCustomerWithMetadata() {

		var result = stripe.createCustomer( metadata = { email = "test@example.com", description = "this is a test description" } );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "customer", result.object, "customer object was not returned" );
		assertEquals( "test@example.com", result.metadata.email, "correct metadata was not returned" );
		assertEquals( "this is a test description", result.metadata.description, "correct metadata was not returned" );

	}

	public void function testCreateCustomerWithCard() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var result = stripe.createCustomer( card = card );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "customer", result.object, "customer object was not returned" );
		assertTrue( structKeyExists( result, "default_card" ), "created card missing" );
		assertEquals( right( card.number, 4 ), result.cards.data[1].last4, "wrong card number in response" );

	}

	public void function testCreateCustomerWithToken() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var token = stripe.createCardToken( card );
		var result = stripe.createCustomer( card = token.id );

		debug( token );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "customer", result.object, "customer object was not returned" );
		assertTrue( structKeyExists( result, "default_card" ), "created card missing" );
		assertEquals( right( card.number, 4 ), result.cards.data[1].last4, "wrong card number in response" );

	}

	public void function testGetCustomer() {

		var customer = stripe.createCustomer( description = 'Test Customer' );
		var result = stripe.getCustomer( customer.id );

		debug( customer );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( customer.id, result.id, "correct customer object was not returned" );

	}

	public void function testUpdateCustomer() {

		var cardOne = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var cardTwo = { number = '5105105105105100', exp_month = '10', exp_year = '14' };
		var customer = stripe.createCustomer( email = 'testOne@example.com', card = cardOne );
		var result = stripe.updateCustomer( id = customer.id, email = "testTwo@example.com", card = cardTwo );

		debug( customer );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( customer.id, result.id, "correct customer object was not returned" );
		assertEquals( "testOne@example.com", customer.email, "correct original customer object was not returned" );
		assertEquals( right( cardOne.number, 4 ), customer.cards.data[1].last4, "correct original customer card was not returned" );
		assertEquals( "testTwo@example.com", result.email, "correct new customer object was not returned" );
		assertEquals( right( cardTwo.number, 4 ), result.cards.data[1].last4, "correct new customer card was not returned" );

	}

	public void function testUpdateCustomerDefaultCard() {

		var cardOne = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var cardTwo = { number = '5105105105105100', exp_month = '10', exp_year = '14' };
		var cardThree = { number = '378282246310005', exp_month = '10', exp_year = '14' };
		var customerObject = stripe.createCustomer( card = cardOne );
		var cardCreate = stripe.createCustomerCard( customerObject.id, cardTwo );
		var result = stripe.updateCustomer( id = customerObject.id, default_card = cardCreate.id );
		var resultTwo = stripe.updateCustomer( id = customerObject.id, card = cardThree );

		debug( customerObject );
		debug( cardCreate );
		debug( result );
		debug( resultTwo );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

	public void function testUpdateCustomerMetadata() {

		var customer = stripe.createCustomer( metadata = { email = "test@example.com", description = "this is a test description" } );
		var result = stripe.updateCustomer( id = customer.id, metadata = { email = "foo@example.com", description = "" } );

		debug( customer );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "customer", result.object, "customer object was not returned" );
		assertEquals( "foo@example.com", result.metadata.email, "correct metadata was not returned" );
		assertFalse( structKeyExists( result.metadata, "description" ), "correct metadata was not returned" );

	}

	public void function testDeleteCustomer() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var customer = stripe.createCustomer( email = 'test@example.com', card = card );
		var result = stripe.deleteCustomer( customer.id );

		debug( customer );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( customer.id, result.id, "correct customer object was not returned" );
		assertTrue( structKeyExists( result, "deleted" ) && result.deleted, "customer not marked not as deleted" );

	}

}