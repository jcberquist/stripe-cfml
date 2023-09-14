component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    individual: {
                        card_issuing: {
                            user_terms_acceptance: {
                                date: 'timestamp'
                            }
                        }
                    },
                    spending_controls: {
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
                    individual: {
                        card_issuing: {
                            user_terms_acceptance: {
                                date: 'timestamp'
                            }
                        }
                    },
                    spending_controls: {
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
