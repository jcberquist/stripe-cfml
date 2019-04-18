component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
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
                    created: 'datefilter'
                },
                path: '/plans'
            },
            'retrieve': {
                path: '/plans/{plan_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/plans/{plan_id}'
            }
        }
    };

}
