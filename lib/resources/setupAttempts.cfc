/**
* https://docs.stripe.com/api/setup_attempts
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/setup_attempts/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    ending_before: 'string',
                    limit: 'numeric',
                    setup_intent: 'string',
                    starting_after: 'string'
                },
                path: '/setup_attempts'
            }
        }
    };

}
