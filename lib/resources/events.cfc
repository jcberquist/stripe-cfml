component {

    this.metadata = {
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
