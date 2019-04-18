component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/topups/{topup_id}/cancel'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/topups'
            },
            'list': {
                arguments: {
                    amount: 'currencyfilter',
                    created: 'datefilter'
                },
                path: '/topups'
            },
            'retrieve': {
                path: '/topups/{topup_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/topups/{topup_id}'
            }
        }
    };

}
