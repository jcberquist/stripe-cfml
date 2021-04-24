component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/billing_portal/configurations'
            },
            'list': {
                path: '/billing_portal/configurations'
            },
            'retrieve': {
                path: '/billing_portal/configurations/{configuration_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/billing_portal/configurations/{configuration_id}'
            }
        }
    };

}
