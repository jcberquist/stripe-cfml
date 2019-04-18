component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/ephemeral_keys'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/ephemeral_keys/{ephemeral_key_id}'
            }
        }
    };

}
