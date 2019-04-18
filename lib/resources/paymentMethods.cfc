component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'attach': {
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}/attach'
            },
            'detach': {
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}/detach'
            },
            'create': {
                httpMethod: 'post',
                path: '/payment_methods'
            },
            'list': {
                path: '/payment_methods'
            },
            'retrieve': {
                path: '/payment_methods/{payment_method_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}'
            }
        }
    };

}
