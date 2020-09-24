component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/subscription_schedules/{subscription_schedule_id}/cancel'
            },
            'create': {
                arguments: {
                    default_settings: {
                        billing_thresholds: {
                            amount_gte: 'currency'
                        }
                    },
                    phases: {
                        add_invoice_items: {
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'currency'
                            }
                        },
                        billing_thresholds: {
                            amount_gte: 'currency'
                        },
                        end_date: 'timestamp',
                        items: {
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'currency'
                            }
                        },
                        plans: {
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'currency'
                            }
                        },
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
                    released_at: 'datefilter'
                },
                path: '/subscription_schedules'
            },
            'release': {
                httpMethod: 'post',
                path: '/subscription_schedules/{subscription_schedule_id}/release'
            },
            'retrieve': {
                path: '/subscription_schedules/{subscription_schedule_id}'
            },
            'update': {
                arguments: {
                    default_settings: {
                        billing_thresholds: {
                            amount_gte: 'currency'
                        }
                    },
                    phases: {
                        add_invoice_items: {
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'currency'
                            }
                        },
                        billing_thresholds: {
                            amount_gte: 'currency'
                        },
                        end_date: 'timestamp',
                        items: {
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'currency'
                            }
                        },
                        plans: {
                            price_data: {
                                currency: 'iso_currency_code',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'currency'
                            }
                        },
                        trial_end: 'timestamp'
                    },
                    start_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscription_schedules/{subscription_schedule_id}'
            }
        }
    };

}
