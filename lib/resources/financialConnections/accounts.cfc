component {

    this.metadata = {
        methods: {
            'disconnect': {
                httpMethod: 'post',
                path: '/financial_connections/accounts/{account_id}/disconnect'
            },
            'list': {
                path: '/financial_connections/accounts'
            },
            'listOwners': {
                path: '/financial_connections/accounts/{account_id}/owners'
            },
            'refresh': {
                httpMethod: 'post',
                path: '/financial_connections/accounts/{account_id}/refresh'
            },
            'retrieve': {
                path: '/financial_connections/accounts/{account_id}'
            },
            'subscribe': {
                httpMethod: 'post',
                path: '/financial_connections/accounts/{account_id}/subscribe'
            },
            'unsubscribe': {
                httpMethod: 'post',
                path: '/financial_connections/accounts/{account_id}/unsubscribe'
            }
        }
    };

}
