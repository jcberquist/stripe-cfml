component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( apiKey = request.apiKey, includeRaw = true );

	}

	public void function testCreateCustomerSource() {

		var source = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( description = 'Test Customer' );
		var result = stripe.createCustomerSource( customerObject.id, source );

		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "card", result.object, "card object was not returned" );

	}

	public void function testGetCustomerSource() {

		var source = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( source = source );
		var result = stripe.getCustomerSource( customerObject.id, customerObject.default_source );

		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "card", result.object, "card object was not returned" );
		assertEquals( customerObject.default_source, result.id, "correct card object was not returned" );

	}

	public void function testUpdateCustomerSource() {

		var source = { object = 'card', number = '4242424242424242', exp_month = 5, exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( description = 'Test Customer' );
		var sourceObject = stripe.createCustomerSource( customerObject.id, source );
		var result = stripe.updateCustomerSource( customer_id = customerObject.id, id = sourceObject.id, exp_year = year( dateAdd( "yyyy", 2, now() ) ) );

		debug( customerObject );
		debug( sourceObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "card", result.object, "card object was not returned" );
		assertEquals( year( dateAdd( "yyyy", 2, now() ) ), result.exp_year, "correct card exp_year was not returned" );

	}

	public void function testDeleteCustomerSource() {

		var source = { object = 'card', number = '4242424242424242', exp_month = 5, exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var customerObject = stripe.createCustomer( source = source );
		var result = stripe.deleteCustomerSource( customer_id = customerObject.id, id = customerObject.default_source );

		debug( customerObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.deleted, "card object was not deleted" );

	}


	public void function testListCustomerSources() {

		var cardOne = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var cardTwo = { object = 'card', number = '5105105105105100', exp_month = '10', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };

		var customerObject = stripe.createCustomer( source = cardOne );
		var cardCreate = stripe.createCustomerSource( customerObject.id, cardTwo );
		var result = stripe.listCustomerSources( customer_id = customerObject.id, include = [ 'total_count' ], limit = 2 );

		debug( customerObject );
		debug( cardCreate );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( arrayLen( result.data ) == 2, "cards are not listed" );

	}

}