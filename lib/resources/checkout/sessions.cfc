component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    after_expiration: {
                        recovery: {
                            allow_promotion_codes: 'boolean',
                            enabled: 'boolean'
                        }
                    },
                    allow_promotion_codes: 'boolean',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    currency: 'iso_currency_code',
                    custom_fields: {
                        optional: 'boolean'
                    },
                    expires_at: 'timestamp',
                    invoice_creation: {
                        enabled: 'boolean'
                    },
                    line_items: {
                        adjustable_quantity: {
                            enabled: 'boolean'
                        },
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    payment_intent_data: {
                        application_fee_amount: 'currency',
                        transfer_data: {
                            amount: 'currency'
                        }
                    },
                    payment_method_options: {
                        acss_debit: {
                            currency: 'iso_currency_code'
                        },
                        card: {
                            installments: {
                                enabled: 'boolean'
                            }
                        },
                        'p24': {
                            tos_shown_and_accepted: 'boolean'
                        }
                    },
                    phone_number_collection: {
                        enabled: 'boolean'
                    },
                    shipping_options: {
                        shipping_rate_data: {
                            fixed_amount: {
                                amount: 'currency',
                                currency: 'iso_currency_code'
                            }
                        }
                    },
                    subscription_data: {
                        billing_cycle_anchor: 'timestamp',
                        trial_end: 'timestamp'
                    },
                    tax_id_collection: {
                        enabled: 'boolean'
                    }
                },
                httpMethod: 'post',
                path: '/checkout/sessions'
            },
            'expire': {
                httpMethod: 'post',
                path: '/checkout/sessions/{session_id}/expire'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/checkout/sessions'
            },
            'listLineItems': {
                path: '/checkout/sessions/{session_id}/line_items'
            },
            'retrieve': {
                path: '/checkout/sessions/{session_id}'
            }
        }
    };

}
