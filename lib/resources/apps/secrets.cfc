component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    expires_at: 'timestamp'
                },
                httpMethod: 'post',
                path: '/apps/secrets'
            },
            'deleteWhere': {
                httpMethod: 'post',
                path: '/apps/secrets/delete'
            },
            'find': {
                path: '/apps/secrets/find'
            },
            'list': {
                path: '/apps/secrets'
            }
        }
    };

}
