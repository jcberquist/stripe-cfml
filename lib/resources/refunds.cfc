component {

    this.metadata = {
        methods: {
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
