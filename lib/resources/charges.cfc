/**
* https://docs.stripe.com/api/charges
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/charges/capture
            */
            'capture': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    receipt_email: 'string',
                    statement_descriptor: 'string',
                    statement_descriptor_suffix: 'string',
                    transfer_data: {
                        amount: 'currency'
                    },
                    transfer_group: 'string'
                },
                httpMethod: 'post',
                path: '/charges/{charge_id}/capture'
            },
            /**
            * https://docs.stripe.com/api/charges/create
            */
            'create': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    capture: 'boolean',
                    currency: 'iso_currency_code',
                    customer: 'string',
                    description: 'string',
                    metadata: 'struct',
                    on_behalf_of: 'string',
                    radar_options: {
                        session: 'string'
                    },
                    receipt_email: 'string',
                    shipping: {
                        address: {
                            city: 'string',
                            country: 'string',
                            line1: 'string',
                            line2: 'string',
                            postal_code: 'string',
                            state: 'string'
                        },
                        carrier: 'string',
                        name: 'string',
                        phone: 'string',
                        tracking_number: 'string'
                    },
                    source: 'string',
                    statement_descriptor: 'string',
                    statement_descriptor_suffix: 'string',
                    transfer_data: {
                        amount: 'currency',
                        destination: 'string'
                    },
                    transfer_group: 'string'
                },
                httpMethod: 'post',
                path: '/charges'
            },
            /**
            * https://docs.stripe.com/api/charges/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    customer: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    payment_intent: 'string',
                    starting_after: 'string',
                    transfer_group: 'string'
                },
                path: '/charges'
            },
            /**
            * https://docs.stripe.com/api/charges/retrieve
            */
            'retrieve': {
                path: '/charges/{charge_id}'
            },
            /**
            * https://docs.stripe.com/api/charges/search
            */
            'search': {
                arguments: {
                    query: 'string',
                    limit: 'numeric',
                    page: 'string'
                },
                path: '/charges/search'
            },
            /**
            * https://docs.stripe.com/api/charges/update
            */
            'update': {
                arguments: {
                    customer: 'string',
                    description: 'string',
                    fraud_details: {
                        user_report: 'string' // enum: safe, fraudulent
                    },
                    metadata: 'struct',
                    receipt_email: 'string',
                    shipping: {
                        address: {
                            city: 'string',
                            country: 'string',
                            line1: 'string',
                            line2: 'string',
                            postal_code: 'string',
                            state: 'string'
                        },
                        carrier: 'string',
                        name: 'string',
                        phone: 'string',
                        tracking_number: 'string'
                    },
                    transfer_group: 'string'
                },
                httpMethod: 'post',
                path: '/charges/{charge_id}'
            }
        }
    };

}
