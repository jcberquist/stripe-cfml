component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'create': {
                arguments: {
                    account_balance: 'currency'
                },
                httpMethod: 'post',
                path: '/customers'
            },
            'createSource': {
                arguments: {
                    created: 'datefilter'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/sources'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}'
            },
            'deleteDiscount': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}/discount'
            },
            'deleteSource': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}/sources/{source_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/customers'
            },
            'listSources': {
                path: '/customers/{customer_id}/sources'
            },
            'retrieve': {
                path: '/customers/{customer_id}'
            },
            'retrieveSource': {
                path: '/customers/{customer_id}/sources/{source_id}'
            },
            'update': {
                arguments: {
                    account_balance: 'currency'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}'
            },
            'updateSource': {
                httpMethod: 'post',
                path: '/customers/{customer_id}/sources/{source_id}'
            },
            'verifySource': {
                arguments: {
                    amounts: 'currency'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/sources/{source_id}/verify'
            }
        }
    };

}
