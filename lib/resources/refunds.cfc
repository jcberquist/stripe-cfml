component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/refunds/{refund_id}/cancel'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    refund_application_fee: 'boolean',
                    reverse_transfer: 'boolean'
                },
                httpMethod: 'post',
                path: '/refunds'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
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
