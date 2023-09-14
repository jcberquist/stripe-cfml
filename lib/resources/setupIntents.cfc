component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/cancel'
            },
            'confirm': {
                arguments: {
                    mandate_data: {
                        customer_acceptance: {
                            accepted_at: 'timestamp'
                        }
                    },
                    payment_method_options: {
                        acss_debit: {
                            currency: 'iso_currency_code'
                        },
                        card: {
                            mandate_options: {
                                amount: 'currency',
                                currency: 'iso_currency_code',
                                end_date: 'timestamp',
                                start_date: 'timestamp'
                            }
                        }
                    }
                },
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/confirm'
            },
            'create': {
                arguments: {
                    mandate_data: {
                        customer_acceptance: {
                            accepted_at: 'timestamp'
                        }
                    },
                    payment_method_options: {
                        acss_debit: {
                            currency: 'iso_currency_code'
                        },
                        card: {
                            mandate_options: {
                                amount: 'currency',
                                currency: 'iso_currency_code',
                                end_date: 'timestamp',
                                start_date: 'timestamp'
                            }
                        }
                    },
                    single_use: {
                        amount: 'currency',
                        currency: 'iso_currency_code'
                    }
                },
                httpMethod: 'post',
                path: '/setup_intents'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/setup_intents'
            },
            'retrieve': {
                path: '/setup_intents/{setup_intent_id}'
            },
            'update': {
                arguments: {
                    payment_method_options: {
                        acss_debit: {
                            currency: 'iso_currency_code'
                        },
                        card: {
                            mandate_options: {
                                amount: 'currency',
                                currency: 'iso_currency_code',
                                end_date: 'timestamp',
                                start_date: 'timestamp'
                            }
                        }
                    }
                },
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}'
            },
            'verifyMicrodeposits': {
                arguments: {
                    amounts: 'currency'
                },
                httpMethod: 'post',
                path: '/setup_intents/{setup_intent_id}/verify_microdeposits'
            }
        }
    };

}
