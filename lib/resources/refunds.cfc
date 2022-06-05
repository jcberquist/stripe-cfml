component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/refunds/{refund_id}/cancel'
            },
            'create': {
                arguments: {
                    amount: 'currency'
                },
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
