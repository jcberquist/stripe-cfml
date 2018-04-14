component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/refunds'
            },
            'list': {
                path: '/refunds'
            },
            'retrieve': {
                path: '/refunds/{refund_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/refunds/{refund_id}'
            }
        }
    };

}
