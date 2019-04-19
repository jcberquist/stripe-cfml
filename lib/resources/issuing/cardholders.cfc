component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    authorization_controls: {
                        spending_limits: {
                            amount: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/issuing/cardholders'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/issuing/cardholders'
            },
            'retrieve': {
                path: '/issuing/cardholders/{cardholder_id}'
            },
            'update': {
                arguments: {
                    authorization_controls: {
                        spending_limits: {
                            amount: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/issuing/cardholders/{cardholder_id}'
            }
        }
    };

}
