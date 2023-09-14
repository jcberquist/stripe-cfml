component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    active: 'boolean',
                    inclusive: 'boolean'
                },
                httpMethod: 'post',
                path: '/tax_rates'
            },
            'list': {
                arguments: {
                    active: 'boolean',
                    created: 'datefilter',
                    inclusive: 'boolean'
                },
                path: '/tax_rates'
            },
            'retrieve': {
                path: '/tax_rates/{tax_rate_id}'
            },
            'update': {
                arguments: {
                    active: 'boolean'
                },
                httpMethod: 'post',
                path: '/tax_rates/{tax_rate_id}'
            }
        }
    };

}
