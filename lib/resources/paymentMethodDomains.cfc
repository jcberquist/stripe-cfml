component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    enabled: 'boolean'
                },
                httpMethod: 'post',
                path: '/payment_method_domains'
            },
            'list': {
                arguments: {
                    enabled: 'boolean'
                },
                path: '/payment_method_domains'
            },
            'retrieve': {
                path: '/payment_method_domains/{payment_method_domain_id}'
            },
            'update': {
                arguments: {
                    enabled: 'boolean'
                },
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
