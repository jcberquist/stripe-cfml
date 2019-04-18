component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/products'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/products/{product_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/products'
            },
            'retrieve': {
                path: '/products/{product_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/products/{product_id}'
            }
        }
    };

}
