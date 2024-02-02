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
                        individual: {
                            relationship: {
                                director: 'boolean',
                                executive: 'boolean',
                                owner: 'boolean'
                            }
                        },
                        tos_shown_and_accepted: 'boolean'
                    },
                    person: {
                        additional_tos_acceptances: {
                            account: {
                                date: 'timestamp'
                            }
                        },
                        relationship: {
                            director: 'boolean',
                            executive: 'boolean',
                            legal_guardian: 'boolean',
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
