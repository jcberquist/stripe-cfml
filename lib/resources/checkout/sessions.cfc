/**
* https://docs.stripe.com/api/checkout/sessions
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/checkout/sessions/create
            */
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
                        enabled: 'boolean',
                        liability: {
                            account: 'string',
                            type: 'string' // enum: account, self
                        }
                    },
                    billing_address_collection: 'string', // enum: auto, required
                    branding_settings: {
                        background_color: 'string',
                        border_style: 'string', // enum: pill, rectangular, rounded
                        button_color: 'string',
                        font_family: 'string',
                        icon: {
                            file: 'string',
                            type: 'string', // enum: file, url
                            url: 'string'
                        },
                        logo: {
                            file: 'string',
                            type: 'string', // enum: file, url
                            url: 'string'
                        }
                    },
                    cancel_url: 'string',
                    client_reference_id: 'string',
                    consent_collection: {
                        payment_method_reuse_agreement: {
                            position: 'string' // enum: auto, hidden
                        },
                        promotions: 'string', // enum: auto, none
                        terms_of_service: 'string' // enum: none, required
                    },
                    currency: 'iso_currency_code',
                    custom_fields: {
                        _complex: {
                            dropdown: {
                                options: {
                                    _complex: {
                                        label: 'string',
                                        value: 'string'
                                    }
                                }
                            },
                            key: 'string',
                            label: {
                                custom: 'string',
                                type: 'string' // enum: custom
                            },
                            numeric: {
                                maximum_length: 'numeric',
                                minimum_length: 'numeric'
                            },
                            optional: 'boolean',
                            text: {
                                maximum_length: 'numeric',
                                minimum_length: 'numeric'
                            },
                            type: 'string' // enum: dropdown, numeric, text
                        }
                    },
                    custom_text: {
                        after_submit: {
                            message: 'string'
                        },
                        shipping_address: {
                            message: 'string'
                        },
                        submit: {
                            message: 'string'
                        },
                        terms_of_service_acceptance: {
                            message: 'string'
                        }
                    },
                    customer: 'string',
                    customer_creation: 'string', // enum: if_required, always
                    customer_email: 'string',
                    customer_update: {
                        address: 'string', // enum: auto, never
                        name: 'string', // enum: auto, never
                        shipping: 'string' // enum: auto, never
                    },
                    discounts: {
                        _complex: {
                            coupon: 'string',
                            promotion_code: 'string'
                        }
                    },
                    excluded_payment_method_types: 'array',
                    expires_at: 'timestamp',
                    invoice_creation: {
                        enabled: 'boolean',
                        invoice_data: {
                            account_tax_ids: 'array',
                            custom_fields: 'array',
                            description: 'string',
                            footer: 'string',
                            issuer: {
                                account: 'string',
                                type: 'string' // enum: account, self
                            },
                            metadata: 'struct',
                            rendering_options: {
                                amount_tax_display: 'string'
                            }
                        }
                    },
                    line_items: {
                        _complex: {
                            adjustable_quantity: {
                                enabled: 'boolean',
                                maximum: 'numeric',
                                minimum: 'numeric'
                            },
                            dynamic_tax_rates: 'array',
                            price: 'string',
                            price_data: {
                                currency: 'iso_currency_code',
                                product: 'string',
                                product_data: {
                                    description: 'string',
                                    images: 'array',
                                    metadata: 'struct',
                                    name: 'string',
                                    tax_code: 'string'
                                },
                                recurring: {
                                    interval: 'string', // enum: day, month, week, year
                                    interval_count: 'numeric'
                                },
                                tax_behavior: 'string', // enum: exclusive, inclusive, unspecified
                                unit_amount: 'currency',
                                unit_amount_decimal: 'string'
                            },
                            quantity: 'numeric',
                            tax_rates: 'array'
                        }
                    },
                    locale: 'string',
                    metadata: 'struct',
                    mode: 'string', // enum: payment, setup, subscription
                    name_collection: {
                        business: {
                            enabled: 'boolean',
                            optional: 'boolean'
                        },
                        individual: {
                            enabled: 'boolean',
                            optional: 'boolean'
                        }
                    },
                    optional_items: 'array',
                    origin_context: 'string', // enum: mobile_app, web
                    payment_intent_data: {
                        application_fee_amount: 'currency',
                        capture_method: 'string', // enum: automatic, automatic_async, manual
                        description: 'string',
                        metadata: 'struct',
                        on_behalf_of: 'string',
                        receipt_email: 'string',
                        setup_future_usage: 'string', // enum: on_session, off_session
                        shipping: 'struct',
                        statement_descriptor: 'string',
                        statement_descriptor_suffix: 'string',
                        transfer_data: {
                            amount: 'currency',
                            destination: 'string'
                        },
                        transfer_group: 'string'
                    },
                    payment_link: 'string',
                    payment_method_collection: 'string', // enum: always, if_required
                    payment_method_configuration_details: {
                        id: 'string',
                        parent: 'string'
                    },
                    payment_method_options: 'struct',
                    payment_method_types: 'array',
                    permissions: {
                        update_shipping_details: 'string' // enum: client_only, server_only
                    },
                    phone_number_collection: {
                        enabled: 'boolean'
                    },
                    redirect_on_completion: 'string', // enum: always, if_required, never
                    return_url: 'string',
                    saved_payment_method_options: {
                        allow_redisplay_filters: 'array', // enum: always, limited, unspecified
                        payment_method_remove: 'string', // enum: disabled, enabled
                        payment_method_save: 'string' // enum: disabled, enabled
                    },
                    shipping_address_collection: {
                        allowed_countries: 'array'
                    },
                    shipping_options: {
                        _complex: {
                            shipping_rate: 'string',
                            shipping_rate_data: {
                                delivery_estimate: {
                                    maximum: {
                                        unit: 'string', // enum: business_day, day, hour, month, week
                                        value: 'numeric'
                                    },
                                    minimum: {
                                        unit: 'string', // enum: business_day, day, hour, month, week
                                        value: 'numeric'
                                    }
                                },
                                display_name: 'string',
                                fixed_amount: {
                                    amount: 'currency',
                                    currency: 'iso_currency_code',
                                    currency_options: 'struct'
                                },
                                metadata: 'struct',
                                tax_behavior: 'string', // enum: exclusive, inclusive, unspecified
                                tax_code: 'string',
                                type: 'string' // enum: fixed_amount
                            }
                        }
                    },
                    submit_type: 'string', // enum: auto, book, donate, pay
                    subscription_data: {
                        application_fee_percent: 'numeric',
                        billing_cycle_anchor: 'timestamp',
                        billing_thresholds: {
                            amount_gte: 'currency',
                            reset_billing_cycle_anchor: 'boolean'
                        },
                        default_tax_rates: 'array',
                        description: 'string',
                        items: 'array',
                        metadata: 'struct',
                        on_behalf_of: 'string',
                        proration_behavior: 'string', // enum: create_prorations, none
                        trial_end: 'timestamp',
                        trial_from_plan: 'boolean',
                        trial_period_days: 'numeric',
                        trial_settings: {
                            end_behavior: {
                                missing_payment_method: 'string' // enum: cancel, create_invoice, pause
                            }
                        },
                        transfer_data: {
                            amount_percent: 'numeric',
                            destination: 'string'
                        }
                    },
                    success_url: 'string',
                    tax_id_collection: {
                        enabled: 'boolean',
                        required: 'string' // enum: if_supported, never
                    },
                    ui_mode: 'string', // enum: custom, embedded, hosted
                    wallet_options: {
                        link: {
                            display: 'string' // enum: auto, never
                        }
                    }
                },
                httpMethod: 'post',
                path: '/checkout/sessions'
            },
            /**
            * https://docs.stripe.com/api/checkout/sessions/expire
            */
            'expire': {
                httpMethod: 'post',
                path: '/checkout/sessions/{session_id}/expire'
            },
            /**
            * https://docs.stripe.com/api/checkout/sessions/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    customer: 'string',
                    customer_details: {
                        email: 'string'
                    },
                    payment_intent: 'string',
                    payment_link: 'string',
                    status: 'string', // enum: complete, expired, open
                    subscription: 'string'
                },
                path: '/checkout/sessions'
            },
            /**
            * https://docs.stripe.com/api/checkout/sessions/line_items
            */
            'listLineItems': {
                path: '/checkout/sessions/{session_id}/line_items'
            },
            /**
            * https://docs.stripe.com/api/checkout/sessions/retrieve
            */
            'retrieve': {
                path: '/checkout/sessions/{session_id}'
            },
            /**
            * https://docs.stripe.com/api/checkout/sessions/update
            */
            'update': {
                arguments: {
                    collected_information: 'struct',
                    metadata: 'struct',
                    shipping_options: 'array'
                },
                httpMethod: 'post',
                path: '/checkout/sessions/{session_id}'
            }
        }
    };

}
