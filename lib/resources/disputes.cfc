component {

    this.metadata = {
        methods: {
            'close': {
                httpMethod: 'post',
                path: '/disputes/{dispute_id}/close'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/disputes'
            },
            'retrieve': {
                path: '/disputes/{dispute_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/disputes/{dispute_id}'
            }
        }
    };

}
