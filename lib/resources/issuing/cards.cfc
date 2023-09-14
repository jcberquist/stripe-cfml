component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    spending_controls: {
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
            'update': {
                arguments: {
                    spending_controls: {
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
