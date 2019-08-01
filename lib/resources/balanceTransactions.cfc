component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    available_on: 'datefilter',
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
