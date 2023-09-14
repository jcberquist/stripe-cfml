component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter',
                    delivery_success: 'boolean'
                },
                path: '/events'
            },
            'retrieve': {
                path: '/events/{event_id}'
            }
        }
    };

}
