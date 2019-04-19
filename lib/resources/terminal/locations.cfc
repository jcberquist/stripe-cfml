component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/terminal/locations'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/terminal/locations/{location_id}'
            },
            'list': {
                path: '/terminal/locations'
            },
            'retrieve': {
                path: '/terminal/locations/{location_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/terminal/locations/{location_id}'
            }
        }
    };

}
