stripe.cfc
=================

**stripe.cfc** is a(nother) Railo/ColdFusion wrapper for the stripe.com API.

It was tested against and supports all of the routes of the **2015-03-24** version of the stripe.com API. It should run on Railo 3.3+ and ColdFusion 9.0.1+.

Getting Started
=================

		// To charge $20 to a card for which a card token has been created
		stripe = new path.to.stripe( 'STRIPE_SECRET_KEY' );
		charge = stripe.createCharge( amount = 2000, source = cardToken );
		// charge is a struct which can be inspected for the result of the create charge api call
		writeDump( charge );

Changelog
=================

#### Updated to **2015-03-24** version of the stripe.com API

- **IMPORTANT** `card` and `default_card` have been replaced with `source` and `default_source`. This means that in the `createCharge` method, for instance, the `card` argument has been renamed to `source`. Correspondingly, the `CustomerCard` methods have been replaced with `CustomerSource` methods.
- In addition to the `apiKey` argument mentioned below, there are now two other arguments that can be passed to any method: `stripeAccount` and `idempotencyKey`. When either argument is included stripe.cfc will add a `Stripe-Account` or `Idempotency-Key` header to the api request respectively.
- The `recipients` api endpoint has been deprecated.

#### Updated to **2014-03-28** version of the stripe.com API

- Although not listed in any method's arguments, it is now possible to pass in an `apiKey` argument containing a stripe secret key or an access token (for use with Stripe Connect) to any method, and stripe.cfc will use that api key for the api request instead of the default api key passed in when stripe.cfc was initialized.
- Method arguments have been reordered, with ids first, followed by required arguments in alphabetical order, and then optional arguments in alphabetical order. It is recommended to pass arguments into methods by name, to avoid running into issues caused by the reordering, removal, or addition of arguments.
- Pagination has undergone a significant change. The `count` and `offset` arguments are gone. They have been replaced by `limit`, `starting_after`, and `ending_before`. Both `starting_after` and `ending_before` take a stripe object ID as a value. See https://stripe.com/docs/api#pagination. While not listed in any list<Object>s() methods, stripe.cfc looks for an `include` array argument that can be used to get the total count of records when using a list method by passing in `include = [ "total_count" ]` to the method.
- It should also be mentioned that there is a similar `expand` array argument that can be used to expand certain properties of the stripe API response so that it includes more detail. See https://stripe.com/docs/api#expand.

More Details about stripe.cfc
=================

By default, stripe.cfc converts all UTC timestamps to and from CFML date variables, but this can be disabled by passing in `convertUTCTimestamps = false` when stripe.cfc is initialized.

To use dollars instead of cents, pass `convertToCents = true` into the init() method when stripe.cfc is created. Stripe.cfc will then multiply all input currency amounts by 100, and divide all return currency amounts by 100. For example:

		stripe = new path.to.stripe( stripeSecretKey = 'STRIPE_SECRET_KEY', convertToCents = true );
		charge = stripe.createCharge( amount = 19.99, card = cardToken );
		// stripe.cfc will convert the 19.99 to 1999 before calling the API

The default currency can also be set at init: `defaultCurrency = "usd"`, as well as overridden on a method by method basis.

**What is Returned**

