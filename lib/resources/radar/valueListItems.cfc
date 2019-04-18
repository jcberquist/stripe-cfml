component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/radar/value_list_items'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/radar/value_list_items/{value_list_item_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/radar/value_list_items'
            },
            'retrieve': {
                path: '/radar/value_list_items/{value_list_item_id}'
            }
        }
    };

}
