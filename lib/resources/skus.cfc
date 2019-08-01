component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    currency: 'iso_currency_code',
                    price: 'currency'
                },
                httpMethod: 'post',
                path: '/skus'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/skus/{sku_id}'
            },
            'list': {
                path: '/skus'
            },
            'retrieve': {
                path: '/skus/{sku_id}'
            },
            'update': {
                arguments: {
                    currency: 'iso_currency_code',
                    price: 'currency'
                },
                httpMethod: 'post',
                path: '/skus/{sku_id}'
            }
        }
    };

}
