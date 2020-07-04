component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    currency: 'iso_currency_code',
                    tiers: {
                        flat_amount: 'currency',
                        unit_amount: 'currency'
                    },
                    unit_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/prices'
            },
            'list': {
                arguments: {
                    created: 'datefilter',
                    currency: 'iso_currency_code'
                },
                path: '/prices'
            },
            'retrieve': {
                path: '/prices/{price_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/prices/{price_id}'
            }
        }
    };

}
