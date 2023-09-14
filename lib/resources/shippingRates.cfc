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
                    active: 'boolean',
                    created: 'datefilter'
                },
                path: '/shipping_rates'
            },
            'retrieve': {
                path: '/shipping_rates/{shipping_rate_id}'
            },
            'update': {
                arguments: {
                    active: 'boolean'
                },
                httpMethod: 'post',
                path: '/shipping_rates/{shipping_rate_id}'
            }
        }
    };

}
