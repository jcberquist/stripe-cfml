component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/transfers'
            },
            'createReversal': {
                arguments: {
                    amount: 'currency'
                },
                httpMethod: 'post',
                path: '/transfers/{transfer_id}/reversals'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/transfers'
            },
            'listReversals': {
                arguments: {
                    limit: 'integer'
                },
                path: '/transfers/{transfer_id}/reversals'
            },
            'retrieve': {
                path: '/transfers/{transfer_id}'
            },
            'retrieveReversal': {
                path: '/transfers/{transfer_id}/reversals/{transfer_reversal_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/transfers/{transfer_id}'
            },
            'updateReversal': {
                httpMethod: 'post',
                path: '/transfers/{transfer_id}/reversals/{transfer_reversal_id}'
            }
        }
    };

}
