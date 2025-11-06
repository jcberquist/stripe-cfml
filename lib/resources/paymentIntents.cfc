/**
* https://docs.stripe.com/api/payment_intents
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/payment_intents/apply_customer_balance
            */
            'applyCustomerBalance': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/apply_customer_balance'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/cancel
            */
            'cancel': {
                arguments: {
                    cancellation_reason: 'string' // enum: duplicate, fraudulent, requested_by_customer, abandoned
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/cancel'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/capture
            */
            'capture': {
                arguments: {
                    amount_to_capture: 'currency',
                    application_fee_amount: 'currency',
                    final_capture: 'boolean',
                    metadata: 'struct',
                    statement_descriptor: 'string',
                    statement_descriptor_suffix: 'string',
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/capture'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/confirm
            */
            'confirm': {
                arguments: {
                    capture_method: 'string', // enum: automatic, automatic_async, manual
                    client_secret: 'string',
                    confirmation_token: 'string',
                    error_on_requires_action: 'boolean',
                    mandate: 'string',
                    mandate_data: 'struct',
                    off_session: 'boolean',
                    payment_method: 'string',
                    payment_method_data: 'struct',
                    payment_method_options: 'struct',
                    payment_method_types: 'array',
                    radar_options: 'struct',
                    return_url: 'string',
                    setup_future_usage: 'string', // enum: on_session, off_session
                    shipping: 'struct',
                    use_stripe_sdk: 'boolean'
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/confirm'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/create
            */
            'create': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    automatic_payment_methods: {
                        allow_redirects: 'string', // enum: always, never
                        enabled: 'boolean'
                    },
                    capture_method: 'string', // enum: automatic, automatic_async, manual
                    confirm: 'boolean',
                    currency: 'iso_currency_code',
                    customer: 'string',
                    description: 'string',
                    error_on_requires_action: 'boolean',
                    mandate: 'string',
                    mandate_data: 'struct',
                    metadata: 'struct',
                    off_session: 'boolean',
                    on_behalf_of: 'string',
                    payment_method: 'string',
                    payment_method_configuration: 'string',
                    payment_method_data: 'struct',
                    payment_method_options: 'struct',
                    payment_method_types: 'array',
                    radar_options: 'struct',
                    receipt_email: 'string',
                    return_url: 'string',
                    setup_future_usage: 'string', // enum: on_session, off_session
                    shipping: 'struct',
                    statement_descriptor: 'string',
                    statement_descriptor_suffix: 'string',
                    transfer_data: {
                        amount: 'currency',
                        destination: 'string'
                    },
                    transfer_group: 'string',
                    use_stripe_sdk: 'boolean'
                },
                httpMethod: 'post',
                path: '/payment_intents'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/increment_authorization
            */
            'incrementAuthorization': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    description: 'string',
                    metadata: 'struct',
                    statement_descriptor: 'string',
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/increment_authorization'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    customer: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/payment_intents'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/retrieve
            */
            'retrieve': {
                arguments: {
                    client_secret: 'string'
                },
                path: '/payment_intents/{payment_intent_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/search
            */
            'search': {
                arguments: {
                    query: 'string',
                    limit: 'numeric',
                    page: 'string'
                },
                path: '/payment_intents/search'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/update
            */
            'update': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    currency: 'iso_currency_code',
                    customer: 'string',
                    description: 'string',
                    metadata: 'struct',
                    payment_method: 'string',
                    payment_method_configuration: 'string',
                    payment_method_data: 'struct',
                    payment_method_options: 'struct',
                    payment_method_types: 'array',
                    receipt_email: 'string',
                    setup_future_usage: 'string', // enum: on_session, off_session
                    shipping: 'struct',
                    statement_descriptor: 'string',
                    statement_descriptor_suffix: 'string',
                    transfer_data: {
                        amount: 'currency',
                        destination: 'string'
                    },
                    transfer_group: 'string'
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_intents/verify_microdeposits
            */
            'verifyMicrodeposits': {
                arguments: {
                    amounts: 'array',
                    descriptor_code: 'string'
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/verify_microdeposits'
            }
        }
    };

}
