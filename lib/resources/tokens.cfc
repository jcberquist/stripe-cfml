component extends="abstract.apiResource" {

    variables.metadata = {
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
