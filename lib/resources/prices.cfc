component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    active: 'boolean',
                    currency: 'iso_currency_code',
                    custom_unit_amount: {
                        enabled: 'boolean',
                        maximum: 'currency',
                        minimum: 'currency',
                        preset: 'currency'
                    },
                    product_data: {
                        active: 'boolean'
                    },
                    tiers: {
                        flat_amount: 'currency',
                        unit_amount: 'currency'
                    },
                    transfer_lookup_key: 'boolean',
                    unit_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/prices'
            },
            'list': {
                arguments: {
                    active: 'boolean',
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
                arguments: {
                    active: 'boolean',
                    transfer_lookup_key: 'boolean'
                },
                httpMethod: 'post',
                path: '/prices/{price_id}'
            }
        }
    };

}
