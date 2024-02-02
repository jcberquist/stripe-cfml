component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/payment_method_configurations'
            },
            'list': {
                path: '/payment_method_configurations'
            },
            'retrieve': {
                path: '/payment_method_configurations/{payment_method_configuration_id}'
            },
            'update': {
                arguments: {
                    active: 'boolean'
                },
                httpMethod: 'post',
                path: '/payment_method_configurations/{payment_method_configuration_id}'
            }
        }
    };

}
