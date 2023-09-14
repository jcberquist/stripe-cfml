component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    connect: 'boolean'
                },
                httpMethod: 'post',
                path: '/webhook_endpoints'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/webhook_endpoints/{webhook_endpoint_id}'
            },
            'list': {
                path: '/webhook_endpoints'
            },
            'retrieve': {
                path: '/webhook_endpoints/{webhook_endpoint_id}'
            },
            'update': {
                arguments: {
                    disabled: 'boolean'
                },
                httpMethod: 'post',
                path: '/webhook_endpoints/{webhook_endpoint_id}'
            }
        }
    };

}
