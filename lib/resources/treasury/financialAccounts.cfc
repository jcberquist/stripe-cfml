component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/treasury/financial_accounts'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/treasury/financial_accounts'
            },
            'retrieve': {
                path: '/treasury/financial_accounts/{financial_account_id}'
            },
            'retrieveFeatures': {
                path: '/treasury/financial_accounts/{financial_account_id}/features'
            },
            'update': {
                httpMethod: 'post',
                path: '/treasury/financial_accounts/{financial_account_id}'
            },
            'updateFeatures': {
                httpMethod: 'post',
                path: '/treasury/financial_accounts/{financial_account_id}/features'
            }
        }
    };

}
