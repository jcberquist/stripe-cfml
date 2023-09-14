component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    application_fee_amount: 'currency',
                    auto_advance: 'boolean',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    due_date: 'timestamp',
                    effective_at: 'timestamp',
                    payment_settings: {
                        payment_method_options: {
                            card: {
                                installments: {
                                    enabled: 'boolean'
                                }
                            }
                        }
                    },
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
                arguments: {
                    auto_advance: 'boolean'
                },
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
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    invoice_items: {
                        amount: 'currency',
                        currency: 'iso_currency_code',
                        discountable: 'boolean',
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
                    subscription_cancel_at_period_end: 'boolean',
                    subscription_cancel_now: 'boolean',
                    subscription_items: {
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
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp',
                    subscription_trial_from_plan: 'boolean'
                },
                path: '/invoices/upcoming/lines'
            },
            'markUncollectible': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/mark_uncollectible'
            },
            'pay': {
                arguments: {
                    forgive: 'boolean',
                    off_session: 'boolean',
                    paid_out_of_band: 'boolean'
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/pay'
            },
            'retrieve': {
                path: '/invoices/{invoice_id}'
            },
            'retrieveUpcoming': {
                arguments: {
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    invoice_items: {
                        amount: 'currency',
                        currency: 'iso_currency_code',
                        discountable: 'boolean',
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
                    subscription_cancel_at_period_end: 'boolean',
                    subscription_cancel_now: 'boolean',
                    subscription_items: {
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
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp',
                    subscription_trial_from_plan: 'boolean'
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
                    auto_advance: 'boolean',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    due_date: 'timestamp',
                    effective_at: 'timestamp',
                    payment_settings: {
                        payment_method_options: {
                            card: {
                                installments: {
                                    enabled: 'boolean'
                                }
                            }
                        }
                    },
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
