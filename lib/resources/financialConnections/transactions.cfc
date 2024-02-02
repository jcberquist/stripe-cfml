component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    transacted_at: 'datefilter'
                },
                path: '/financial_connections/transactions'
            },
            'retrieve': {
                path: '/financial_connections/transactions/{transaction_id}'
            }
        }
    };

}
