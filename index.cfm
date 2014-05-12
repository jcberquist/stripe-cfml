<!DOCTYPE html>
<html>
  <head>
    <title>stripe.cfc</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
		<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">  
	</head>
  <body>

		<div class="navbar">
	    <div class="navbar-inner">
				<a class="brand" href="#">stripe.cfc</a>
	    </div>
	  </div>

	  <div class="container">

			<p class="lead"><strong>stripe.cfc</strong> is a(nother) Railo/ColdFusion wrapper for the stripe.com API.</p>

			<p>It was tested against and supports all of the routes of the <strong>2014-03-28</strong> version of the stripe.com API. It should run on Railo 3.3+ and ColdFusion 9.0.1+.</p>

			<h3>Getting Started</h3>

<pre>
// To charge $20 to a card for which a card token has been created
stripe = new path.to.stripe( 'STRIPE_SECRET_KEY' );
charge = stripe.createCharge( amount = 2000, card = card_token );
// charge is a struct which can be inspected for the result of the create charge api call
writeDump( charge );
</pre>

			<h3>Changelog</h3>

			<h4>Updated to <strong>2014-03-28</strong> version of the stripe.com API</h4>

			<ul>
				<li>Although not listed in any method's arguments, it is now possible to pass in an <code>apiKey</code> argument containing a stripe secret key or an access token (for use with Stripe Connect) to any method, and stripe.cfc will use that api key for the api request instead of the default api key passed in when stripe.cfc was initialized.</li>
				<li>Method arguments have been reordered, with ids first, followed by required arguments in alphabetical order, and then optional arguments in alphabetical order. It is recommended to pass arguments into methods by name, to avoid running into issues caused by the reordering, removal, or addition of arguments.</li>
				<li>Pagination has undergone a significant change. The <code>count</code> and <code>offset</code> arguments are gone. They have been replaced by <code>limit</code>, <code>starting_after</code>, and <code>ending_before</code>. Both <code>starting_after</code> and <code>ending_before</code> take a stripe object ID as a value. See <a href="https://stripe.com/docs/api#pagination">https://stripe.com/docs/api#pagination</a>. While not listed in any list&lt;Object&gt;s() methods, stripe.cfc looks for an <code>include</code> array argument that can be used to get the total count of records when using a list method by passing in <code>include = [ "total_count" ]</code> to the method.</li>
				<li>It should also be mentioned that there is a similar <code>expand</code> array argument that can be used to expand certain properties of the stripe API response so that it includes more detail. See <a href="https://stripe.com/docs/api#expand">https://stripe.com/docs/api#expand</a>.</li>
			</ul>

			<h3>More Details about stripe.cfc</h3>

			<p>By default, stripe.cfc converts all UTC timestamps to and from CFML date variables, but this can be disabled by passing in <code>convertUTCTimestamps = false</code> when stripe.cfc is initialized.</p>

			<p>To use dollars instead of cents, pass <code>convertToCents = true</code> into the init() method when stripe.cfc is created. Stripe.cfc will then multiply all input currency amounts by 100, and divide all return currency amounts by 100. For example:</p>

