component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/financial_connections/sessions'
            },
            'retrieve': {
                path: '/financial_connections/sessions/{session_id}'
            }
        }
    };

}
