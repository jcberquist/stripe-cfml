component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/issuing/transactions'
            },
            'retrieve': {
                path: '/issuing/transactions/{transaction_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/issuing/transactions/{transaction_id}'
            }
        }
    };

}
