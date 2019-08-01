component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/tax_rates'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/tax_rates'
            },
            'retrieve': {
                path: '/tax_rates/{tax_rate_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/tax_rates/{tax_rate_id}'
            }
        }
    };

}
