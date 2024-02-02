component {

    this.metadata = {
        methods: {
            'capture': {
                arguments: {
                    capture_amount: 'currency',
                    close_authorization: 'boolean',
                    purchase_details: {
                        flight: {
                            departure_at: 'timestamp',
                            refundable: 'boolean',
                            segments: {
                                stopover_allowed: 'boolean'
                            }
                        },
                        lodging: {
                            check_in_at: 'timestamp'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/test_helpers/issuing/authorizations/{authorization_id}/capture'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    amount_details: {
                        cashback_amount: 'currency'
                    },
                    currency: 'iso_currency_code',
                    is_amount_controllable: 'boolean'
                },
                httpMethod: 'post',
                path: '/test_helpers/issuing/authorizations'
            },
            'expire': {
                httpMethod: 'post',
                path: '/test_helpers/issuing/authorizations/{authorization_id}/expire'
            },
            'increment': {
                arguments: {
                    increment_amount: 'currency',
                    is_amount_controllable: 'boolean'
                },
                httpMethod: 'post',
                path: '/test_helpers/issuing/authorizations/{authorization_id}/increment'
            },
            'reverse': {
                arguments: {
                    reverse_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/test_helpers/issuing/authorizations/{authorization_id}/reverse'
            }
        }
    };

}
