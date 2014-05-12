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
	variables.numericFields = [ "application_fee_percent" ];
	variables.currencyFields = [ "amount","amount_refunded","amount_off","account_balance","fee","application_fee","net" ];
	variables.timestampFields = [ "created","trial_start","trial_end","redeem_by","start","end","ended_at","period_start","period_end","date","next_payment_attempt","available_on","current_period_start","current_period_end","canceled_at","gt","gte","lt","lte" ];
	variables.booleanFields = [ "at_period_end","capture","closed","prorate","refund_application_fee" ];
	variables.arrayFields = [ "expand","include" ];
	variables.dictionaryFields = {
		card = { required = [ "number","exp_month","exp_year" ], optional = [ "cvc","name","address_line1","address_line2","address_city","address_zip","address_state","address_country" ] },
		bank_account = { required = [ "country","routing_number","account_number" ], optional = [ ] },
		available_on = { required = [ ],	optional = [ "gt","gte","lt","lte" ] },
		created = { required = [ ],	optional = [ "gt","gte","lt","lte" ] },
		date = { required = [ ], optional = [ "gt","gte","lt","lte" ]	},
		metadata = { required = [ ], optional = [ ] }
	};

	public any function init( required string apiKey, boolean convertUTCTimestamps = true, boolean convertToCents = false, string defaultCurrency = "usd", boolean includeRaw = false, string apiBaseUrl = "https://api.stripe.com/v1/" ) {
		structAppend( variables, arguments );
		return this;
	}

	// Charges

	public struct function createCharge( required numeric amount, string currency = variables.defaultCurrency, numeric application_fee, boolean capture, string customer, any card, string description, struct metadata, string statement_description ) {
		return apiCall( "charges", setupParams( arguments ), "post" );
	}

	public struct function getCharge( required string id )	{
		return apiCall( "charges/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCharge( required string id, string description, struct metadata )	{
		return apiCall( "charges/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function refundCharge( required string id, numeric amount, boolean refund_application_fee ) {
		return apiCall( "charges/#trim( arguments.id )#/refund", setupParams( arguments ), "post" );
	}

	public struct function captureCharge( required string id, numeric amount, numeric application_fee ) {
		return apiCall( "charges/#trim( arguments.id )#/capture", setupParams( arguments ), "post" );
	}

	public struct function listCharges( any created, string customer, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "charges", setupParams( arguments ) );
	}

	// Customers

	public struct function createCustomer( numeric account_balance, any card, string coupon, string description, string email, struct metadata, string plan, numeric quantity, any trial_end ) {
		return apiCall( "customers", setupParams( arguments ), "post" );
	}

	public struct function getCustomer( required string id ) {
		return apiCall( "customers/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCustomer( required string id, numeric account_balance, any card, string coupon, string default_card, string description, string email, struct metadata ) {
		return apiCall( "customers/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteCustomer( required string id )	{
		return apiCall( "customers/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCustomers( any created, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "customers", setupParams( arguments ) );
	}

	// Subscriptions

	public struct function createCustomerSubscription( required string id, required string plan, numeric application_fee_percent, any card, string coupon, boolean prorate, numeric quantity, any trial_end ) {
		return apiCall( "customers/#trim( arguments.id )#/subscriptions", setupParams( arguments ), "post" );
	}

	public struct function getCustomerSubscription( required string customer_id, required string id ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCustomerSubscription( required string customer_id, required string id, numeric application_fee_percent, any card, string coupon, string plan, boolean prorate, numeric quantity, any trial_end ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function cancelCustomerSubscription( required string customer_id, required string id, boolean at_period_end ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCustomerSubscriptions( required string customer_id, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/subscriptions", setupParams( arguments ) );
	}

	// Cards

	public struct function createCustomerCard( required string customer_id, any card ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards", setupParams( arguments ), "post" );
	}

	public struct function getCustomerCard( required string customer_id, required string id ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateCustomerCard( required string customer_id, required string id, string address_city, string address_country, string address_line1, string address_line2, string address_state, string address_zip, numeric exp_month, numeric exp_year, string name ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteCustomerCard( required string customer_id, required string id ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCustomerCards( required string customer_id, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards", setupParams( arguments ) );
	}

	// Plans

	public struct function createPlan( required string id, required numeric amount, string currency = variables.defaultCurrency, required string interval, required string name, numeric interval_count, struct metadata, string statement_description, numeric trial_period_days ) {
		return apiCall( "plans", setupParams( arguments, true ), "post" );
	}

	public struct function getPlan( required string id ) {
		return apiCall( "plans/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updatePlan( required string id, struct metadata, string name, string statement_description ) {
		return apiCall( "plans/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deletePlan( required string id ) {
		return apiCall( "plans/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listPlans( string ending_before, numeric limit, string starting_after ) {
		return apiCall( "plans", setupParams( arguments ) );
	}

	// Coupons

	public struct function createCoupon( string id, required string duration, numeric amount_off, string currency = variables.defaultCurrency, numeric duration_in_months, numeric max_redemptions, struct metadata, numeric percent_off, any redeem_by ) {
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

	public struct function deleteCoupon( required string id ) {
		return apiCall( "coupons/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listCoupons( string ending_before, numeric limit, string starting_after ) {
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

	public struct function createInvoice( required string customer, numeric application_fee, string description, struct metadata )	{
		return apiCall( "invoices", setupParams( arguments ), "post" );
	}

	public struct function getInvoice( required string id )	{
		return apiCall( "invoices/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function getInvoiceLineItems( required string id, string customer, string ending_before, numeric limit, string starting_after, string subscription )	{
		return apiCall( "invoices/#trim( arguments.id )#/lines", setupParams( arguments ) );
	}

	public struct function payInvoice( required string id )	{
		return apiCall( "invoices/#trim( arguments.id )#/pay", setupParams( arguments ), "post" );
	}

	public struct function updateInvoice( required string id, boolean closed, string description, struct metadata )	{
		return apiCall( "invoices/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listInvoices( string customer, any date, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "invoices", setupParams( arguments ) );
	}

	public struct function getUpcomingInvoice( required string customer, string subscription ) {
		return apiCall( "invoices/upcoming", setupParams( arguments ) );
	}

	// Invoice Items

	public struct function createInvoiceItem( required string customer, required numeric amount, string currency = variables.defaultCurrency, string description, string invoice, struct metadata, string subscription )	{
		return apiCall( "invoiceitems", setupParams( arguments ), "post" );
	}

	public struct function getInvoiceItem( required string id ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateInvoiceItem( required string id, numeric amount, string description, struct metadata ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteInvoiceItem( required string id ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#", setupParams( arguments ), "delete" );
	}

	public struct function listInvoiceItems( any created, string customer, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "invoiceitems", setupParams( arguments ) );
	}

	// Disputes

	public struct function updateChargeDispute( required string id, string evidence ) {
		return apiCall( "charges/#trim( arguments.id )#/dispute", setupParams( arguments ), "post" );
	}

	public struct function closeChargeDispute( required string id ) {
		return apiCall( "charges/#trim( arguments.id )#/dispute/close", setupParams( arguments ), "post" );
	}

	// Transfers

	public struct function createTransfer( required numeric amount, string currency = variables.defaultCurrency, required string recipient, string description, string statement_descriptor, struct metadata ) {
		return apiCall( "transfers", setupParams( arguments ), "post" );
	}

	public struct function getTransfer( required string id ) {
		return apiCall( "transfers/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function updateTransfer( required string id, string description, struct metadata ) {
		return apiCall( "transfers/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function cancelTransfer( required string id )	{
		return apiCall( "transfers/#trim( arguments.id )#/cancel", setupParams( arguments ), "post" );
	}

	public struct function listTransfers( any created, any date, string ending_before, numeric limit, string recipient, string starting_after, string status ) {
		return apiCall( "transfers", setupParams( arguments ) );
	}

	// Recipients

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

	// Application Fees

	public struct function getApplicationFee( required string id ) {
		return apiCall( "application_fees/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function refundApplicationFee( required string id, numeric amount ) {
		return apiCall( "application_fees/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listApplicationFees( string charge, any created, string ending_before, numeric limit, string starting_after ) {
		return apiCall( "application_fees", setupParams( arguments ) );
	}

	// Account

	public struct function getAccountDetails() {
		return apiCall( "account", setupParams( arguments ) );
	}

	// Balance

	public struct function getBalance() {
		return apiCall( "balance", setupParams( arguments ) );
	}

	public struct function getBalanceTransaction( required string id ) {
		return apiCall( "balance/history/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function listBalanceHistory( any available_on, any created, string ending_before, numeric limit, string starting_after, string transfer, string type ) {
		return apiCall( "balance/history", setupParams( arguments ) );
	}

	// Events

	public struct function getEvent( required string id ) {
		return apiCall( "events/#trim( arguments.id )#", setupParams( arguments ) );
	}

	public struct function listEvents( string ending_before, numeric limit, string starting_after, string type ) {
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

	// miscellaneous



	// PRIVATE FUNCTIONS

	private struct function apiCall( required string path, array params = [ ], string method = "get" )	{
		var fullApiPath = variables.apiBaseUrl & arguments.path;
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

		// look for special param 'apiKey' - if it exists it overrides default apiKey
		for ( var param in arguments.params ) {
			if ( param.name == "apiKey" ) {
				http.setUsername( param.value );
				arrayDelete( arguments.params, param );
				break;
			}
		}

		if ( arguments.method == "post" ) { 
			for ( var param in arguments.params ) {
				http.addParam( type = "formfield", name = lcase( param.name ), value = param.value );
			}
		}

		if ( listFind( "get,delete", arguments.method ) ) { 
			var qs = "";
			for ( var param in arguments.params ) {
				qs = listAppend( qs, lcase( param.name ) & "=" & encodeurl( param.value ), "&" );
			}
			http.setUrl( arguments.urlPath & "?" & qs );
		}

		return http.send().getPrefix();
	}
	
	private array function setupParams( required struct params, boolean includeIds = false ) {
		var result = [ ];
		var paramKeys = structKeyArray( arguments.params );
		for ( var paramKey in paramKeys ) {
			if ( structKeyExists( arguments.params, paramKey ) && !isNull( arguments.params[ paramKey ] ) && ( ( paramKey != "id" && right( paramKey, 3 ) != "_id" ) || arguments.includeIds ) ) {
				if ( arrayFindNoCase( structKeyArray( variables.dictionaryFields ), paramKey ) && isStruct( arguments.params[ paramKey ] ) ) {
					for ( var item in setupDictionary( paramKey, arguments.params[ paramKey ] ) ) {
						arrayAppend( result, item );
					}
				} else if ( arrayFindNoCase( variables.arrayFields, paramKey ) && isArray( arguments.params[ paramKey ] ) ) {
					for ( var item in setupArray( paramKey, arguments.params[ paramKey ] ) ) {
						arrayAppend( result, item );
					}
				} else {
					arrayAppend( result, getValidatedParam( paramKey, arguments.params[ paramKey ] ) );
				}
			}
		}
		return result;
	}
	
	private array function setupDictionary( required string type, required struct dictionary ) {
		var result = [ ];
		for ( var field in variables.dictionaryFields[ arguments.type ].required ) {
			if ( !structKeyExists( arguments.dictionary, field ) ) {
				throwError( "'#arguments.type#' dictionary missing required field: #field#" );				
			}
			arrayAppend( result, getValidatedParam( "#arguments.type#[#field#]", arguments.dictionary[ field ] ) );
		}
		for ( var field in variables.dictionaryFields[ arguments.type ].optional ) {
			if ( structKeyExists( arguments.dictionary, field ) ) {
				arrayAppend( result, getValidatedParam( "#arguments.type#[#field#]", arguments.dictionary[ field ] ) );
			}
		}
		// special handling for metadata
		if ( arguments.type == "metadata" ) {
			if ( arrayLen( structKeyArray( arguments.dictionary ) ) > 10 ) throwError( "There can be a maximum of 10 keys in a metadata struct." );
			if ( !structIsEmpty( arguments.dictionary ) ) {
				for ( var field in arguments.dictionary ) {
					arrayAppend( result, getValidatedParam( "metadata[#lcase( field )#]", arguments.dictionary[ field ], false ) );
				}
			} else {
				arrayAppend( result, getValidatedParam( "metadata", "" ) );
			}
		}
		return result;
	}

	private array function setupArray( required string arrayKey, required any arrayVar ) {
		var result = [ ];
		if ( !isArray( arrayVar ) ) arrayVar = [ arrayVar ];
		for ( var field in arrayVar ) {
			arrayAppend( result, getValidatedParam( "#arguments.arrayKey#[]", field ) );
		}
		return result;
	}

	private struct function getValidatedParam( required string paramName, required any paramValue, boolean parseSubKeys = true ) {
		// only simple values
		if ( !isSimpleValue( paramValue ) ) throwError( "'#paramName#' is not a simple value." );

		var subKey = parseSubKeys ? getSubKey( paramName ) : '';

		// integer
		if ( arrayFindNoCase( variables.integerFields, paramName ) || arrayFindNoCase( variables.integerFields, subKey ) ) {
			if ( !isInteger( paramValue ) ) {
				throwError( "field '#paramName#' requires an integer value" );				
			}
			return { "name" = paramName, "value" = paramValue };
		}

		// numeric
		if ( arrayFindNoCase( variables.numericFields, paramName ) || arrayFindNoCase( variables.numericFields, subKey ) ) {
			if ( !isNumeric( paramValue ) ) {
				throwError( "field '#paramName#' requires a numeric value" );				
			}
			return { "name" = paramName, "value" = paramValue };
		}

		// currency
		if ( arrayFindNoCase( variables.currencyFields, paramName ) || arrayFindNoCase( variables.currencyFields, subKey ) ) {
			if ( !( isNumeric( paramValue ) && ( variables.convertToCents || isValid( "integer", paramValue ) ) ) ) {
				throwError( "field '#paramName#' requires an numeric/integer value" );				
			}
 			// added rounding due to possible inaccuracies in multiplication - see https://issues.jboss.org/browse/RAILO-767
			return { "name" = paramName, "value" = ( variables.convertToCents ? round( paramValue * 100 ) : paramValue ) };
		}

		// boolean
		if ( arrayFindNoCase( variables.booleanFields, paramName ) || arrayFindNoCase( variables.booleanFields, subKey ) ) {
			return { "name" = paramName, "value" = ( paramValue ? "true" : "false" ) };
		}

		// timestamp
		if ( arrayFindNoCase( variables.timestampFields, paramName ) || arrayFindNoCase( variables.timestampFields, subKey ) ) {
			return { "name" = paramName, "value" = parseUTCTimestampField( paramValue, paramName ) };
		}

		// default is string
		return { "name" = paramName, "value" = trim( paramValue ) };
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
	  var utcdate =  dateConvert("local2utc", arguments.dateToConvert );
	  return dateDiff( "s", createDate( 1970,1,1 ), utcdate );
  }

	private string function getSubKey( required string key ) {
		var search = reFind( '\[(.*)]', key, 1, true );
		if ( search.len[ 1 ] > 2 ) return mid( key, search.pos[ 2 ], search.len[ 2 ] );
		return '';
	}

	private date function parseUTCTimestamp( required numeric utcTimestamp ) {
	  var utcdate = dateAdd( "s", arguments.utcTimestamp, createDate( 1970,1,1 ) );
	  return dateConvert("utc2local", utcdate );
	}

	private boolean function isInteger( required any varToValidate ) {
		return ( isNumeric( arguments.varToValidate ) && isValid( "integer", arguments.varToValidate ) );
	}

	private void function throwError( required string errorMessage ) {
		throw( type = "Stripe", message = "(stripe.cfc) " & arguments.errorMessage );
	}

}