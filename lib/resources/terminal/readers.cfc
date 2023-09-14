component {

    this.metadata = {
        methods: {
            'cancelAction': {
                httpMethod: 'post',
                path: '/terminal/readers/{reader_id}/cancel_action'
            },
            'create': {
                httpMethod: 'post',
                path: '/terminal/readers'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/terminal/readers/{reader_id}'
            },
            'list': {
                path: '/terminal/readers'
            },
            'processPaymentIntent': {
                arguments: {
                    process_config: {
                        skip_tipping: 'boolean',
                        tipping: {
                            amount_eligible: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/terminal/readers/{reader_id}/process_payment_intent'
            },
            'processSetupIntent': {
                arguments: {
                    customer_consent_collected: 'boolean'
                },
                httpMethod: 'post',
                path: '/terminal/readers/{reader_id}/process_setup_intent'
            },
            'refundPayment': {
                arguments: {
                    amount: 'currency',
                    refund_application_fee: 'boolean',
                    reverse_transfer: 'boolean'
                },
                httpMethod: 'post',
                path: '/terminal/readers/{reader_id}/refund_payment'
            },
            'retrieve': {
                path: '/terminal/readers/{reader_id}'
            },
            'setReaderDisplay': {
                arguments: {
                    cart: {
                        currency: 'iso_currency_code',
                        line_items: {
                            amount: 'currency'
                        },
                        tax: 'currency',
                        total: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/terminal/readers/{reader_id}/set_reader_display'
            },
            'update': {
                httpMethod: 'post',
                path: '/terminal/readers/{reader_id}'
            }
        }
    };

}
