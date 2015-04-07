component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( apiKey = request.apiKey, includeRaw = true );

	}

	public void function testChargeRefund() {

		var source = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  source = source );
		var result = stripe.createChargeRefund( charge.id, 1000 );

		debug( charge );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( result.amount, 1000, "wrong amount refunded" );

	}

	public void function testRefundRetrieval() {

		var source = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  source = source );
		var refund = stripe.createChargeRefund( charge.id, 1000 );
		var result = stripe.getChargeRefund( charge.id, refund.id );

		debug( charge );
		debug( refund );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( result.amount, 1000, "wrong amount refunded" );

	}

	public void function testRefundUpdate() {

		var source = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  source = source );
		var refund = stripe.createChargeRefund( charge.id, 1000 );
		var result = stripe.updateChargeRefund( charge.id, refund.id, { foo = "test" } );

		debug( charge );
		debug( refund );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( result.metadata.foo, "test", "expected metadata missing" );

	}

	public void function testListRefunds() {

		var source = { object = 'card', number = '4242424242424242', exp_month = '5', exp_year = year( dateAdd( "yyyy", 1, now() ) ) };
		var charge = stripe.createCharge( amount = 3000,  source = source );
		var refund = stripe.createChargeRefund( charge.id, 1000 );
		var result = stripe.listChargeRefunds( charge.id );

		debug( charge );
		debug( refund );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );

	}

}