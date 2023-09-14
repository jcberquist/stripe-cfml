component {

    this.metadata = {
        methods: {
            'cancel': {
                arguments: {
                    invoice_now: 'boolean',
                    prorate: 'boolean'
                },
                httpMethod: 'post',
                path: '/subscription_schedules/{subscription_schedule_id}/cancel'
            },
            'create': {
                arguments: {
                    default_settings: {
                        automatic_tax: {
                            enabled: 'boolean'
                        },
                        billing_thresholds: {
                            amount_gte: 'currency',
                            reset_billing_cycle_anchor: 'boolean'
                        }
                    },
                    phases: {
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
                        currency: 'iso_currency_code',
                        end_date: 'timestamp',
                        items: {
                            billing_thresholds: {
                                usage_gte: 'currency'
                            },
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency'
                            }
                        },
                        trial: 'boolean',
                        trial_end: 'timestamp'
                    },
                    start_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscription_schedules'
            },
            'list': {
                arguments: {
                    canceled_at: 'datefilter',
                    completed_at: 'datefilter',
                    created: 'datefilter',
                    released_at: 'datefilter',
                    scheduled: 'boolean'
                },
                path: '/subscription_schedules'
            },
            'release': {
                arguments: {
                    preserve_cancel_date: 'boolean'
                },
                httpMethod: 'post',
                path: '/subscription_schedules/{subscription_schedule_id}/release'
            },
            'retrieve': {
                path: '/subscription_schedules/{subscription_schedule_id}'
            },
            'update': {
                arguments: {
                    default_settings: {
                        automatic_tax: {
                            enabled: 'boolean'
                        },
                        billing_thresholds: {
                            amount_gte: 'currency',
                            reset_billing_cycle_anchor: 'boolean'
                        }
                    },
                    phases: {
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
                        currency: 'iso_currency_code',
                        end_date: 'timestamp',
                        items: {
                            billing_thresholds: {
                                usage_gte: 'currency'
                            },
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency'
                            }
                        },
                        start_date: 'timestamp',
                        trial: 'boolean',
                        trial_end: 'timestamp'
                    }
                },
                httpMethod: 'post',
                path: '/subscription_schedules/{subscription_schedule_id}'
            }
        }
    };

}
