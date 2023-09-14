component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    account: {
                        company: {
                            directors_provided: 'boolean',
                            executives_provided: 'boolean',
                            owners_provided: 'boolean',
                            ownership_declaration: {
                                date: 'timestamp'
                            },
                            ownership_declaration_shown_and_signed: 'boolean'
                        },
                        tos_shown_and_accepted: 'boolean'
                    },
                    person: {
                        relationship: {
                            director: 'boolean',
                            executive: 'boolean',
                            owner: 'boolean',
                            representative: 'boolean'
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
