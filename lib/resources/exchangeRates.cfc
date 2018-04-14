component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'list': {
                path: '/exchange_rates'
            },
            'retrieve': {
                path: '/exchange_rates/{exchange_rate_id}'
            }
        }
    };

}
