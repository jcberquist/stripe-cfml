component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'create': {
                arguments: {
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
                    price: 'currency'
                },
                httpMethod: 'post',
                path: '/skus/{sku_id}'
            }
        }
    };

}
