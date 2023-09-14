component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    fixed_amount: {
                        amount: 'currency',
                        currency: 'iso_currency_code'
                    }
                },
                httpMethod: 'post',
                path: '/shipping_rates'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/shipping_rates'
            },
            'retrieve': {
                path: '/shipping_rates/{shipping_rate_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/shipping_rates/{shipping_rate_id}'
            }
        }
    };

}
