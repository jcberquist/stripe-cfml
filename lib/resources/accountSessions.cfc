component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    components: {
                        account_onboarding: {
                            enabled: 'boolean'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/account_sessions'
            }
        }
    };

}
