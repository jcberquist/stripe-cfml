component {

    this.metadata = {
        methods: {
            'capture': {
                arguments: {
                    amount: 'currency',
                    application_fee: 'currency',
                    application_fee_amount: 'currency',
                    destination: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/charges/{charge_id}/capture'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    application_fee: 'currency',
                    application_fee_amount: 'currency',
                    currency: 'iso_currency_code',
                    destination: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/charges'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/charges'
            },
            'retrieve': {
                path: '/charges/{charge_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/charges/{charge_id}'
            }
        }
    };

}
