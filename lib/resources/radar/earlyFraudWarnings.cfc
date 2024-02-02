component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/radar/early_fraud_warnings'
            },
            'retrieve': {
                path: '/radar/early_fraud_warnings/{early_fraud_warning_id}'
            }
        }
    };

}
