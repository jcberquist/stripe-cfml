component extends="mxunit.framework.TestCase" {

	public void function setup() {

		stripe = new stripe.stripe( request.stripeSecretKey );

	}

	public void function testCreateInvoice() {

		var customerObject = stripe.createCustomer( description = 'Test Customer' );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );
		var result = stripe.createInvoice( customerObject.id );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "invoice", result.object, "invoice object was not returned" );
		assertEquals( 1000, result.amount_due, "correct amount_due was not returned" );

	}

	public void function testGetInvoice() {

		var customerObject = stripe.createCustomer( description = 'Test Customer' );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );
		var invoiceObject = stripe.createInvoice( customerObject.id );
		var result = stripe.getInvoice( invoiceObject.id );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( invoiceObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "invoice", result.object, "invoice object was not returned" );
		assertEquals( invoiceObject.id, result.id, "correct invoice was not returned" );

	}

	public void function testGetInvoiceLineItems() {

		var customerObject = stripe.createCustomer( description = 'Test Customer' );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );
		var invoiceObject = stripe.createInvoice( customerObject.id );
		var result = stripe.getInvoiceLineItems( id = invoiceObject.id, count = 5 );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( invoiceObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "list", result.object, "list object was not returned" );
		assertEquals( 1, arrayLen( result.data ), "correct data was not returned" );

	}

	public void function testPayInvoice() {
		
		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };

		var customerObject = stripe.createCustomer( card = card );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );
		var invoiceObject = stripe.createInvoice( customerObject.id );
		var result = stripe.payInvoice( invoiceObject.id );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( invoiceObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "invoice", result.object, "invoice object was not returned" );
		assertTrue( result.closed, "invoice was not closed" );
		assertTrue( result.paid, "invoice was not paid" );

	}

	public void function testUpdateInvoice() {
		
		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };

		var customerObject = stripe.createCustomer( card = card );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );
		var invoiceObject = stripe.createInvoice( customerObject.id );
		var result = stripe.updateInvoice( id = invoiceObject.id, closed = true );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( invoiceObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertEquals( "invoice", result.object, "invoice object was not returned" );
		assertTrue( result.closed, "invoice was not closed" );
		assertFalse( result.paid, "invoice was not supposed to be paid" );

	}

	public void function testListInvoices() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };

		var customerObject = stripe.createCustomer( card = card );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );
		var invoiceObject = stripe.createInvoice( customerObject.id );

		var result = stripe.listInvoices( 1 );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( invoiceObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.count >= 1, "invoice is not listed" );
		assertTrue( arrayLen( result.data ) == 1, "invoice is not listed" );

	}	

	public void function testListInvoicesWithDateDictionary() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };

		var customerObject = stripe.createCustomer( card = card );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );
		var invoiceObject = stripe.createInvoice( customerObject.id );

		var date = { "gte" = invoiceObject.date, "lt" = dateAdd( "d", 1, invoiceObject.date ) };
		var result = stripe.listInvoices( count = 1, date = date );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( invoiceObject );
		debug( date );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.count >= 1, "invoice is not listed" );
		assertTrue( arrayLen( result.data ) == 1, "invoice is not listed" );

	}

	public void function testGetUpcomingInvoice() {

		var card = { number = '4242424242424242', exp_month = '5', exp_year = '14' };

		var customerObject = stripe.createCustomer( card = card );
		var invoiceitemObject = stripe.createInvoiceItem( customer = customerObject.id, amount = 1000, description = "Extra Fee" );

		var result = stripe.getUpcomingInvoice( customerObject.id );

		debug( customerObject );
		debug( invoiceitemObject );
		debug( result );

		assertEquals( 200, result.status_code, "expected a 200 status" );
		assertTrue( result.lines.count >= 1, "lines not returned" );

	}	

}