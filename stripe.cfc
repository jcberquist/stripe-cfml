/*
	Copyright (c) 2013, John Berquist

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/
component {

	variables.integerFields = [ "quantity","limit","interval_count","trial_period_days","duration_in_months","max_redemptions", "percent_off","exp_month","exp_year","cvc" ];
	variables.numericFields = [ "application_fee_percent","tax_percent" ];
	variables.currencyFields = [ "amount","amount_refunded","amount_off","account_balance","fee","application_fee","net" ];
	variables.timestampFields = [ "created","trial_start","trial_end","redeem_by","start","end","ended_at","period_start","period_end","date","next_payment_attempt","available_on","current_period_start","current_period_end","canceled_at","gt","gte","lt","lte" ];
	variables.booleanFields = [ "active","at_period_end","capture","closed","debit_negative_balances","discountable","filled","forgiven","prorate","refund_application_fee","refund_mispayments","managed","uncaptured_funds" ];
	variables.arrayFields = [ "expand","include","additional_owners" ];
	variables.dictionaryFields = {
		source = { required = [ "object","number","exp_month","exp_year" ], optional = [ "cvc","name","address_line1","address_line2","address_city","address_zip","address_state","address_country" ] },
		card = { required = [ "number","exp_month","exp_year" ], optional = [ "cvc","name","address_line1","address_line2","address_city","address_zip","address_state","address_country" ] },
		evidence = { required = [ ], optional = [ "access_activity_log","billing_address","cancellation_policy","cancellation_policy_disclosure","cancellation_rebuttal","customer_communication","customer_email_address","customer_name","customer_purchase_ip","customer_signature","duplicate_charge_documentation","duplicate_charge_explanation","duplicate_charge_id","product_description","receipt","refund_policy","refund_policy_disclosure","refund_refusal_explanation","service_date","service_documentation","shipping_address","shipping_carrier","shipping_date","shipping_documentation","shipping_tracking_number","uncategorized_file","uncategorized_text" ] },
		bank_account = { required = [ "country","currentcy","account_number" ], optional = [ "routing_number" ] },
		legal_entity = { required = [ "" ], optional = [ "type","address","business_name","business_tax_id","business_vat_id","dob","first_name","last_name","personal_address","personal_id_number","ssn_last_4","verification","additional_owners" ] },
		dob = { required = [ "day","month","year" ], optional = [ ] },
		personal_address = { required = [ ], optional = [ "line1","line2","city","state","postal_code","country" ]	},
		verification = { required = [ "" ], optional = [ "document" ] },
		tos_acceptance = { required = [ "date","ip" ], optional = [ "user_agent" ] },
		transfer_schedule = { required = [ "" ], optional = [ "delay_days","interval","monthly_anchor","weekly_anchor" ] },
		available_on = { required = [ ],	optional = [ "gt","gte","lt","lte" ] },
		created = { required = [ ],	optional = [ "gt","gte","lt","lte" ] },
		date = { required = [ ], optional = [ "gt","gte","lt","lte" ]	},
		shipping = { required = [ ], optional = [ "address","carrier","phone","name","tracking_number" ]	},
		address = { required = [ ], optional = [ "line1","line2","city","state","postal_code","country" ]	},
		metadata = { required = [ ], optional = [ ] }
	};

	public any function init( required string apiKey, boolean convertUTCTimestamps = true, boolean convertToCents = false, string defaultCurrency = "usd", boolean includeRaw = false, string apiBaseUrl = "https://api.stripe.com/v1/", string fileUploadBaseUrl = "https://uploads.stripe.com/v1/" ) {
		structAppend( variables, arguments );

		variables.utcBaseDate = dateAdd( "l", createDate( 1970,1,1 ).getTime() * -1, createDate( 1970,1,1 ) );

		return this;
	}

	// Charges

	public struct function createCharge( required numeric amount, string currency = variables.defaultCurrency, numeric application_fee, boolean capture, string customer, string description, string destination, struct metadata, string receipt_email, struct shipping, any source, string statement_descriptor ) {
		return apiCall( "charges", setupParams( arguments ), "post" );
	}

	public struct function getCharge( required string id )	{
		return apiCall( "charges/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCharge( required string id, string description, struct metadata )	{
		return apiCall( "charges/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function captureCharge( required string id, numeric amount, numeric application_fee ) {
		return apiCall( "charges/#trim( arguments.id )#/capture", setupParams( arguments ), "post" );
	}

	public struct function listCharges( any created, string customer, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "charges", setupParams( arguments ) );
	}

	// Refunds

	public struct function createChargeRefund( required string id, numeric amount, struct metadata, string reason, boolean refund_application_fee ) {
		return apiCall( "charges/#trim( arguments.id )#/refunds", setupParams( arguments ), "post" );
	}

	public struct function getChargeRefund( required string charge_id, required string id ) {
		return apiCall( "charges/#trim( arguments.charge_id )#/refunds/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateChargeRefund( required string charge_id, required string id, struct metadata )	{
		return apiCall( "charges/#trim( arguments.charge_id )#/refunds/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listChargeRefunds( required string charge_id, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "charges/#trim( arguments.charge_id )#/refunds", setupParams( arguments ) );
	}

	// Customers

	public struct function createCustomer( numeric account_balance, string coupon, string description, string email, struct metadata, string plan, numeric quantity, any source, any trial_end ) {
		return apiCall( "customers", setupParams( arguments ), "post" );
	}

	public struct function getCustomer( required string id ) {
		return apiCall( "customers/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCustomer( required string id, numeric account_balance, string coupon, string default_source, string description, string email, struct metadata, any source ) {
		return apiCall( "customers/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteCustomer( required string id )	{
		return apiCall( "customers/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCustomers( any created, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "customers", setupParams( arguments ) );
	}

	// Subscriptions

	public struct function createCustomerSubscription( required string customer_id, required string plan, numeric application_fee_percent, string coupon, struct metadata, boolean prorate, numeric quantity, any source, numeric tax_percent, any trial_end ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions", setupParams( arguments ), "post" );
	}

	public struct function getCustomerSubscription( required string customer_id, required string id ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCustomerSubscription( required string customer_id, required string id, numeric application_fee_percent, string coupon, struct metadata, string plan, boolean prorate, numeric quantity, any source, numeric tax_percent, any trial_end ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function cancelCustomerSubscription( required string customer_id, required string id, boolean at_period_end ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCustomerSubscriptions( required string customer_id, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions", setupParams( arguments ) );
	}

	// Cards / Sources

	public struct function createCustomerSource( required string customer_id, any source ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/sources", setupParams( arguments ), "post" );
	}

	public struct function getCustomerSource( required string customer_id, required string id ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/sources/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCustomerSource( required string customer_id, required string id, string address_city, string address_country, string address_line1, string address_line2, string address_state, string address_zip, numeric exp_month, numeric exp_year, struct metadata, string name ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/sources/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteCustomerSource( required string customer_id, required string id ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/sources/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCustomerSources( required string customer_id, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/sources", setupParams( arguments ) );
	}

	// Plans

	public struct function createPlan( required string id, required numeric amount, string currency = variables.defaultCurrency, required string interval, required string name, numeric interval_count, struct metadata, string statement_descriptor, numeric trial_period_days ) {
		return apiCall( "plans", setupParams( arguments, true ), "post" );
	}

	public struct function getPlan( required string id ) {
		return apiCall( "plans/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updatePlan( required string id, struct metadata, string name, string statement_descriptor ) {
		return apiCall( "plans/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deletePlan( required string id ) {
		return apiCall( "plans/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listPlans( any created, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "plans", setupParams( arguments ) );
	}

	// Coupons

	public struct function createCoupon( required string duration, numeric amount_off, string currency = variables.defaultCurrency, numeric duration_in_months, string id, numeric max_redemptions, struct metadata, numeric percent_off, any redeem_by ) {
		// only one of percent_off and amount_off can be provided to the createCoupon function
		if ( !( structKeyExists( arguments, "amount_off" ) xor structKeyExists( arguments, "percent_off" ) ) ) {
			throwError( "createCoupon: please provide one and only one of amount_off and percent_off params" );
		}
		// duration_in_months is required only when duration equals "repeating"
		if ( arguments.duration == "repeating" xor structKeyExists( arguments, "duration_in_months" ) ) {
			throwError( "createCoupon: duration_in_months is required when and only when duration equals 'repeating'" );
		}
		return apiCall( "coupons", setupParams( arguments, true ), "post" );
	}

	public struct function getCoupon( required string id ) {
		return apiCall( "coupons/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCoupon( required string id, struct metadata ) {
		return apiCall( "coupons/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteCoupon( required string id ) {
		return apiCall( "coupons/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCoupons( any created, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "coupons", setupParams( arguments ) );
	}

	// Discounts

	public struct function deleteCustomerDiscount( required string id )	{
		return apiCall( "customers/#trim( arguments.id )#/discount", setupParams( arguments ), "delete" );
	}

	public struct function deleteCustomerSubscriptionDiscount( required string customer_id, required string id )	{
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions/#trim( arguments.id )#/discount", setupParams( arguments ), "delete" );
	}

	// Invoices

	public struct function createInvoice( required string customer, numeric application_fee, string description, struct metadata, string statement_descriptor, string subscription, numeric tax_percent )	{
		return apiCall( "invoices", setupParams( arguments ), "post" );
	}

	public struct function getInvoice( required string id )	{
		return apiCall( "invoices/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function getInvoiceLineItems( required string id, string customer, string ending_before, numeric limit, string starting_after, string subscription )	{
		return apiCall( "invoices/#trim( arguments.id )#/lines", setupParams( arguments ) );
	}

	public struct function getUpcomingInvoice( required string customer, string subscription ) {
		return apiCall( "invoices/upcoming", setupParams( arguments ) );
	}

	public struct function updateInvoice( required string id, boolean closed, string description, boolean forgiven, struct metadata, string statement_descriptor, numeric tax_percent )	{
		return apiCall( "invoices/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function payInvoice( required string id )	{
		return apiCall( "invoices/#trim( arguments.id )#/pay", setupParams( arguments ), "post" );
	}

	public struct function listInvoices( string customer, any date, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "invoices", setupParams( arguments ) );
	}

	// Invoice Items

	public struct function createInvoiceItem( required string customer, required numeric amount, string currency = variables.defaultCurrency, string description, boolean discountable, string invoice, struct metadata, string subscription )	{
		return apiCall( "invoiceitems", setupParams( arguments ), "post" );
	}

	public struct function getInvoiceItem( required string id ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateInvoiceItem( required string id, numeric amount, string description, boolean discountable, struct metadata ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteInvoiceItem( required string id ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listInvoiceItems( any created, string customer, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "invoiceitems", setupParams( arguments ) );
	}

	// Disputes

	public struct function updateChargeDispute( required string id, struct evidence, struct metadata ) {
		return apiCall( "charges/#trim( arguments.id )#/dispute", setupParams( arguments ), "post" );
	}

	public struct function closeChargeDispute( required string id ) {
		return apiCall( "charges/#trim( arguments.id )#/dispute/close", setupParams( arguments ), "post" );
	}

	// Transfers

	public struct function createTransfer( required numeric amount, string currency = variables.defaultCurrency, required string destination, string description, struct metadata, string source_transaction, string statement_descriptor ) {
		return apiCall( "transfers", setupParams( arguments ), "post" );
	}

	public struct function getTransfer( required string id ) {
		return apiCall( "transfers/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateTransfer( required string id, string description, struct metadata ) {
		return apiCall( "transfers/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listTransfers( any created, any date, string ending_before, numeric limit, string recipient, string starting_after, string status ) {
		return apiCall( "transfers", setupParams( arguments ) );
	}

	// Transfer Reversals

	public struct function createTransferReversal( required string transfer_id, numeric amount string description, struct metadata, boolean refund_application_fee ) {
		return apiCall( "transfers/#trim( arguments.transfer_id )#/reversals", setupParams( arguments ), "post" );
	}

	public struct function getTransferReversal( required string transfer_id, required string id ) {
		return apiCall( "transfers/#trim( arguments.transfer_id )#/reversals/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateTransferReversal( required string transfer_id, required string id, string description, struct metadata ) {
		return apiCall( "transfers/#trim( arguments.transfer_id )#/reversals/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listTransferReversals( required string transfer_id, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "transfers/#trim( arguments.transfer_id )#/reversals", setupParams( arguments ) );
	}

	// Recipients - Deprecated

	/*
	public struct function createRecipient( required string name, required string type, any bank_account, string email, string description, struct metadata, string tax_id ) {
		return apiCall( "recipients", setupParams( arguments ), "post" );
	}

	public struct function getRecipient( required string id ) {
		return apiCall( "recipients/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateRecipient( required string id, any bank_account, string email, string description, struct metadata, string name, string tax_id ) {
		return apiCall( "recipients/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteRecipient( required string id )	{
		return apiCall( "recipients/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listRecipients( string ending_before, numeric limit, string starting_after, boolean verified ) {
		return apiCall( "recipients", setupParams( arguments ) );
	}
	*/

	// Application Fees

	public struct function getApplicationFee( required string id ) {
		return apiCall( "application_fees/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function listApplicationFees( string charge, any created, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "application_fees", setupParams( arguments ) );
	}

	// Application Fee Refunds

	public struct function createApplicationFeeRefund( required string application_fee_id, numeric amount, struct metadata = { } ) {
		return apiCall( "application_fees/#trim( arguments.application_fee_id )#/refunds", setupParams( arguments ) );
	}

	public struct function getApplicationFeeRefund( required string application_fee_id, required string id ) {
		return apiCall( "application_fees/#trim( arguments.transfer_id )#/refunds/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateApplicationFeeRefund( required string application_fee_id, required string id, struct metadata ) {
		return apiCall( "application_fees/#trim( arguments.application_fee_id )#/refunds/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listApplicationFeeRefunds( required string application_fee_id, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "application_fees/#trim( arguments.application_fee_id )#/refunds", setupParams( arguments ) );
	}

	// Accounts

	public struct function createAccount( any bank_account, string business_name, string business_url, string country, boolean debit_negative_balances, string default_currency, string email, struct legal_entity, boolean managed, struct metadata, string string product_description, string statement_descriptor, string support_phone, struct tos_acceptance, struct transfer_schedule ) {
		return apiCall( "accounts", setupParams( arguments ), "post" );
	}

	public struct function getAccount( string id = '' ) {
		return apiCall( "accounts/#trim( arguments.id )#" );
	}

	public struct function updateAccount( required string id, any bank_account, string business_name, string business_url, boolean debit_negative_balances, string default_currency, string email, struct legal_entity, struct metadata, string string product_description, string statement_descriptor, string support_phone, struct tos_acceptance, struct transfer_schedule ) {
		return apiCall( "accounts/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listAccounts( string ending_before, numeric limit, string starting_after ) {
		return apiCall( "accounts", setupParams( arguments ) );
	}

	// Balance

	public struct function getBalance() {
		return apiCall( "balance", setupParams( arguments ) );
	}

	public struct function getBalanceTransaction( required string id ) {
		return apiCall( "balance/history/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function listBalanceHistory( any available_on, any created, string currency, string ending_before, numeric limit, string source, string starting_after, string transfer, string type ) {
		return apiCall( "balance/history", setupParams( arguments ) );
	}

	// Events

	public struct function getEvent( required string id ) {
		return apiCall( "events/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function listEvents( any created, string ending_before, numeric limit, string starting_after, string type ) {
		return apiCall( "events", setupParams( arguments ) );
	}

	// Tokens

	public struct function createCardToken( any card, string customer ) {
		return apiCall( "tokens", setupParams( arguments ), "post" );
	}

	public struct function createBankAccountToken( struct bank_account ) {
		return apiCall( "tokens", setupParams( arguments ), "post" );
	}

	public struct function getToken( required string id ) {
		return apiCall( "tokens/#trim( arguments.id )#", setupParams( arguments ) );
	}

	// Bitcoin

	public struct function createBitcoinReceiver( required numeric amount, string currency = variables.defaultCurrency, string email, string description, struct metadata, boolean refund_mispayments ) {
		return apiCall( "bitcoin/receivers", setupParams( arguments ), "post" );
	}

	public struct function getBitcoinReceiver( required string id ) {
		return apiCall( "bitcoin/receivers/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function listBitcoinReceivers( boolean active, string ending_before, boolean filled, numeric limit, string starting_after, boolean uncaptured_funds ) {
		return apiCall( "bitcoin/receivers", setupParams( arguments ) );
	}

	// File Uploads

	public struct function createFileUpload( required string file, required string purpose ) {
		return apiCall( "files", setupParams( arguments ), "post", true );
	}

	public struct function getFileUpload( required string id ) {
		return apiCall( "files/#trim( arguments.id )#", setupParams( arguments ), "get", true );
	}

	public struct function listFileUploads( any created, string ending_before, numeric limit, string purpose, string starting_after ) {
		return apiCall( "files", setupParams( arguments ), "get", true );
	}

	// PRIVATE FUNCTIONS

	private struct function apiCall( required string path, array params = [ ], string method = "get", boolean fileUpload = false )	{
		var fullApiPath = ( fileUpload ? variables.fileUploadBaseUrl : variables.apiBaseUrl ) & arguments.path;
		var requestStart = getTickCount();
		var apiResponse = makeHttpRequest( urlPath = fullApiPath, params = arguments.params, method = arguments.method );
		var result = { "api_request_time" = getTickCount() - requestStart, "status_code" = listFirst( apiResponse.statuscode, " " ), "status_text" = listRest( apiResponse.statuscode, " " ) };
		if ( variables.includeRaw ) {
			result[ "raw" ] = { "method" = ucase( arguments.method ), "path" = fullApiPath, "params" = serializeJSON( arguments.params ), "response" = apiResponse.fileContent };
		}
		structAppend(  result, deserializeJSON( apiResponse.fileContent ), true );
		if ( variables.convertUTCTimestamps || variables.convertToCents ) parseResult( result );
		return result;
	}

	private any function makeHttpRequest( required string urlPath, required array params, required string method ) {
		var http = new http( url = arguments.urlPath, method = arguments.method, username = variables.apiKey, password = "" );

		// adding a user agent header so that Adobe ColdFusion doesn't get mad about empty HTTP posts
		http.addParam( type = "header", name = "User-Agent", value = "stripe.cfc" );

		var qs = [ ];

		// look for special params 'idempotencyKey','stripeAccount','apiKey'
		for ( var param in arguments.params ) {

			if ( param.name == "idempotencyKey" ) {
				http.addParam( type = "header", name = "Idempotency-Key", value = param.value );
			} else if ( param.name == "apiKey"  ) {
				http.setUsername( param.value );
			} else if ( param.name == "stripeAccount"  ) {
				http.addParam( type = "header", name = "Stripe-Account", value = param.value );
			} else if ( arguments.method == "post" ) {
				if ( param.name == "file" ) {
					http.addParam( type = "file", name = lcase( param.name ), file = param.value );
				} else {
					http.addParam( type = "formfield", name = lcase( param.name ), value = param.value );
				}
			} else if ( arrayFind( [ "get","delete" ], arguments.method ) ) {
				arrayAppend( qs, lcase( param.name ) & "=" & encodeurl( param.value ) );
			}
		}

		if ( arrayLen( qs ) ) {
			http.setUrl( arguments.urlPath & "?" & arrayToList( qs, "&" ) );
		}

		return http.send().getPrefix();
	}

	private array function setupParams( required struct params, boolean includeIds = false ) {
		var filteredParams = { };
		var paramKeys = structKeyArray( arguments.params );
		for ( var paramKey in paramKeys ) {
			if ( structKeyExists( arguments.params, paramKey ) && !isNull( arguments.params[ paramKey ] ) && ( ( paramKey != "id" && right( paramKey, 3 ) != "_id" ) || arguments.includeIds ) ) {
				filteredParams[ paramKey ] = params[ paramKey ];
			}
		}
		return parseDictionary( filteredParams );
	}

	private array function parseDictionary( required struct dictionary, string name = '', string root = '' ) {
		var result = [ ];
		var structFieldExists = structKeyExists( variables.dictionaryFields, arguments.name );

		// validate required dictionary keys based on variables.dictionaries
		if ( structFieldExists ) {
			for ( var field in variables.dictionaryFields[ arguments.name ].required ) {
				if ( !structKeyExists( arguments.dictionary, field ) ) {
					throwError( "'#arguments.name#' dictionary missing required field: #field#" );
				}
			}
		}

		// special metadata handling -- metadata has 20 key limit and is cleared by passing empty metadata struct
		if ( arguments.name == "metadata" ) {
			if ( arrayLen( structKeyArray( arguments.dictionary ) ) > 20 ) {
				throwError( "There can be a maximum of 20 keys in a metadata struct." );
			}
			if ( structIsEmpty( arguments.dictionary ) ) {
				arrayAppend( result, { name = arguments.root, value = "" } );
			}
		}

		for ( var key in arguments.dictionary ) {

			// confirm that key is a valid one based on variables.dictionaries
			if ( structFieldExists && arguments.name != "metadata" && !( arrayFindNoCase( variables.dictionaryFields[ arguments.name ].required, key ) || arrayFindNoCase( variables.dictionaryFields[ arguments.name ].optional, key ) ) ) {
				throwError( "'#arguments.name#' dictionary has invalid field: #key#" );
			}

			var fullKey = len( arguments.root ) ? arguments.root & '[' & lcase( key ) & ']' : lcase( key );
			if ( isStruct( arguments.dictionary[ key ] ) ) {
				for ( var item in parseDictionary( arguments.dictionary[ key ], key, fullKey ) ) {
					arrayAppend( result, item );
				}
			} else if ( isArray( arguments.dictionary[ key ] ) ) {
				for ( var item in parseArray( arguments.dictionary[ key ], key, fullKey ) ) {
					arrayAppend( result, item );
				}
			} else {
				// note: metadata struct is special - no validation is done on it
				arrayAppend( result, { name = fullKey, value = getValidatedParam( key, arguments.dictionary[ key ], arguments.name != "metadata" ) } );
			}

		}

		return result;
	}

	private array function parseArray( required array list, string name = '', string root = '' ) {
		var result = [ ];
		var index = 0;
		var arrayFieldExists = arrayFindNoCase( variables.arrayFields, arguments.name );

		if ( !arrayFieldExists ) {
			throwError( "'#arguments.name#' is not an allowed list variable." );
		}

		for ( var item in arguments.list ) {
			if ( isStruct( item ) ) {
				var fullKey = len( arguments.root ) ? arguments.root & "[" & index & "]" : arguments.name & "[" & index & "]";
				for ( var item in parseDictionary( item, '', fullKey ) ) {
					arrayAppend( result, item );
				}
				++index;
			} else {
				var fullKey = len( arguments.root ) ? arguments.root & "[]" : arguments.name & "[]";
				arrayAppend( result, { name = fullKey, value = getValidatedParam( arguments.name, item ) } );
			}
		}

		return result;
	}

	private any function getValidatedParam( required string paramName, required any paramValue, boolean validate = true ) {
		// only simple values
		if ( !isSimpleValue( paramValue ) ) throwError( "'#paramName#' is not a simple value." );

		// if not validation just result trimmed value
		if ( !arguments.validate ) {
			return trim( paramValue );
		}

		// integer
		if ( arrayFindNoCase( variables.integerFields, paramName ) ) {
			if ( !isInteger( paramValue ) ) {
				throwError( "field '#paramName#' requires an integer value" );
			}
			return paramValue;
		}
		// numeric
		if ( arrayFindNoCase( variables.numericFields, paramName ) ) {
			if ( !isNumeric( paramValue ) ) {
				throwError( "field '#paramName#' requires a numeric value" );
			}
			return paramValue;
		}

		// currency
		if ( arrayFindNoCase( variables.currencyFields, paramName ) ) {
			if ( !( isNumeric( paramValue ) && ( variables.convertToCents || isValid( "integer", paramValue ) ) ) ) {
				throwError( "field '#paramName#' requires an numeric/integer value" );
			}
				// added rounding due to possible inaccuracies in multiplication - see https://issues.jboss.org/browse/RAILO-767
			return ( variables.convertToCents ? round( paramValue * 100 ) : paramValue );
		}

		// boolean
		if ( arrayFindNoCase( variables.booleanFields, paramName ) ) {
			return ( paramValue ? "true" : "false" );
		}

		// timestamp
		if ( arrayFindNoCase( variables.timestampFields, paramName ) ) {
			return parseUTCTimestampField( paramValue, paramName );
		}

		// default is string
		return trim( paramValue );
	}

	private any function parseUTCTimestampField( required any utcField, required string utcFieldName ) {
		if ( isInteger( arguments.utcField ) ) return arguments.utcField;
		if ( isDate( arguments.utcField ) ) return getUTCTimestamp( arguments.utcField );
		if ( arguments.utcField == 'now' && arguments.utcFieldName == 'trial_end' ) return 'now';
		throwError( "utc timestamp field '#utcFieldName#' is in an invalid format" );
	}

	private void function parseResult( required struct result ) {
		var resultKeys = structKeyArray( result );
		for ( var key in resultKeys ) {
			if ( structKeyExists( result, key ) && !isNull( result[ key ] ) ) {
				if ( isStruct( result[ key ] ) ) parseResult( result[ key ] );
				if ( isArray( result[ key ] ) ) {
					for ( var item in result[ key ] ) {
						if ( isStruct( item ) ) parseResult( item );
					}
				}
				if ( variables.convertUTCTimestamps && arrayFindNoCase( variables.timestampFields, key ) ) result[ key ] = parseUTCTimestamp( result[ key ] );
				if ( variables.convertToCents && arrayFindNoCase( variables.currencyFields, key ) ) result[ key ] = result[ key ] / 100;
			}
		}
	}

	private string function encodeurl( required string str ) {
		return replacelist( urlEncodedFormat( arguments.str, "utf-8" ), "%2D,%2E,%5F,%7E", "-,.,_,~" );
	}

  private numeric function getUTCTimestamp( required date dateToConvert ) {
	  return dateDiff( "s", variables.utcBaseDate, dateToConvert );
  }

	private date function parseUTCTimestamp( required numeric utcTimestamp ) {
	  var parsed_date = dateAdd( "s", arguments.utcTimestamp, variables.utcBaseDate );
	  return parsed_date;
	}

	private boolean function isInteger( required any varToValidate ) {
		return ( isNumeric( arguments.varToValidate ) && isValid( "integer", arguments.varToValidate ) );
	}

	private void function throwError( required string errorMessage ) {
		throw( type = "Stripe", message = "(stripe.cfc) " & arguments.errorMessage );
	}

}