component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    active: 'boolean',
                    default_price_data: {
                        currency: 'iso_currency_code',
                        unit_amount: 'currency'
                    },
                    shippable: 'boolean'
                },
                httpMethod: 'post',
                path: '/products'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/products/{product_id}'
            },
            'list': {
                arguments: {
                    active: 'boolean',
                    created: 'datefilter',
                    shippable: 'boolean'
                },
                path: '/products'
            },
            'retrieve': {
                path: '/products/{product_id}'
            },
            'search': {
                path: '/products/search'
            },
            'update': {
                arguments: {
                    active: 'boolean',
                    shippable: 'boolean'
                },
                httpMethod: 'post',
                path: '/products/{product_id}'
            }
        }
    };

}
