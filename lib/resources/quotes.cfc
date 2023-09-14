component {

    this.metadata = {
        methods: {
            'accept': {
                httpMethod: 'post',
                path: '/quotes/{quote_id}/accept'
            },
            'cancel': {
                httpMethod: 'post',
                path: '/quotes/{quote_id}/cancel'
            },
            'create': {
                arguments: {
                    application_fee_amount: 'currency',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    expires_at: 'timestamp',
                    from_quote: {
                        is_revision: 'boolean'
                    },
                    line_items: {
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    subscription_data: {
                        effective_date: 'timestamp'
                    },
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/quotes'
            },
            'finalizeQuote': {
                arguments: {
                    expires_at: 'timestamp'
                },
                httpMethod: 'post',
                path: '/quotes/{quote_id}/finalize'
            },
            'list': {
                path: '/quotes'
            },
            'listComputedUpfrontLineItems': {
                path: '/quotes/{quote_id}/computed_upfront_line_items'
            },
            'listLineItems': {
                path: '/quotes/{quote_id}/line_items'
            },
            'pdf': {
                endpoint: 'files.stripe.com/v1',
                httpMethod: 'delete',
                path: '/quotes/{quote_id}/pdf'
            },
            'retrieve': {
                path: '/quotes/{quote_id}'
            },
            'update': {
                arguments: {
                    application_fee_amount: 'currency',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    expires_at: 'timestamp',
                    line_items: {
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    subscription_data: {
                        effective_date: 'timestamp'
                    },
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/quotes/{quote_id}'
            }
        }
    };

}
