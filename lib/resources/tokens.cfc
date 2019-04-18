component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/tokens'
            },
            'retrieve': {
                path: '/tokens/{token_id}'
            }
        }
    };

}
