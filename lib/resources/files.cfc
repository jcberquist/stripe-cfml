component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    file_link_data: {
                        expires_at: 'timestamp'
                    }
                },
                endpoint: 'files.stripe.com/v1',
                httpMethod: 'post',
                multipart: true,
                path: '/files'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                endpoint: 'files.stripe.com/v1',
                path: '/files'
            },
            'retrieve': {
                endpoint: 'files.stripe.com/v1',
                path: '/files/{file_id}'
            }
        }
    };

}
