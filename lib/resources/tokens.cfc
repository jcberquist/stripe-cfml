component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    account: {
                        company: {
                            ownership_declaration: {
                                date: 'timestamp'
                            }
                        }
                    }
                },
                httpMethod: 'post',
                path: '/tokens'
            },
            'retrieve': {
                path: '/tokens/{token_id}'
            }
        }
    };

}
