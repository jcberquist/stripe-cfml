stripe.cfc
=================

**stripe.cfc** is a(nother) Railo/ColdFusion wrapper for the stripe.com API.

It was tested against and supports all of the routes of the **2013-07-05** version of the stripe.com API. It should run on Railo 3.3+ and ColdFusion 9.0.1+.

Getting Started
=================

		// To charge $20 to a card for which a card token has been created
		stripe = new path.to.stripe( 'STRIPE_SECRET_KEY' );
		charge = stripe.createCharge( amount = 2000, card = cardToken );
		// charge is a struct which can be inspected for the result of the create charge api call
		writeDump( charge );

By default, stripe.cfc converts all UTC timestamps to and from CFML date variables, but this can be disabled by passing in `convertUTCTimestamps = false` when stripe.cfc is initialized.

To use dollars instead of cents, pass `convertToCents = true` into the init() method when stripe.cfc is created. Stripe.cfc will then multiply all input currency amounts by 100, and divide all return currency amounts by 100. For example:

		stripe = new path.to.stripe( stripeSecretKey = 'STRIPE_SECRET_KEY', convertToCents = true );
		charge = stripe.createCharge( amount = 19.99, card = cardToken );
		// stripe.cfc will convert the 19.99 to 1999 before calling the API

The default currency can also be set at init: `defaultCurrency = "usd"`, as well as overridden on a method by method basis.

**What is Returned**

The stripe.com API returns a JSON object in response to all api requests (see https://stripe.com/docs/api). Stripe.cfc deserializes this object into a CFML struct. It also adds three key-value pairs to this struct: 'api_request_time', 'status_code', and 'status_text'. 'api_request_time' is the total time in milliseconds for the HTTP request. 'status_code' and 'status_text' refer to the status code received by the HTTP request. If '200 OK' is received, then 'status_code' will be '200' and 'status_text' will be 'OK'.

Stripe.cfc by default converts all UTC timestamps in the returned JSON object to CFML dates.

**ColdFusion Notes**

ColdFusion will not do a HTTP POST without at least one cfhttpparam. So although a method like createCustomer() can be called without any arguments in Railo, it will throw an error in ColdFusion.

ColdFusion 10 users on linux should see the follow forum thread regarding slow http requests: http://forums.adobe.com/message/4833718.

Available Methods
=================
**Charges** https://stripe.com/docs/api#charges

		createCharge( required numeric amount, string currency = variables.defaultCurrency, string customer, any card, string description, boolean capture, numeric application_fee )
		getCharge( required string id )
		refundCharge( required string id, numeric amount )
		captureCharge( required string id, numeric amount, numeric application_fee )
		listCharges( numeric count, any created, numeric offset, string customer )
		updateChargeDispute( required string id, string evidence )

**Customers** https://stripe.com/docs/api#customers

		createCustomer( any card, string email, string description, string coupon, numeric account_balance, string plan, any trial_end, numeric quantity )
		getCustomer( required string id )
		updateCustomer( required string id, any card, string default_card, string email, string description, string coupon, numeric account_balance )
		deleteCustomer( required string id )
		deleteCustomerDiscount( required string id )
		listCustomers( numeric count, any created, numeric offset )
		updateCustomerSubscription( required string id, required string plan, string coupon, boolean prorate, any trial_end, any card, numeric quantity )
		cancelCustomerSubscription( required string id, boolean at_period_end )
		createCustomerCard( required string customer_id, any card )
		updateCustomerCard( required string customer_id, required string id, string address_city, string address_line1, string address_line2, string address_state, string address_zip, numeric exp_month, numeric exp_year, string name )
		getCustomerCard( required string customer_id, required string id )
		deleteCustomerCard( required string customer_id, required string id )
		listCustomerCards( required string customer_id, numeric count, numeric offset )

**Plans** https://stripe.com/docs/api#plans

		createPlan( required string id, required numeric amount, string currency = variables.defaultCurrency, required string interval, numeric interval_count, required string name, numeric trial_period_days )
		getPlan( required string id )
		updatePlan( required string id, required string name )
		deletePlan( required string id )
		listPlans( numeric count, numeric offset )

**Coupons** https://stripe.com/docs/api#coupons

		createCoupon( string id, required string duration, numeric amount_off, string currency = variables.defaultCurrency, numeric duration_in_months, numeric max_redemptions, numeric percent_off, any redeem_by )
		getCoupon( required string id )
		deleteCoupon( required string id )
		listCoupons( numeric count, numeric offset )

**InvoiceItems** https://stripe.com/docs/api#invoiceitems

		createInvoiceItem( required string customer, required numeric amount, string currency = variables.defaultCurrency, string invoice, string description )
		getInvoiceItem( required string id )
		updateInvoiceItem( required string id, numeric amount, string description )
		deleteInvoiceItem( required string id )
		listInvoiceItems( numeric count, any created, string customer, numeric offset )

**Invoices** https://stripe.com/docs/api#invoices

		createInvoice( required string customer )
		getInvoice( required string id )
		getInvoiceLineItems( required string id, numeric count, string customer, numeric offset )
		payInvoice( required string id )
		updateInvoice( required string id, boolean closed )
		listInvoices( numeric count, string customer, any date, numeric offset )
		getUpcomingInvoice( required string customer )

**Recipients** https://stripe.com/docs/api#recipients

		createRecipient( required string name, required string type, string tax_id, any bank_account, string email, string description )
		getRecipient( required string id )
		updateRecipient( required string id, string name, string tax_id, any bank_account, string email, string description )
		deleteRecipient( required string id )
		listRecipients( numeric count, numeric offset, boolean verified )

**Transfers** https://stripe.com/docs/api#transfers

		createTransfer( required numeric amount, string currency = variables.defaultCurrency, required string recipient, string description, string statement_descriptor )
		getTransfer( required string id )
		cancelTransfer( required string id )
		listTransfers( numeric count, any date, numeric offset, string recipient, string status )

**Events** https://stripe.com/docs/api#events

		getEvent( required string id )
		listEvents( numeric count, any created, numeric offset, string type )

**Tokens** https://stripe.com/docs/api#tokens

		createCardToken( struct card, string customer )
		createBankAccountToken( struct bank_account )
		getToken( required string id )

**Miscellaneous**

		getAccountDetails(  )
		getBalance(  )
		listBalanceHistory( any available_on, numeric count, any created, numeric offset, string transfer, string type )
