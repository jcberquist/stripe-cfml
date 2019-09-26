component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/cancel'
            },
            'capture': {
                arguments: {
                    amount_to_capture: 'currency',
                    application_fee_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/capture'
            },
            'confirm': {
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/confirm'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    currency: 'iso_currency_code',
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/payment_intents'
            },
            'retrieve': {
                path: '/payment_intents/{payment_intent_id}'
            },
            'update': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}'
            }
        }
    };

}