<pre>
stripe = new path.to.stripe( stripeSecretKey = 'STRIPE_SECRET_KEY', convertToCents = true );
charge = stripe.createCharge( amount = 19.99, card = cardToken );
// stripe.cfc will convert the 19.99 to 1999 before calling the API
</pre>

			<p>The default currency can also be set at init: <code>defaultCurrency = "usd"</code>, as well as overridden on a method by method basis.</p>

			<h4>What is Returned</h4>

			<p>The stripe.com API returns a JSON object in response to all api requests (see <a href="https://stripe.com/docs/api">https://stripe.com/docs/api</a>). Stripe.cfc deserializes this object into a CFML struct. It also adds three key-value pairs to this struct: 'api_request_time', 'status_code', and 'status_text'. 'api_request_time' is the total time in milliseconds for the HTTP request. 'status_code' and 'status_text' refer to the status code received by the HTTP request. If '200 OK' is received, then 'status_code' will be '200' and 'status_text' will be 'OK'.</p>

			<p>Stripe.cfc by default converts all UTC timestamps in the returned JSON object to CFML dates.</p>

			<h4>ColdFusion Notes</h4>

			<p>ColdFusion 10 users on linux should see the follow forum thread regarding slow http requests: <a href="http://forums.adobe.com/message/4833718">http://forums.adobe.com/message/4833718</a>.</p>

			<h3>Testing</h3>

			<p>There are some <a href="tests/index.cfm">unit tests</a> that can be run. They depend on <a href="http://mxunit.org" target="_blank">mxunit</a> and require a mapping of 'mxunit' pointing to the directory of the mxunit framework. Running these are a good way to see some example results.</p>
			<div class="alert"><strong>Warning:</strong> these tests take significant time to complete, as they can each make multiple calls to the stripe.com API in a single test and so can take several seconds to complete. If you run them, make sure you use a valid testing (not live) key!</div>			


<h3>Available Methods</h3>
<h4>Charges <a href="https://stripe.com/docs/api#charges">https://stripe.com/docs/api#charges</a></h4>
<pre>
createCharge( required numeric amount, string currency = variables.defaultCurrency, numeric application_fee, boolean capture, string customer, any card, string description, struct metadata, string statement_description )
getCharge( required string id )
updateCharge( required string id, string description, struct metadata )
refundCharge( required string id, numeric amount, boolean refund_application_fee )
captureCharge( required string id, numeric amount, numeric application_fee )
listCharges( any created, string customer, string ending_before, numeric limit, string starting_after )
</pre>
<h4>Customers <a href="https://stripe.com/docs/api#customers">https://stripe.com/docs/api#customers</a></h4>
<pre>
createCustomer( numeric account_balance, any card, string coupon, string description, string email, struct metadata, string plan, numeric quantity, any trial_end )
getCustomer( required string id )
updateCustomer( required string id, numeric account_balance, any card, string coupon, string default_card, string description, string email, struct metadata )
deleteCustomer( required string id )
listCustomers( any created, string ending_before, numeric limit, string starting_after )
</pre>
<h4>Cards <a href="https://stripe.com/docs/api#cards">https://stripe.com/docs/api#cards</a></h4>
<pre>
createCustomerCard( required string customer_id, any card )
getCustomerCard( required string customer_id, required string id )
updateCustomerCard( required string customer_id, required string id, string address_city, string address_country, string address_line1, string address_line2, string address_state, string address_zip, numeric exp_month, numeric exp_year, string name )
deleteCustomerCard( required string customer_id, required string id )
listCustomerCards( required string customer_id, string ending_before, numeric limit, string starting_after )
</pre>
<h4>Subscriptions <a href="https://stripe.com/docs/api#subscriptions">https://stripe.com/docs/api#subscriptions</a></h4>
<pre>
createCustomerSubscription( required string id, required string plan, numeric application_fee_percent, any card, string coupon, boolean prorate, numeric quantity, any trial_end )
getCustomerSubscription( required string customer_id, required string id )
updateCustomerSubscription( required string customer_id, required string id, numeric application_fee_percent, any card, string coupon, string plan, boolean prorate, numeric quantity, any trial_end )
cancelCustomerSubscription( required string customer_id, required string id, boolean at_period_end )
listCustomerSubscriptions( required string customer_id, string ending_before, numeric limit, string starting_after )
</pre>
<h4>Plans <a href="https://stripe.com/docs/api#plans">https://stripe.com/docs/api#plans</a></h4>
<pre>
createPlan( required string id, required numeric amount, string currency = variables.defaultCurrency, required string interval, required string name, numeric interval_count, struct metadata, string statement_description, numeric trial_period_days )
getPlan( required string id )
updatePlan( required string id, struct metadata, string name, string statement_description )
deletePlan( required string id )
listPlans( string ending_before, numeric limit, string starting_after )
</pre>
<h4>Coupons <a href="https://stripe.com/docs/api#coupons">https://stripe.com/docs/api#coupons</a></h4>
<pre>
createCoupon( string id, required string duration, numeric amount_off, string currency = variables.defaultCurrency, numeric duration_in_months, numeric max_redemptions, struct metadata, numeric percent_off, any redeem_by )
getCoupon( required string id )
deleteCoupon( required string id )
listCoupons( string ending_before, numeric limit, string starting_after )
</pre>
<h4>Discounts <a href="https://stripe.com/docs/api#discounts">https://stripe.com/docs/api#discounts</a></h4>
<pre>
deleteCustomerDiscount( required string id )
deleteCustomerSubscriptionDiscount( required string customer_id, required string id )
</pre>
<h4>Invoices <a href="https://stripe.com/docs/api#invoices">https://stripe.com/docs/api#invoices</a></h4>
<pre>
createInvoice( required string customer, numeric application_fee, string description, struct metadata )
getInvoice( required string id )
getInvoiceLineItems( required string id, string customer, string ending_before, numeric limit, string starting_after, string subscription )
payInvoice( required string id )
updateInvoice( required string id, boolean closed, string description, struct metadata )
listInvoices( string customer, any date, string ending_before, numeric limit, string starting_after )
getUpcomingInvoice( required string customer, string subscription )
</pre>
<h4>Invoice Items <a href="https://stripe.com/docs/api#invoiceitems">https://stripe.com/docs/api#invoiceitems</a></h4>
<pre>
createInvoiceItem( required string customer, required numeric amount, string currency = variables.defaultCurrency, string description, string invoice, struct metadata, string subscription )
getInvoiceItem( required string id )
updateInvoiceItem( required string id, numeric amount, string description, struct metadata )
deleteInvoiceItem( required string id )
listInvoiceItems( any created, string customer, string ending_before, numeric limit, string starting_after )
</pre>
<h4>Disputes <a href="https://stripe.com/docs/api#disputes">https://stripe.com/docs/api#disputes</a></h4>
<pre>
updateChargeDispute( required string id, string evidence )
closeChargeDispute( required string id )
</pre>
<h4>Transfers <a href="https://stripe.com/docs/api#transfers">https://stripe.com/docs/api#transfers</a></h4>
<pre>
createTransfer( required numeric amount, string currency = variables.defaultCurrency, required string recipient, string description, string statement_descriptor, struct metadata )
getTransfer( required string id )
updateTransfer( required string id, string description, struct metadata )
cancelTransfer( required string id )
listTransfers( any created, any date, string ending_before, numeric limit, string recipient, string starting_after, string status )
</pre>
<h4>Recipients <a href="https://stripe.com/docs/api#recipients">https://stripe.com/docs/api#recipients</a></h4>
<pre>
createRecipient( required string name, required string type, any bank_account, string email, string description, struct metadata, string tax_id )
getRecipient( required string id )
updateRecipient( required string id, any bank_account, string email, string description, struct metadata, string name, string tax_id )
deleteRecipient( required string id )
listRecipients( string ending_before, numeric limit, string starting_after, boolean verified )
</pre>
<h4>Application Fees <a href="https://stripe.com/docs/api#application_fees">https://stripe.com/docs/api#application_fees</a></h4>
<pre>
getApplicationFee( required string id )
refundApplicationFee( required string id, numeric amount )
listApplicationFees( string charge, any created, string ending_before, numeric limit, string starting_after )
</pre>
<h4>Account <a href="https://stripe.com/docs/api#account">https://stripe.com/docs/api#account</a></h4>
<pre>
getAccountDetails()
</pre>
<h4>Balance <a href="https://stripe.com/docs/api#balance">https://stripe.com/docs/api#balance</a></h4>
<pre>
getBalance()
getBalanceTransaction( required string id )
listBalanceHistory( any available_on, any created, string ending_before, numeric limit, string starting_after, string transfer, string type )
</pre>
<h4>Events <a href="https://stripe.com/docs/api#events">https://stripe.com/docs/api#events</a></h4>
<pre>
getEvent( required string id )
listEvents( string ending_before, numeric limit, string starting_after, string type )
</pre>
<h4>Tokens <a href="https://stripe.com/docs/api#tokens">https://stripe.com/docs/api#tokens</a></h4>
<pre>
createCardToken( any card, string customer )
createBankAccountToken( struct bank_account )
getToken( required string id )
</pre>

	  </div>

  </body>
</html>