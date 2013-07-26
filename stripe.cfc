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

	variables.integerFields = [ "quantity","count","offset","interval_count","trial_period_days","duration_in_months","max_redemptions", "percent_off","exp_month","exp_year","cvc" ];
	variables.currencyFields = [ "amount","amount_refunded","amount_off","account_balance","fee","application_fee","net" ];
	variables.timestampFields = [ "created","trial_start","trial_end","redeem_by","start","end","ended_at","period_start","period_end","date","next_payment_attempt","available_on","current_period_start","current_period_end","canceled_at","gt","gte","lt","lte" ];
	variables.booleanFields = [ "capture","closed","prorate","at_period_end" ];
	variables.arrayFields = [ "expand" ];
	variables.dictionaryFields = {
		card = { required = [ "number","exp_month","exp_year" ], optional = [ "cvc","name","address_line1","address_line2","address_city","address_zip","address_state","address_country" ] },
		bank_account = { required = [ "country","routing_number","account_number" ], optional = [ ] },
		available_on = { required = [ ],	optional = [ "gt","gte","lt","lte" ] },
		created = { required = [ ],	optional = [ "gt","gte","lt","lte" ] },
		date = { required = [ ], optional = [ "gt","gte","lt","lte" ]	}
	};

	public any function init( required string stripeSecretKey, boolean convertUTCTimestamps = true, boolean convertToCents = false, string defaultCurrency = "usd", boolean includeRaw = false, string apiBaseUrl = "https://api.stripe.com/v1/" ) {
		structAppend( variables, arguments );
		return this;
	}

	// Charges

	public struct function createCharge( required numeric amount, string currency = variables.defaultCurrency, string customer, any card, string description, boolean capture, numeric application_fee ) {
		return apiCall( "charges", setupParams( arguments ), "post" );
	}

	public struct function getCharge( required string id )	{
		return apiCall( "charges/#trim( arguments.id )#" );
	}

	public struct function refundCharge( required string id, numeric amount ) {
		return apiCall( "charges/#trim( arguments.id )#/refund", setupParams( arguments ), "post" );
	}

	public struct function captureCharge( required string id, numeric amount, numeric application_fee ) {
		return apiCall( "charges/#trim( arguments.id )#/capture", setupParams( arguments ), "post" );
	}

	public struct function listCharges( numeric count, any created, numeric offset, string customer ) {
		return apiCall( "charges", setupParams( arguments ) );
	}

	public struct function updateChargeDispute( required string id, string evidence ) {
		return apiCall( "charges/#trim( arguments.id )#/dispute", setupParams( arguments ), "post" );
	}

	// Customers

	public struct function createCustomer( any card, string email, string description, string coupon, numeric account_balance, string plan, any trial_end, numeric quantity ) {
		return apiCall( "customers", setupParams( arguments ), "post" );
	}

	public struct function getCustomer( required string id ) {
		return apiCall( "customers/#trim( arguments.id )#" );
	}	

	public struct function updateCustomer( required string id, any card, string default_card, string email, string description, string coupon, numeric account_balance ) {
		return apiCall( "customers/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteCustomer( required string id )	{
		return apiCall( path = "customers/#trim( arguments.id )#", method = "delete" );
	}

	public struct function deleteCustomerDiscount( required string id )	{
		return apiCall( path = "customers/#trim( arguments.id )#/discount", method = "delete" );
	}

	public struct function listCustomers( numeric count, any created, numeric offset ) {
		return apiCall( "customers", setupParams( arguments ) );
	}

	public struct function updateCustomerSubscription( required string id, required string plan, string coupon, boolean prorate, any trial_end, any card, numeric quantity ) {
		return apiCall( "customers/#trim( arguments.id )#/subscription", setupParams( arguments ), "post" );
	}

	public struct function cancelCustomerSubscription( required string id, boolean at_period_end ) {
		return apiCall( "customers/#trim( arguments.id )#/subscription", setupParams( arguments ), "delete" );
	}

	// Cards

	public struct function createCustomerCard( required string customer_id, any card ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards", setupParams( arguments ), "post" );
	}

	public struct function updateCustomerCard( required string customer_id, required string id, string address_city, string address_line1, string address_line2, string address_state, string address_zip, numeric exp_month, numeric exp_year, string name ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function getCustomerCard( required string customer_id, required string id ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards/#trim( arguments.id )#" );
	}

	public struct function deleteCustomerCard( required string customer_id, required string id ) {
		return apiCall( path = "customers/#trim( arguments.customer_id )#/cards/#trim( arguments.id )#", method = "delete" );
	}

	public struct function listCustomerCards( required string customer_id, numeric count, numeric offset ) {
		return apiCall( "customers/#trim( arguments.customer_id )#/cards", setupParams( arguments ) );
	}

	// Plans

	public struct function createPlan( required string id, required numeric amount, string currency = variables.defaultCurrency, required string interval, numeric interval_count, required string name, numeric trial_period_days ) {
		return apiCall( "plans", setupParams( arguments, true ), "post" );
	}

	public struct function getPlan( required string id ) {
		return apiCall( "plans/#trim( arguments.id )#" );
	}	

	public struct function updatePlan( required string id, required string name ) {
		return apiCall( "plans/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}	

	public struct function deletePlan( required string id ) {
		return apiCall( path = "plans/#trim( arguments.id )#", method = "delete" );
	}	

	public struct function listPlans( numeric count, numeric offset ) {
		return apiCall( "plans", setupParams( arguments ) );
	}

	// Coupons

	public struct function createCoupon( string id, required string duration, numeric amount_off, string currency = variables.defaultCurrency, numeric duration_in_months, numeric max_redemptions, numeric percent_off, any redeem_by ) {
		// only one of percent_off and amount_off can be provided to the createCoupon function
		if ( !( structKeyExists( arguments, "amount_off" ) xor structKeyExists( arguments, "percent_off" ) ) ) {
			throwError( "createCoupon: please provide one and only one of amount_off and percent_off params" );			
		}
		// duration_in_months is required only when duration equals "repeating"
		if ( arguments.duration == "repeating" xor structKeyExists( arguments, "duration_in_months" ) ) {
			throwError( "createCoupon: duration_in_months is required when and only when duration equals 'repeating'" );			
		}
		return apiCall( "coupons", setupParams( arguments ), "post" );
	}	

	public struct function getCoupon( required string id ) {
		return apiCall( "coupons/#trim( arguments.id )#" );
	}	

	public struct function deleteCoupon( required string id ) {
		return apiCall( path = "coupons/#trim( arguments.id )#", method = "delete" );
	}	

	public struct function listCoupons( numeric count, numeric offset ) {
		return apiCall( "coupons", setupParams( arguments ) );
	}	

	// Invoices

	public struct function createInvoice( required string customer )	{
		return apiCall( "invoices", setupParams( arguments ), "post" );
	}

	public struct function getInvoice( required string id )	{
		return apiCall( "invoices/#trim( arguments.id )#" );
	}

	public struct function getInvoiceLineItems( required string id, numeric count, string customer, numeric offset )	{
		return apiCall( "invoices/#trim( arguments.id )#/lines", setupParams( arguments ) );
	}

	public struct function payInvoice( required string id )	{
		return apiCall( path = "invoices/#trim( arguments.id )#/pay", method = "post" );
	}

	public struct function updateInvoice( required string id, boolean closed )	{
		return apiCall( "invoices/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function listInvoices( numeric count, string customer, any date, numeric offset ) {
		return apiCall( "invoices", setupParams( arguments ) );
	}	

	public struct function getUpcomingInvoice( required string customer ) {
		return apiCall( "invoices/upcoming", setupParams( arguments ) );
	}	

	// Invoice Items

	public struct function createInvoiceItem( required string customer, required numeric amount, string currency = variables.defaultCurrency, string invoice, string description )	{
		return apiCall( "invoiceitems", setupParams( arguments ), "post" );
	}

	public struct function getInvoiceItem( required string id ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#" );
	}	

	public struct function updateInvoiceItem( required string id, numeric amount, string description ) {
		return apiCall( "invoiceitems/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}	

	public struct function deleteInvoiceItem( required string id ) {
		return apiCall( path = "invoiceitems/#trim( arguments.id )#", method = "delete" );
	}	

	public struct function listInvoiceItems( numeric count, any created, string customer, numeric offset ) {
		return apiCall( "invoiceitems", setupParams( arguments ) );
	}

	// Recipients

	public struct function createRecipient( required string name, required string type, string tax_id, any bank_account, string email, string description ) {
		return apiCall( "recipients", setupParams( arguments ), "post" );
	}

	public struct function getRecipient( required string id ) {
		return apiCall( "recipients/#trim( arguments.id )#" );
	}	

	public struct function updateRecipient( required string id, string name, string tax_id, any bank_account, string email, string description ) {
		return apiCall( "recipients/#trim( arguments.id )#", setupParams( arguments ), "post" );
	}

	public struct function deleteRecipient( required string id )	{
		return apiCall( path = "recipients/#trim( arguments.id )#", method = "delete" );
	}

	public struct function listRecipients( numeric count, numeric offset, boolean verified ) {
		return apiCall( "recipients", setupParams( arguments ) );
	}

	// Transfers

	public struct function createTransfer( required numeric amount, string currency = variables.defaultCurrency, required string recipient, string description, string statement_descriptor ) {
		return apiCall( "transfers", setupParams( arguments ), "post" );
	}

	public struct function getTransfer( required string id ) {
		return apiCall( "transfers/#trim( arguments.id )#" );
	}	

	public struct function cancelTransfer( required string id )	{
		return apiCall( path = "transfers/#trim( arguments.id )#/cancel", method = "post" );
	}

	public struct function listTransfers( numeric count, any date, numeric offset, string recipient, string status ) {
		return apiCall( "transfers", setupParams( arguments ) );
	}

	// Events

	public struct function getEvent( required string id ) {
		return apiCall( "events/#trim( arguments.id )#" );
	}	

	public struct function listEvents( numeric count, any created, numeric offset, string type ) {
		return apiCall( "events", setupParams( arguments ) );
	}

	// Tokens
	
	public struct function createCardToken( struct card, string customer ) {
		// only one of a customer or a card (token/struct) can be provided to the createCardToken function
		if ( !( structKeyExists( arguments, "customer" ) xor structKeyExists( arguments, "card" ) ) ) {
			throwError( "createCardToken: please provide one and only one of customer and card params" );			
		}
		return apiCall( "tokens", setupParams( arguments ), "post" );
	}

	public struct function createBankAccountToken( struct bank_account ) {
		return apiCall( "tokens", setupParams( arguments ), "post" );
	}

	public struct function getToken( required string id ) {
		return apiCall( "tokens/#trim( arguments.id )#" );
	}

	// miscellaneous

	public struct function getAccountDetails() {
		return apiCall( "account" );
	}

	public struct function getBalance() {
		return apiCall( "balance" );
	}

	public struct function listBalanceHistory( any available_on, numeric count, any created, numeric offset, string transfer, string type ) {
		return apiCall( "balance/history", setupParams( arguments ) );
	}

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
		var http = new http( url = arguments.urlPath, method = arguments.method, username = variables.stripeSecretKey, password = "" );

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
		for ( var field in variables.dictionaryFields[ type ].required ) {
			if ( !structKeyExists( arguments.dictionary, field ) ) {
				throwError( "'#arguments.type#' dictionary missing required field: #field#" );				
			}
			arrayAppend( result, getValidatedParam( "#arguments.type#[#field#]", arguments.dictionary[ field ] ) );
		}
		for ( var field in variables.dictionaryFields[ type ].optional ) {
			if ( structKeyExists( arguments.dictionary, field ) ) {
				arrayAppend( result, getValidatedParam( "#arguments.type#[#field#]", arguments.dictionary[ field ] ) );
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

	private struct function getValidatedParam( required string paramName, required any paramValue ) {
		// only simple values
		if ( !isSimpleValue( paramValue ) ) throwError( "'#paramName#' is not a simple value." );

		var subKey = getSubKey( paramName );

		// integer
		if ( arrayFindNoCase( variables.integerFields, paramName ) || arrayFindNoCase( variables.integerFields, subKey ) ) {
			if ( !isInteger( paramValue ) ) {
				throwError( "field '#paramName#' requires an integer value" );				
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
	  var utcdate = dateAdd( "s", getTimeZoneInfo().utcTotalOffset, arguments.dateToConvert );
	  return dateDiff( "s", createDate( 1970,1,1 ), utcdate );
  }

	private string function getSubKey( required string key ) {
		var search = reFind( '\[(.*)]', key, 1, true );
		if ( search.len[ 1 ] > 2 ) return mid( key, search.pos[ 2 ], search.len[ 2 ] );
		return '';
	}

	private date function parseUTCTimestamp( required numeric utcTimestamp ) {
	  var utcdate = dateAdd( "s", arguments.utcTimestamp, createDate( 1970,1,1 ) );
	  return dateAdd("s",  getTimeZoneInfo().utcTotalOffset * -1, utcdate );
	}

	private boolean function isInteger( required any varToValidate ) {
		return ( isNumeric( arguments.varToValidate ) && isValid( "integer", arguments.varToValidate ) );
	}

	private void function throwError( required string errorMessage ) {
		throw( type = "Stripe", message = "(stripe.cfc) " & arguments.errorMessage );
	}

}	