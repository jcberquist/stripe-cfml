component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    application_fee_amount: 'currency',
                    due_date: 'timestamp',
                    effective_at: 'timestamp',
                    shipping_cost: {
                        shipping_rate_data: {
                            fixed_amount: {
                                amount: 'currency',
                                currency: 'iso_currency_code'
                            }
                        }
                    },
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/invoices'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/invoices/{invoice_id}'
            },
            'finalizeInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/finalize'
            },
            'list': {
                arguments: {
                    created: 'datefilter',
                    due_date: 'datefilter'
                },
                path: '/invoices'
            },
            'listLineItems': {
                path: '/invoices/{invoice_id}/lines'
            },
            'listUpcomingLines': {
                arguments: {
                    invoice_items: {
                        amount: 'currency',
                        currency: 'iso_currency_code',
                        period: {
                            end: 'timestamp',
                            start: 'timestamp'
                        },
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        },
                        unit_amount: 'currency'
                    },
                    subscription_billing_cycle_anchor: 'timestamp',
                    subscription_cancel_at: 'timestamp',
                    subscription_items: {
                        billing_thresholds: {
                            usage_gte: 'currency'
                        },
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp'
                },
                path: '/invoices/upcoming/lines'
            },
            'markUncollectible': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/mark_uncollectible'
            },
            'pay': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/pay'
            },
            'retrieve': {
                path: '/invoices/{invoice_id}'
            },
            'retrieveUpcoming': {
                arguments: {
                    invoice_items: {
                        amount: 'currency',
                        currency: 'iso_currency_code',
                        period: {
                            end: 'timestamp',
                            start: 'timestamp'
                        },
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        },
                        unit_amount: 'currency'
                    },
                    subscription_billing_cycle_anchor: 'timestamp',
                    subscription_cancel_at: 'timestamp',
                    subscription_items: {
                        billing_thresholds: {
                            usage_gte: 'currency'
                        },
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp'
                },
                path: '/invoices/upcoming'
            },
            'search': {
                path: '/invoices/search'
            },
            'sendInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/send'
            },
            'update': {
                arguments: {
                    application_fee_amount: 'currency',
                    days_until_due: 'timestamp',
                    due_date: 'timestamp',
                    effective_at: 'timestamp',
                    shipping_cost: {
                        shipping_rate_data: {
                            fixed_amount: {
                                amount: 'currency',
                                currency: 'iso_currency_code'
                            }
                        }
                    },
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}'
            },
            'voidInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/void'
            }
        }
    };

}
