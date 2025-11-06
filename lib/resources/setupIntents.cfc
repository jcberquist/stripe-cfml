/**
* https://docs.stripe.com/api/setup_intents
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/setup_intents/cancel
            */
            'cancel': {
                arguments: {
                    cancellation_reason: 'string' // enum: abandoned, requested_by_customer, duplicate
                },
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/cancel'
            },
            /**
            * https://docs.stripe.com/api/setup_intents/confirm
            */
            'confirm': {
                arguments: {
                    confirmation_token: 'string',
                    mandate_data: 'struct',
                    payment_method: 'string',
                    payment_method_data: 'struct',
                    payment_method_options: 'struct',
                    return_url: 'string',
                    use_stripe_sdk: 'boolean'
                },
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/confirm'
            },
            /**
            * https://docs.stripe.com/api/setup_intents/create
            */
            'create': {
                arguments: {
                    attach_to_self: 'boolean',
                    automatic_payment_methods: {
                        enabled: 'boolean'
                    },
                    confirm: 'boolean',
                    customer: 'string',
                    description: 'string',
                    flow_directions: 'array', // enum: inbound, outbound
                    mandate_data: 'struct',
                    metadata: 'struct',
                    on_behalf_of: 'string',
                    payment_method: 'string',
                    payment_method_data: 'struct',
                    payment_method_options: 'struct',
                    payment_method_types: 'array',
                    return_url: 'string',
                    single_use: {
                        amount: 'currency',
                        currency: 'iso_currency_code'
                    },
                    usage: 'string', // enum: off_session, on_session
                    use_stripe_sdk: 'boolean'
                },
                httpMethod: 'post',
                path: '/setup_intents'
            },
            /**
            * https://docs.stripe.com/api/setup_intents/list
            */
            'list': {
                arguments: {
                    attach_to_self: 'boolean',
                    created: 'datefilter',
                    customer: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    payment_method: 'string',
                    starting_after: 'string'
                },
                path: '/setup_intents'
            },
            /**
            * https://docs.stripe.com/api/setup_intents/retrieve
            */
            'retrieve': {
                arguments: {
                    client_secret: 'string'
                },
                path: '/setup_intents/{setup_intent_id}'
            },
            /**
            * https://docs.stripe.com/api/setup_intents/update
            */
            'update': {
                arguments: {
                    attach_to_self: 'boolean',
                    customer: 'string',
                    description: 'string',
                    flow_directions: 'array', // enum: inbound, outbound
                    metadata: 'struct',
                    payment_method: 'string',
                    payment_method_data: 'struct',
                    payment_method_options: 'struct',
                    payment_method_types: 'array'
                },
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}'
            },
            /**
            * https://docs.stripe.com/api/setup_intents/verify_microdeposits
            */
            'verifyMicrodeposits': {
                arguments: {
                    amounts: 'array',
                    descriptor_code: 'string'
                },
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/verify_microdeposits'
            }
        }
    };

}
