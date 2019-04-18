component {

    this.metadata = {
        methods: {
            'approve': {
                httpMethod: 'post',
                path: '/reviews/{review_id}/approve'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/reviews'
            },
            'retrieve': {
                path: '/reviews/{review_id}'
            }
        }
    };

}
