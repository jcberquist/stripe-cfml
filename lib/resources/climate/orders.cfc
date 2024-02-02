component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/climate/orders/{order_id}/cancel'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/climate/orders'
            },
            'list': {
                path: '/climate/orders'
            },
            'retrieve': {
                path: '/climate/orders/{order_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/climate/orders/{order_id}'
            }
        }
    };

}
