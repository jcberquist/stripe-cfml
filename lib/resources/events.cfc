/**
* https://docs.stripe.com/api/events
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/events/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    delivery_success: 'boolean',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string',
                    type: 'string',
                    types: 'array'
                },
                path: '/events'
            },
            /**
            * https://docs.stripe.com/api/events/retrieve
            */
            'retrieve': {
                path: '/events/{event_id}'
            }
        }
    };

}
