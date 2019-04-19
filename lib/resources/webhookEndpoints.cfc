component {

    this.metadata = {
        methods: {
            'create': {
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
                httpMethod: 'post',
                path: '/webhook_endpoints/{webhook_endpoint_id}'
            }
        }
    };

}
