/**
* https://docs.stripe.com/api/invoices
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/invoices/create
            */
            'create': {
                arguments: {
                    account_tax_ids: 'array',
                    application_fee_amount: 'currency',
                    auto_advance: 'boolean',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    collection_method: 'string', // enum: charge_automatically, send_invoice
                    currency: 'iso_currency_code',
                    customer: 'string',
                    days_until_due: 'numeric',
                    default_payment_method: 'string',
                    default_source: 'string',
                    default_tax_rates: 'array',
                    description: 'string',
                    discounts: {
                        _complex: {
                            coupon: 'string',
                            discount: 'string',
                            promotion_code: 'string'
                        }
                    },
                    due_date: 'timestamp',
                    effective_at: 'timestamp',
                    footer: 'string',
                    from_invoice: 'struct',
                    metadata: 'struct',
                    on_behalf_of: 'string',
                    payment_settings: 'struct',
                    pending_invoice_items_behavior: 'string', // enum: exclude, include
                    rendering: 'struct',
                    shipping_cost: 'struct',
                    shipping_details: 'struct',
                    statement_descriptor: 'string',
                    subscription: 'string',
                    transfer_data: 'struct'
                },
                httpMethod: 'post',
                path: '/invoices'
            },
            /**
            * https://docs.stripe.com/api/invoices/delete
            */
            'delete': {
                httpMethod: 'delete',
                path: '/invoices/{invoice_id}'
            },
            /**
            * https://docs.stripe.com/api/invoices/finalize
            */
            'finalizeInvoice': {
                arguments: {
                    auto_advance: 'boolean'
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/finalize'
            },
            /**
            * https://docs.stripe.com/api/invoices/list
            */
            'list': {
                arguments: {
                    collection_method: 'string', // enum: charge_automatically, send_invoice
                    created: 'datefilter',
                    customer: 'string',
                    due_date: 'datefilter',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string',
                    status: 'string', // enum: draft, open, paid, uncollectible, void
                    subscription: 'string'
                },
                path: '/invoices'
            },
            /**
            * https://docs.stripe.com/api/invoices/lines
            */
            'listLineItems': {
                path: '/invoices/{invoice_id}/lines'
            },
            /**
            * https://docs.stripe.com/api/invoices/upcoming_lines
            */
            'listUpcomingLines': {
                arguments: {
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    invoice_items: {
                        _complex: {
                            amount: 'currency',
                            currency: 'iso_currency_code',
                            description: 'string',
                            discountable: 'boolean',
                            discounts: 'array',
                            invoiceitem: 'string',
                            metadata: 'struct',
                            period: {
                                end: 'timestamp',
                                start: 'timestamp'
                            },
                            price: 'string',
                            price_data: {
                                currency: 'iso_currency_code',
                                product: 'string',
                                tax_behavior: 'string',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'string'
                            },
                            quantity: 'numeric',
                            tax_rates: 'array',
                            unit_amount: 'currency',
                            unit_amount_decimal: 'string'
                        }
                    },
                    subscription_billing_cycle_anchor: 'timestamp',
                    subscription_cancel_at: 'timestamp',
                    subscription_cancel_at_period_end: 'boolean',
                    subscription_cancel_now: 'boolean',
                    subscription_items: {
                        _complex: {
                            billing_thresholds: {
                                usage_gte: 'currency'
                            },
                            clear_usage: 'boolean',
                            deleted: 'boolean',
                            id: 'string',
                            metadata: 'struct',
                            price: 'string',
                            price_data: {
                                currency: 'iso_currency_code',
                                product: 'string',
                                recurring: {
                                    interval: 'string',
                                    interval_count: 'numeric'
                                },
                                tax_behavior: 'string',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'string'
                            },
                            quantity: 'numeric',
                            tax_rates: 'array'
                        }
                    },
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp',
                    subscription_trial_from_plan: 'boolean'
                },
                path: '/invoices/upcoming/lines'
            },
            /**
            * https://docs.stripe.com/api/invoices/mark_uncollectible
            */
            'markUncollectible': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/mark_uncollectible'
            },
            /**
            * https://docs.stripe.com/api/invoices/pay
            */
            'pay': {
                arguments: {
                    forgive: 'boolean',
                    mandate: 'string',
                    off_session: 'boolean',
                    paid_out_of_band: 'boolean',
                    payment_method: 'string',
                    source: 'string'
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/pay'
            },
            /**
            * https://docs.stripe.com/api/invoices/retrieve
            */
            'retrieve': {
                path: '/invoices/{invoice_id}'
            },
            /**
            * https://docs.stripe.com/api/invoices/upcoming
            */
            'retrieveUpcoming': {
                arguments: {
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    invoice_items: {
                        _complex: {
                            amount: 'currency',
                            currency: 'iso_currency_code',
                            description: 'string',
                            discountable: 'boolean',
                            discounts: 'array',
                            invoiceitem: 'string',
                            metadata: 'struct',
                            period: {
                                end: 'timestamp',
                                start: 'timestamp'
                            },
                            price: 'string',
                            price_data: {
                                currency: 'iso_currency_code',
                                product: 'string',
                                tax_behavior: 'string',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'string'
                            },
                            quantity: 'numeric',
                            tax_rates: 'array',
                            unit_amount: 'currency',
                            unit_amount_decimal: 'string'
                        }
                    },
                    subscription_billing_cycle_anchor: 'timestamp',
                    subscription_cancel_at: 'timestamp',
                    subscription_cancel_at_period_end: 'boolean',
                    subscription_cancel_now: 'boolean',
                    subscription_items: {
                        _complex: {
                            billing_thresholds: {
                                usage_gte: 'currency'
                            },
                            clear_usage: 'boolean',
                            deleted: 'boolean',
                            id: 'string',
                            metadata: 'struct',
                            price: 'string',
                            price_data: {
                                currency: 'iso_currency_code',
                                product: 'string',
                                recurring: {
                                    interval: 'string',
                                    interval_count: 'numeric'
                                },
                                tax_behavior: 'string',
                                unit_amount: 'currency',
                                unit_amount_decimal: 'string'
                            },
                            quantity: 'numeric',
                            tax_rates: 'array'
                        }
                    },
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp',
                    subscription_trial_from_plan: 'boolean'
                },
                path: '/invoices/upcoming'
            },
            /**
            * https://docs.stripe.com/api/invoices/search
            */
            'search': {
                arguments: {
                    query: 'string',
                    limit: 'numeric',
                    page: 'string'
                },
                path: '/invoices/search'
            },
            /**
            * https://docs.stripe.com/api/invoices/send
            */
            'sendInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/send'
            },
            /**
            * https://docs.stripe.com/api/invoices/update
            */
            'update': {
                arguments: {
                    account_tax_ids: 'array',
                    application_fee_amount: 'currency',
                    auto_advance: 'boolean',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    collection_method: 'string', // enum: charge_automatically, send_invoice
                    custom_fields: {
                        _complex: {
                            name: 'string',
                            value: 'string'
                        }
                    },
                    days_until_due: 'numeric',
                    default_payment_method: 'string',
                    default_source: 'string',
                    default_tax_rates: 'array',
                    description: 'string',
                    discounts: {
                        _complex: {
                            coupon: 'string',
                            discount: 'string',
                            promotion_code: 'string'
                        }
                    },
                    due_date: 'timestamp',
                    effective_at: 'timestamp',
                    footer: 'string',
                    metadata: 'struct',
                    on_behalf_of: 'string',
                    payment_settings: 'struct',
                    rendering: 'struct',
                    shipping_cost: 'struct',
                    shipping_details: 'struct',
                    statement_descriptor: 'string',
                    transfer_data: 'struct'
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}'
            },
            /**
            * https://docs.stripe.com/api/invoices/void
            */
            'voidInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/void'
            }
        }
    };

}
