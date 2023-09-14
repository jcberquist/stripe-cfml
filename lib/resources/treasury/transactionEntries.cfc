component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter',
                    effective_at: 'datefilter'
                },
                path: '/treasury/transaction_entries'
            },
            'retrieve': {
                path: '/treasury/transaction_entries/{transaction_entry_id}'
            }
        }
    };

}
