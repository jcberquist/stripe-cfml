component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    expires_at: 'timestamp',
                    restrictions: {
                        minimum_amount: 'currency',
                        minimum_amount_currency: 'iso_currency_code'
                    }
                },
                httpMethod: 'post',
                path: '/promotion_codes'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/promotion_codes'
            },
            'retrieve': {
                path: '/promotion_codes/{promotion_code_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/promotion_codes/{promotion_code_id}'
            }
        }
    };

}
