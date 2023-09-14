component {

    this.metadata = {
        methods: {
            'applyCustomerBalance': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/apply_customer_balance'
            },
            'cancel': {
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/cancel'
            },
            'capture': {
                arguments: {
                    amount_to_capture: 'currency',
                    application_fee_amount: 'currency',
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/capture'
            },
            'confirm': {
                arguments: {
                    mandate_data: {
                        customer_acceptance: {
                            accepted_at: 'timestamp'
                        }
                    },
                    payment_method_options: {
                        card: {
                            mandate_options: {
                                amount: 'currency',
                                end_date: 'timestamp',
                                start_date: 'timestamp'
                            }
                        },
                        konbini: {
                            expires_at: 'timestamp'
                        },
                        pix: {
                            expires_at: 'timestamp'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/confirm'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    currency: 'iso_currency_code',
                    mandate_data: {
                        customer_acceptance: {
                            accepted_at: 'timestamp'
                        }
                    },
                    payment_method_options: {
                        card: {
                            mandate_options: {
                                amount: 'currency',
                                end_date: 'timestamp',
                                start_date: 'timestamp'
                            }
                        },
                        konbini: {
                            expires_at: 'timestamp'
                        },
                        pix: {
                            expires_at: 'timestamp'
                        }
                    },
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents'
            },
            'incrementAuthorization': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/increment_authorization'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/payment_intents'
            },
            'retrieve': {
                path: '/payment_intents/{payment_intent_id}'
            },
            'search': {
                path: '/payment_intents/search'
            },
            'update': {
                arguments: {
                    amount: 'currency',
                    application_fee_amount: 'currency',
                    currency: 'iso_currency_code',
                    payment_method_options: {
                        card: {
                            mandate_options: {
                                amount: 'currency',
                                end_date: 'timestamp',
                                start_date: 'timestamp'
                            }
                        },
                        konbini: {
                            expires_at: 'timestamp'
                        },
                        pix: {
                            expires_at: 'timestamp'
                        }
                    },
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}'
            },
            'verifyMicrodeposits': {
                arguments: {
                    amounts: 'currency'
                },
                httpMethod: 'post',
                path: '/payment_intents/{payment_intent_id}/verify_microdeposits'
            }
        }
    };

}
