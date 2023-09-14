component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    currency: 'iso_currency_code',
                    custom_unit_amount: {
                        maximum: 'currency',
                        minimum: 'currency',
                        preset: 'currency'
                    },
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
                    created: 'datefilter'
                },
                path: '/prices'
            },
            'retrieve': {
                path: '/prices/{price_id}'
            },
            'search': {
                path: '/prices/search'
            },
            'update': {
                httpMethod: 'post',
                path: '/prices/{price_id}'
            }
        }
    };

}
