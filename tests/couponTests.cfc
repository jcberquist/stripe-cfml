component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.stripeSecretKey );

	}

	public void function testCreateCouponAmountOff() {

		var coupon = { amount_off = 500, duration = 'once', max_redemptions = 1, redeem_by = dateAdd( "d", 1, now() ) };

		var result = stripe.createCoupon( argumentCollection = coupon );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "coupon", result.object, "coupon object was not returned" );

	}

	public void function testCreateCouponPercentOff() {

		var coupon = { percent_off = 50, duration = 'repeating', duration_in_months = 5 };

		var result = stripe.createCoupon( argumentCollection = coupon );

		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "coupon", result.object, "coupon object was not returned" );

	}

	public void function testGetCoupon() {

		var coupon = { id = createUUID(), percent_off = 50, duration = 'repeating', duration_in_months = 5 };

		var couponObject = stripe.createCoupon( argumentCollection = coupon );
		var result = stripe.getCoupon( coupon.id );

		debug( couponObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( coupon.id, result.id, "correct coupon object was not returned" );
		assertEquals( coupon.duration, result.duration, "correct coupon object was not returned" );
	}

	public void function testDeleteCoupon() {

		var coupon = { id = createUUID(), percent_off = 50, duration = 'repeating', duration_in_months = 5 };

		var couponObject = stripe.createCoupon( argumentCollection = coupon );
		var result = stripe.deleteCoupon( coupon.id );

		debug( couponObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( coupon.id, result.id, "correct coupon object was not returned" );
		assertTrue( result.deleted, "coupon was not deleted" );

	}

	public void function testListCoupons() {

		var couponOne = { id = createUUID(), amount_off = 500, duration = 'once', max_redemptions = 1, redeem_by = dateAdd( "d", 1, now() ) };
		var couponTwo = { id = createUUID(), percent_off = 50, duration = 'repeating', duration_in_months = 5 };

		var couponOneObject = stripe.createCoupon( argumentCollection = couponOne );
		var couponTwoObject = stripe.createCoupon( argumentCollection = couponTwo );
		var result = stripe.listCoupons( 2 );

		debug( couponOneObject );
		debug( couponTwoObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.count >= 2, "coupons are not listed" );
		assertTrue( arrayLen( result.data ) == 2, "coupons are not listed" );

	}

	private date function parseUTCTimestamp( required numeric utcTimestamp ) {
	  var utcdate = dateAdd( "s", arguments.utcTimestamp, createDate( 1970,1,1 ) );
	  return dateAdd("s",  getTimeZoneInfo().utcTotalOffset * -1, utcdate );
	}


	
}