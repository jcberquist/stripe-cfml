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
                    amount: 'currency',
                    refund_application_fee: 'boolean'
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
                path: '/transfers/{transfer_id}/reversals'
            },
            'retrieve': {
                path: '/transfers/{transfer_id}'
            },
            'retrieveReversal': {
                path: '/transfers/{transfer_id}/reversals/{reversal_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/transfers/{transfer_id}'
            },
            'updateReversal': {
                httpMethod: 'post',
                path: '/transfers/{transfer_id}/reversals/{reversal_id}'
            }
        }
    };

}
