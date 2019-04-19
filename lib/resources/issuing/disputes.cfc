component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency'
                },
                httpMethod: 'post',
                path: '/issuing/disputes'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/issuing/disputes'
            },
            'retrieve': {
                path: '/issuing/disputes/{dispute_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/issuing/disputes/{dispute_id}'
            }
        }
    };

}
