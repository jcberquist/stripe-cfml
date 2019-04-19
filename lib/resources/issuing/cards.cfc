component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    authorization_controls: {
                        max_amount: 'currency',
                        spending_limits: {
                            amount: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/issuing/cards'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/issuing/cards'
            },
            'retrieve': {
                path: '/issuing/cards/{card_id}'
            },
            'retrieveDetails': {
                path: '/issuing/cards/{card_id}/details'
            },
            'update': {
                arguments: {
                    authorization_controls: {
                        max_amount: 'currency',
                        spending_limits: {
                            amount: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/issuing/cards/{card_id}'
            }
        }
    };

}
