component {

    this.metadata = {
        methods: {
            'attach': {
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}/attach'
            },
            'create': {
                httpMethod: 'post',
                path: '/payment_methods'
            },
            'detach': {
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}/detach'
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
