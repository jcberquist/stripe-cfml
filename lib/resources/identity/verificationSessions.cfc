component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/identity/verification_sessions/{verification_session_id}/cancel'
            },
            'create': {
                arguments: {
                    options: {
                        document: {
                            require_id_number: 'boolean',
                            require_live_capture: 'boolean',
                            require_matching_selfie: 'boolean'
                        }
                    }
                },
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
                arguments: {
                    options: {
                        document: {
                            require_id_number: 'boolean',
                            require_live_capture: 'boolean',
                            require_matching_selfie: 'boolean'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/identity/verification_sessions/{verification_session_id}'
            }
        }
    };

}
