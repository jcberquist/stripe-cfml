component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter',
                    status_transitions: {
                        posted_at: 'datefilter'
                    }
                },
                path: '/treasury/transactions'
            },
            'retrieve': {
                path: '/treasury/transactions/{transaction_id}'
            }
        }
    };

}
