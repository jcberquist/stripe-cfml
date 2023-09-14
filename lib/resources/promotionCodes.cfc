component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    active: 'boolean',
                    expires_at: 'timestamp',
                    restrictions: {
                        first_time_transaction: 'boolean',
                        minimum_amount: 'currency',
                        minimum_amount_currency: 'iso_currency_code'
                    }
                },
                httpMethod: 'post',
                path: '/promotion_codes'
            },
            'list': {
                arguments: {
                    active: 'boolean',
                    created: 'datefilter'
                },
                path: '/promotion_codes'
            },
            'retrieve': {
                path: '/promotion_codes/{promotion_code_id}'
            },
            'update': {
                arguments: {
                    active: 'boolean'
                },
                httpMethod: 'post',
                path: '/promotion_codes/{promotion_code_id}'
            }
        }
    };

}
