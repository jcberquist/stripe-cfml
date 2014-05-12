component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.apiKey );

	}

	public void function testCreateCustomerSubscription() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan", trial_period_days = 30 };
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( card = card );
		var result = stripe.createCustomerSubscription( id = customerObject.id, plan = planObject.id, trial_end = "now" );

		debug( planObject );
		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( !structKeyExists( result, 'trial_end' ) || isNull( result.trial_end ), "trial was supposed to be canceled" );

	}

	public void function testGetCustomerSubscription() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan", trial_period_days = 30 };
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( card = card );
		var subscription = stripe.createCustomerSubscription( id = customerObject.id, plan = planObject.id, trial_end = "now" );
		var result = stripe.getCustomerSubscription( customer_id = customerObject.id, id = subscription.id );

		debug( planObject );
		debug( customerObject );
		debug( subscription );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( subscription.id, result.id, "wrong subscription returned" );

	}

	public void function testUpdateCustomerSubscription() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan", trial_period_days = 30 };
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( card = card );
		var subscription = stripe.createCustomerSubscription( id = customerObject.id, plan = planObject.id, trial_end = "now" );
		var result = stripe.updateCustomerSubscription( customer_id = customerObject.id, id = subscription.id, quantity = 2 );

		debug( planObject );
		debug( customerObject );
		debug( subscription );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( 2, result.quantity, "expected quantity to be 2" );

	}

	public void function testCancelCustomerSubscription() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan", trial_period_days = 30 };
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( card = card );
		var subscription = stripe.createCustomerSubscription( id = customerObject.id, plan = planObject.id, trial_end = "now" );
		var result = stripe.cancelCustomerSubscription(  customer_id = customerObject.id, id = subscription.id, at_period_end = true );

		debug( planObject );
		debug( customerObject );
		debug( subscription );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.cancel_at_period_end, "expected cancel_at_period_end to be true" );

	}

	public void function testListCustomerSubscriptions() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan", trial_period_days = 30 };
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( card = card );
		var subscription = stripe.createCustomerSubscription( id = customerObject.id, plan = planObject.id, trial_end = "now" );
		var result = stripe.listCustomerSubscriptions(  customer_id = customerObject.id );

		debug( planObject );
		debug( customerObject );
		debug( subscription );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}


}