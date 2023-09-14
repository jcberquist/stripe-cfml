component {

    this.metadata = {
        methods: {
            'capture': {
                arguments: {
                    amount: 'currency',
                    application_fee: 'currency',
                    application_fee_amount: 'currency',
                    transfer_data: {
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
                    capture: 'boolean',
                    currency: 'iso_currency_code',
                    destination: {
                        amount: 'currency'
                    },
                    transfer_data: {
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
            'search': {
                path: '/charges/search'
            },
            'update': {
                httpMethod: 'post',
                path: '/charges/{charge_id}'
            }
        }
    };

}
