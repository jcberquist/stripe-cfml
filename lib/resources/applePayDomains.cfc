component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/apple_pay/domains'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/apple_pay/domains/{domain_id}'
            },
            'list': {
                path: '/apple_pay/domains'
            },
            'retrieve': {
                path: '/apple_pay/domains/{domain_id}'
            }
        }
    };

}
