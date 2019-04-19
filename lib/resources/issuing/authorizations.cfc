component {

    this.metadata = {
        methods: {
            'approve': {
                arguments: {
                    held_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/issuing/authorizations/{authorization_id}/approve'
            },
            'decline': {
                httpMethod: 'post',
                path: '/issuing/authorizations/{authorization_id}/decline'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/issuing/authorizations'
            },
            'retrieve': {
                path: '/issuing/authorizations/{authorization_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/issuing/authorizations/{authorization_id}'
            }
        }
    };

}
