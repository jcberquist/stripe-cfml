component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.apiKey );

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

	public void function testDeleteCustomerSubscriptionDiscount() {

		var source = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var plan = { id = createUUID(), amount = 1000, interval = 'month', interval_count = 3, name = "Gold Plan", trial_period_days = 30 };
		var coupon = { percent_off = 50, duration = 'repeating', duration_in_months = 5 };
		var couponObject = stripe.createCoupon( argumentCollection = coupon );
		var planObject = stripe.createPlan( argumentCollection = plan );
		var customerObject = stripe.createCustomer( source = source );
		var subscriptionObject = stripe.createCustomerSubscription( customer_id = customerObject.id, plan = planObject.id, coupon = couponObject.id );
		var result = stripe.deleteCustomerSubscriptionDiscount( customerObject.id, subscriptionObject.id );

		debug( couponObject );
		debug( planObject );
		debug( customerObject );
		debug( subscriptionObject );
		debug( result );

		assertEquals( 200, customerObject.status_code, "expected a 200 status" );
		assertTrue( structKeyExists( result, "deleted" ) && result.deleted, "discount not marked not as deleted" );

	}

}