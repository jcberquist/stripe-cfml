component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    account_balance: 'currency',
                    balance: 'currency'
                },
                httpMethod: 'post',
                path: '/customers'
            },
            'createBalanceTransaction': {
                arguments: {
                    amount: 'currency'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/balance_transactions'
            },
            'createSource': {
                arguments: {
                    created: 'datefilter'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/sources'
            },
            'createTaxId': {
                httpMethod: 'post',
                path: '/customers/{customer_id}/tax_ids'
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
            'deleteTaxId': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}/tax_ids/{tax_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/customers'
            },
            'listBalanceTransactions': {
                path: '/customers/{customer_id}/balance_transactions'
            },
            'listSources': {
                path: '/customers/{customer_id}/sources'
            },
            'listTaxIds': {
                path: '/customers/{customer_id}/tax_ids'
            },
            'retrieve': {
                path: '/customers/{customer_id}'
            },
            'retrieveBalanceTransaction': {
                path: '/customers/{customer_id}/balance_transactions/{customer_balance_transaction_id}'
            },
            'retrieveSource': {
                path: '/customers/{customer_id}/sources/{source_id}'
            },
            'retrieveTaxId': {
                path: '/customers/{customer_id}/tax_ids/{tax_id}'
            },
            'update': {
                arguments: {
                    account_balance: 'currency',
                    balance: 'currency'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}'
            },
            'updateBalanceTransaction': {
                httpMethod: 'post',
                path: '/customers/{customer_id}/balance_transactions/{customer_balance_transaction_id}'
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
