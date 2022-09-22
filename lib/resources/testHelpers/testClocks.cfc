component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    frozen_time: 'timestamp'
                },
                httpMethod: 'post',
                path: '/test_helpers/test_clocks'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/test_helpers/test_clocks/{clock_id}'
            },
            'list': {
                path: '/test_helpers/test_clocks'
            },
            'retrieve': {
                path: '/test_helpers/test_clocks/{clock_id}'
            },
            'advance': {
                arguments: {
                    frozen_time: 'timestamp'
                },
                httpMethod: 'post',
                path: '/test_helpers/test_clocks/{clock_id}/advance'
            }
        }
    };

}
