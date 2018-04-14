component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'create': {
                arguments: {
                    timestamp: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscription_items/{subscription_item}/usage_records',
                positionalArgs: []
            }
        }
    };

}
