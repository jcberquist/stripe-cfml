component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/cancel'
            },
            'confirm': {
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/confirm'
            },
            'create': {
                httpMethod: 'post',
                path: '/setup_intents'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/setup_intents'
            },
            'retrieve': {
                path: '/setup_intents/{setup_intent_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}'
            }
        }
    };

}
