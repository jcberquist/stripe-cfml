component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/treasury/credit_reversals'
            },
            'list': {
                path: '/treasury/credit_reversals'
            },
            'retrieve': {
                path: '/treasury/credit_reversals/{credit_reversal_id}'
            }
        }
    };

}
