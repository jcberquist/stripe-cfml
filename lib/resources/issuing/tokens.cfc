component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/issuing/tokens'
            },
            'retrieve': {
                path: '/issuing/tokens/{token_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/issuing/tokens/{token_id}'
            }
        }
    };

}
