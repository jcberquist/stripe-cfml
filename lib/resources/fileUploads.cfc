component {

    this.metadata = {
        methods: {
            'create': {
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
                path: '/files/{file_upload_id}'
            }
        }
    };

}
