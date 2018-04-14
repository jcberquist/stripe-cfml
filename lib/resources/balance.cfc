component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'listTransactions': {
                arguments: {
                    available_on: 'datefilter',
                    created: 'datefilter'
                },
                path: '/balance/history'
            },
            'retrieve': {
                path: '/balance'
            },
            'retrieveTransaction': {
                path: '/balance/history/{balance_transaction_id}'
            }
        }
    };

}
