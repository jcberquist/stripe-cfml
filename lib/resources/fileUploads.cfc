component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'create': {
                endpoint: 'uploads.stripe.com/v1',
                httpMethod: 'post',
                multipart: true,
                path: '/files'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                endpoint: 'uploads.stripe.com/v1',
                path: '/files'
            },
            'retrieve': {
                endpoint: 'uploads.stripe.com/v1',
                path: '/files/{file_upload_id}'
            }
        }
    };

}
