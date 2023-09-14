component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/identity/verification_sessions/{verification_session_id}/cancel'
            },
            'create': {
                httpMethod: 'post',
                path: '/identity/verification_sessions'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/identity/verification_sessions'
            },
            'redact': {
                httpMethod: 'post',
                path: '/identity/verification_sessions/{verification_session_id}/redact'
            },
            'retrieve': {
                path: '/identity/verification_sessions/{verification_session_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/identity/verification_sessions/{verification_session_id}'
            }
        }
    };

}
