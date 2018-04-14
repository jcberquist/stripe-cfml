component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/events'
            },
            'retrieve': {
                path: '/events/{event_id}'
            }
        }
    };

}
