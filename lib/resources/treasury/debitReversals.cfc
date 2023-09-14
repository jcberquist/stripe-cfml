component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/treasury/debit_reversals'
            },
            'list': {
                path: '/treasury/debit_reversals'
            },
            'retrieve': {
                path: '/treasury/debit_reversals/{debit_reversal_id}'
            }
        }
    };

}
