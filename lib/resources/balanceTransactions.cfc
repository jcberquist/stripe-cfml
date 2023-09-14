component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/balance_transactions'
            },
            'retrieve': {
                path: '/balance_transactions/{balance_transaction_id}'
            }
        }
    };

}
