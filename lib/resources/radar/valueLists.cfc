component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/radar/value_lists'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/radar/value_lists/{value_list_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/radar/value_lists'
            },
            'retrieve': {
                path: '/radar/value_lists/{value_list_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/radar/value_lists/{value_list_id}'
            }
        }
    };

}
