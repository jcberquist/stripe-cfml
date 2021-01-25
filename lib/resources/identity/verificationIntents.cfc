/**
* Identity beta 3 and earlier.
*/
component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/identity/verification_intents/{verification_intent_id}/cancel'
            },
            'create': {
                httpMethod: 'post',
                path: '/identity/verification_intents'
            },
            'list': {
                path: '/identity/verification_intents'
            },
            'retrieve': {
                path: '/identity/verification_intents/{verification_intent_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/identity/verification_intents/{verification_intent_id}'
            }
        }
    };

}
