component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    active: 'boolean',
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    product: {
                        active: 'boolean'
                    },
                    tiers: {
                        flat_amount: 'currency',
                        unit_amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/plans'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/plans/{plan_id}'
            },
            'list': {
                arguments: {
                    active: 'boolean',
                    created: 'datefilter'
                },
                path: '/plans'
            },
            'retrieve': {
                path: '/plans/{plan_id}'
            },
            'update': {
                arguments: {
                    active: 'boolean'
                },
                httpMethod: 'post',
                path: '/plans/{plan_id}'
            }
        }
    };

}
