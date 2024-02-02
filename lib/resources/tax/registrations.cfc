component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    active_from: 'timestamp',
                    expires_at: 'timestamp'
                },
                httpMethod: 'post',
                path: '/tax/registrations'
            },
            'list': {
                path: '/tax/registrations'
            },
            'retrieve': {
                path: '/tax/registrations/{registration_id}'
            },
            'update': {
                arguments: {
                    active_from: 'timestamp',
                    expires_at: 'timestamp'
                },
                httpMethod: 'post',
                path: '/tax/registrations/{registration_id}'
            }
        }
    };

}
