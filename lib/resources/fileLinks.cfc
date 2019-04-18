component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    expires_at: 'timestamp'
                },
                httpMethod: 'post',
                path: '/file_links'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/file_links'
            },
            'retrieve': {
                path: '/file_links/{file_link_id}'
            },
            'update': {
                arguments: {
                    expires_at: 'timestamp'
                },
                httpMethod: 'post',
                path: '/file_links/{file_link_id}'
            }
        }
    };

}
