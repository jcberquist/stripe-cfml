component {

    this.metadata = {
        methods: {
            'cancel': {
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
                    backdate_start_date: 'timestamp',
                    billing_cycle_anchor: 'timestamp',
                    billing_thresholds: {
                        amount_gte: 'currency'
                    },
                    cancel_at: 'timestamp',
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
                    payment_settings: {
                        payment_method_options: {
                            card: {
                                mandate_options: {
                                    amount: 'currency'
                                }
                            }
                        }
                    },
                    trial_end: 'timestamp'
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
                    billing_thresholds: {
                        amount_gte: 'currency'
                    },
                    cancel_at: 'timestamp',
                    items: {
                        billing_thresholds: {
                            usage_gte: 'currency'
                        },
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
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
                    trial_end: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscriptions/{subscription_id}'
            }
        }
    };

}
