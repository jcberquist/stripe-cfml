component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/payment_method_domains'
            },
            'list': {
                path: '/payment_method_domains'
            },
            'retrieve': {
                path: '/payment_method_domains/{payment_method_domain_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/payment_method_domains/{payment_method_domain_id}'
            },
            'validate': {
                httpMethod: 'post',
                path: '/payment_method_domains/{payment_method_domain_id}/validate'
            }
        }
    };

}