The stripe.com API returns a JSON object in response to all api requests (see https://stripe.com/docs/api). Stripe.cfc deserializes this object into a CFML struct. It also adds three key-value pairs to this struct: 'api_request_time', 'status_code', and 'status_text'. 'api_request_time' is the total time in milliseconds for the HTTP request. 'status_code' and 'status_text' refer to the status code received by the HTTP request. If '200 OK' is received, then 'status_code' will be '200' and 'status_text' will be 'OK'.

Stripe.cfc by default converts all UTC timestamps in the returned JSON object to CFML dates.

Available Methods
=================
**Charges** https://stripe.com/docs/api#charges

		createCharge( required numeric amount, string currency = variables.defaultCurrency, numeric application_fee, boolean capture, string customer, string description, string destination, struct metadata, string receipt_email, struct shipping, any source, string statement_descriptor )
		getCharge( required string id )
		updateCharge( required string id, string description, struct metadata )
		captureCharge( required string id, numeric amount, numeric application_fee )
		listCharges( any created, string customer, string ending_before, numeric limit, string starting_after )

**Refunds** https://stripe.com/docs/api#refunds

		createChargeRefund( required string id, numeric amount, struct metadata, string reason, boolean refund_application_fee )
		getChargeRefund( required string charge_id, required string id )
		updateChargeRefund( required string charge_id, required string id, struct metadata )
		listChargeRefunds( required string charge_id, string ending_before, numeric limit, string starting_after )

**Customers** https://stripe.com/docs/api#customers

		createCustomer( numeric account_balance, string coupon, string description, string email, struct metadata, string plan, numeric quantity, any source, any trial_end )
		getCustomer( required string id )
		updateCustomer( required string id, numeric account_balance, string coupon, string default_source, string description, string email, struct metadata, any source )
		deleteCustomer( required string id )
		listCustomers( any created, string ending_before, numeric limit, string starting_after )

**Cards** https://stripe.com/docs/api#cards

		createCustomerSource( required string customer_id, any source )
		getCustomerSource( required string customer_id, required string id )
		updateCustomerSource( required string customer_id, required string id, string address_city, string address_country, string address_line1, string address_line2, string address_state, string address_zip, numeric exp_month, numeric exp_year, struct metadata, string name )
		deleteCustomerSource( required string customer_id, required string id )
		listCustomerSources( required string customer_id, string ending_before, numeric limit, string starting_after )

**Subscriptions** https://stripe.com/docs/api#subscriptions

		createCustomerSubscription( required string customer_id, required string plan, numeric application_fee_percent, string coupon, struct metadata, boolean prorate, numeric quantity, any source, numeric tax_percent, any trial_end )
		getCustomerSubscription( required string customer_id, required string id )
		updateCustomerSubscription( required string customer_id, required string id, numeric application_fee_percent, string coupon, struct metadata, string plan, boolean prorate, numeric quantity, any source, numeric tax_percent, any trial_end )
		cancelCustomerSubscription( required string customer_id, required string id, boolean at_period_end )
		listCustomerSubscriptions( required string customer_id, string ending_before, numeric limit, string starting_after )

**Plans** https://stripe.com/docs/api#plans

		createPlan( required string id, required numeric amount, string currency = variables.defaultCurrency, required string interval, required string name, numeric interval_count, struct metadata, string statement_descriptor, numeric trial_period_days )
		getPlan( required string id )
		updatePlan( required string id, struct metadata, string name, string statement_descriptor )
		deletePlan( required string id )
		listPlans( any created, string ending_before, numeric limit, string starting_after )

**Coupons** https://stripe.com/docs/api#coupons

		createCoupon( required string duration, numeric amount_off, string currency = variables.defaultCurrency, numeric duration_in_months, string id, numeric max_redemptions, struct metadata, numeric percent_off, any redeem_by )
		getCoupon( required string id )
		updateCoupon( required string id, struct metadata )
		deleteCoupon( required string id )
		listCoupons( any created, string ending_before, numeric limit, string starting_after )

**Discounts** https://stripe.com/docs/api#discounts

		deleteCustomerDiscount( required string id )
		deleteCustomerSubscriptionDiscount( required string customer_id, required string id )

**Invoices** https://stripe.com/docs/api#invoices

		createInvoice( required string customer, numeric application_fee, string description, struct metadata, string statement_descriptor, string subscription, numeric tax_percent )
		getInvoice( required string id )
		getInvoiceLineItems( required string id, string customer, string ending_before, numeric limit, string starting_after, string subscription )
		getUpcomingInvoice( required string customer, string subscription )
		updateInvoice( required string id, boolean closed, string description, boolean forgiven, struct metadata, string statement_descriptor, numeric tax_percent )
		payInvoice( required string id )
		listInvoices( string customer, any date, string ending_before, numeric limit, string starting_after )

**InvoiceItems** https://stripe.com/docs/api#invoiceitems

		createInvoiceItem( required string customer, required numeric amount, string currency = variables.defaultCurrency, string description, boolean discountable, string invoice, struct metadata, string subscription )
		getInvoiceItem( required string id )
		updateInvoiceItem( required string id, numeric amount, string description, boolean discountable, struct metadata )
		deleteInvoiceItem( required string id )
		listInvoiceItems( any created, string customer, string ending_before, numeric limit, string starting_after )

**Disputes** https://stripe.com/docs/api#disputes

		updateChargeDispute( required string id, struct evidence, struct metadata )
		closeChargeDispute( required string id )

**Transfers** https://stripe.com/docs/api#transfers

		createTransfer( required numeric amount, string currency = variables.defaultCurrency, required string destination, string description, struct metadata, string source_transaction, string statement_descriptor )
		getTransfer( required string id )
		updateTransfer( required string id, string description, struct metadata )
		listTransfers( any created, any date, string ending_before, numeric limit, string recipient, string starting_after, string status )

**Transfer Reversals** https://stripe.com/docs/api#transfer_reversals

		createTransferReversal( required string transfer_id, numeric amount, struct metadata, boolean refund_application_fee )
		getTransferReversal( required string transfer_id, required string id )
		updateTransferReversal( required string transfer_id, required string id, string description, struct metadata )
		listTransferReversals( required string transfer_id, string ending_before, numeric limit, string starting_after )

**Application Fees** https://stripe.com/docs/api#application_fees

		getApplicationFee( required string id )
		listApplicationFees( string charge, any created, string ending_before, numeric limit, string starting_after )

**Fee Refunds** https://stripe.com/docs/api#fee_refunds

		createApplicationFeeRefund( required string application_fee_id, numeric amount, struct metadata )
		getApplicationFeeRefund( required string application_fee_id, required string id )
		updateApplicationFeeRefund( required string application_fee_id, required string id, struct metadata )
		listApplicationFeeRefunds( required string application_fee_id, string ending_before, numeric limit, string starting_after )

**Account** https://stripe.com/docs/api#account

		createAccount( any bank_account, string business_name, string business_url, string country, boolean debit_negative_balances, string default_currency, string email, struct legal_entity, boolean managed, struct metadata, string string, string statement_descriptor, string support_phone, struct tos_acceptance, struct transfer_schedule )
		getAccount( string id )
		updateAccount( required string id, any bank_account, string business_name, string business_url, boolean debit_negative_balances, string default_currency, string email, struct legal_entity, struct metadata, string string, string statement_descriptor, string support_phone, struct tos_acceptance, struct transfer_schedule )
		listAccounts( string ending_before, numeric limit, string starting_after )

**Balance** https://stripe.com/docs/api#balance

		getBalance(  )
		getBalanceTransaction( required string id )
		listBalanceHistory( any available_on, any created, string currency = variables.defaultCurrency, string ending_before, numeric limit, string source, string starting_after, string transfer, string type )

**Events** https://stripe.com/docs/api#events

		getEvent( required string id )
		listEvents( any created, string ending_before, numeric limit, string starting_after, string type )

**Tokens** https://stripe.com/docs/api#tokens

		createCardToken( any card, string customer )
		createBankAccountToken( struct bank_account )
		getToken( required string id )

**Bitcoin Receivers** https://stripe.com/docs/api#bitcoin_receivers

		createBitcoinReceiver( required numeric amount, string currency = variables.defaultCurrency, string email, string description, struct metadata, boolean refund_mispayments )
		getBitcoinReceiver( required string id )
		listBitcoinReceivers( boolean active, string ending_before, boolean filled, numeric limit, string starting_after, boolean uncaptured_funds )

**File Uploads** https://stripe.com/docs/api#file_uploads

		createFileUpload( required string file, required string purpose )
		getFileUpload( required string id )
		listFileUploads( any created, string ending_before, numeric limit, string purpose, string starting_after )