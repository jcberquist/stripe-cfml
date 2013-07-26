component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.stripeSecretKey );

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

	public void function testDeleteCustomerDiscount() {

		var coupon = { percent_off = 50, duration = 'repeating', duration_in_months = 5 };
		var couponObject = stripe.createCoupon( argumentCollection = coupon );
		var customerObject = stripe.createCustomer( email = 'test@example.com', coupon = couponObject.id );
		var result = stripe.deleteCustomerDiscount( customerObject.id );

		debug( couponObject );
		debug( customerObject );
		debug( result );

		assertEquals( 200, customerObject.status_code, "expected a 200 status" );
		assertTrue( structKeyExists( result, "deleted" ) && result.deleted, "discount not marked not as deleted" );

	}

	public void function testUpdateCustomerSubscription() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan", trial_period_days = 30 };
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( card = card );
		var result = stripe.updateCustomerSubscription( id = customerObject.id, plan = planObject.id, trial_end = "now" );

		debug( planObject );
		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( !structKeyExists( result, 'trial_end' ) || isNull( result.trial_end ), "trial was supposed to be canceled" );
	}

	public void function testCancelCustomerSubscription() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan" };
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( card = card, plan = planObject.id );
		var result = stripe.cancelCustomerSubscription( id = customerObject.id, at_period_end = true );

		debug( planObject );
		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.cancel_at_period_end, "expected cancel_at_period_end to be true" );

	}


}