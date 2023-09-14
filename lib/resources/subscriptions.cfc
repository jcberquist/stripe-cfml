component {

    this.metadata = {
        methods: {
            'cancel': {
                arguments: {
                    invoice_now: 'boolean',
                    prorate: 'boolean'
                },
                httpMethod: 'delete',
                path: '/subscriptions/{subscription_id}'
            },
            'create': {
                arguments: {
                    add_invoice_items: {
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    backdate_start_date: 'timestamp',
                    billing_cycle_anchor: 'timestamp',
                    billing_thresholds: {
                        amount_gte: 'currency',
                        reset_billing_cycle_anchor: 'boolean'
                    },
                    cancel_at: 'timestamp',
                    cancel_at_period_end: 'boolean',
                    currency: 'iso_currency_code',
                    items: {
                        billing_thresholds: {
                            usage_gte: 'currency'
                        },
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    off_session: 'boolean',
                    payment_settings: {
                        payment_method_options: {
                            card: {
                                mandate_options: {
                                    amount: 'currency'
                                }
                            }
                        }
                    },
                    trial_end: 'timestamp',
                    trial_from_plan: 'boolean'
                },
                httpMethod: 'post',
                path: '/subscriptions'
            },
            'deleteDiscount': {
                httpMethod: 'delete',
                path: '/subscriptions/{subscription_id}/discount'
            },
            'list': {
                arguments: {
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    created: 'datefilter',
                    current_period_end: 'datefilter',
                    current_period_start: 'datefilter'
                },
                path: '/subscriptions'
            },
            'resume': {
                arguments: {
                    proration_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscriptions/{subscription_id}/resume'
            },
            'retrieve': {
                path: '/subscriptions/{subscription_id}'
            },
            'search': {
                path: '/subscriptions/search'
            },
            'update': {
                arguments: {
                    add_invoice_items: {
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    billing_thresholds: {
                        amount_gte: 'currency',
                        reset_billing_cycle_anchor: 'boolean'
                    },
                    cancel_at: 'timestamp',
                    cancel_at_period_end: 'boolean',
                    items: {
                        billing_thresholds: {
                            usage_gte: 'currency'
                        },
                        clear_usage: 'boolean',
                        deleted: 'boolean',
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    off_session: 'boolean',
                    pause_collection: {
                        resumes_at: 'timestamp'
                    },
                    payment_settings: {
                        payment_method_options: {
                            card: {
                                mandate_options: {
                                    amount: 'currency'
                                }
                            }
                        }
                    },
                    proration_date: 'timestamp',
                    trial_end: 'timestamp',
                    trial_from_plan: 'boolean'
                },
                httpMethod: 'post',
                path: '/subscriptions/{subscription_id}'
            }
        }
    };

}
