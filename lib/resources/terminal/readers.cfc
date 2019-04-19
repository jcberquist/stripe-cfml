component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/terminal/readers'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/terminal/readers/{reader_id}'
            },
            'list': {
                path: '/terminal/readers'
            },
            'retrieve': {
                path: '/terminal/readers/{reader_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/terminal/readers/{reader_id}'
            }
        }
    };

}
