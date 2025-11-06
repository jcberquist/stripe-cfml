/**
* https://docs.stripe.com/api/payment_links
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/payment_links/create
            */
            'create': {
                arguments: {
                    after_completion: {
                        hosted_confirmation: {
                            custom_message: 'string'
                        },
                        redirect: {
                            url: 'string'
                        },
                        type: 'string' // enum: hosted_confirmation, redirect
                    },
                    allow_promotion_codes: 'boolean',
                    application_fee_amount: 'currency',
                    application_fee_percent: 'numeric',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    billing_address_collection: 'string', // enum: auto, required
                    consent_collection: {
                        payment_method_reuse_agreement: {
                            position: 'string' // enum: auto, hidden
                        },
                        promotions: 'string', // enum: auto, none
                        terms_of_service: 'string' // enum: required
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
                    customer_creation: 'string', // enum: if_required, always
                    inactive_message: 'string',
                    invoice_creation: {
                        enabled: 'boolean',
                        invoice_data: 'struct'
                    },
                    line_items: {
                        _complex: {
                            adjustable_quantity: {
                                enabled: 'boolean',
                                maximum: 'numeric',
                                minimum: 'numeric'
                            },
                            price: 'string',
                            price_data: {
                                currency: 'iso_currency_code',
                                product: 'string',
                                recurring: {
                                    interval: 'string', // enum: day, month, week, year
                                    interval_count: 'numeric'
                                },
                                tax_behavior: 'string', // enum: exclusive, inclusive, unspecified
                                unit_amount: 'currency',
                                unit_amount_decimal: 'string'
                            },
                            quantity: 'numeric'
                        }
                    },
                    metadata: 'struct',
                    on_behalf_of: 'string',
                    payment_intent_data: 'struct',
                    payment_method_collection: 'string', // enum: if_required, always
                    payment_method_types: 'array',
                    phone_number_collection: {
                        enabled: 'boolean'
                    },
                    restrictions: {
                        completed_sessions: {
                            limit: 'numeric'
                        }
                    },
                    shipping_address_collection: {
                        allowed_countries: 'array'
                    },
                    submit_type: 'string', // enum: auto, book, donate, pay
                    subscription_data: 'struct',
                    tax_id_collection: {
                        enabled: 'boolean'
                    },
                    transfer_data: 'struct'
                },
                httpMethod: 'post',
                path: '/payment_links'
            },
            /**
            * https://docs.stripe.com/api/payment_links/list
            */
            'list': {
                arguments: {
                    active: 'boolean',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/payment_links'
            },
            /**
            * https://docs.stripe.com/api/payment_links/line_items
            */
            'listLineItems': {
                arguments: {
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/payment_links/{payment_link_id}/line_items'
            },
            /**
            * https://docs.stripe.com/api/payment_links/retrieve
            */
            'retrieve': {
                path: '/payment_links/{payment_link_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_links/update
            */
            'update': {
                arguments: {
                    active: 'boolean',
                    after_completion: {
                        hosted_confirmation: {
                            custom_message: 'string'
                        },
                        redirect: {
                            url: 'string'
                        },
                        type: 'string' // enum: hosted_confirmation, redirect
                    },
                    allow_promotion_codes: 'boolean',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    billing_address_collection: 'string', // enum: auto, required
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
                    customer_creation: 'string', // enum: if_required, always
                    inactive_message: 'string',
                    invoice_creation: {
                        enabled: 'boolean',
                        invoice_data: 'struct'
                    },
                    line_items: {
                        _complex: {
                            adjustable_quantity: {
                                enabled: 'boolean',
                                maximum: 'numeric',
                                minimum: 'numeric'
                            },
                            id: 'string',
                            quantity: 'numeric'
                        }
                    },
                    metadata: 'struct',
                    payment_method_collection: 'string', // enum: if_required, always
                    payment_method_types: 'array',
                    phone_number_collection: {
                        enabled: 'boolean'
                    },
                    shipping_address_collection: {
                        allowed_countries: 'array'
                    }
                },
                httpMethod: 'post',
                path: '/payment_links/{payment_link_id}'
            }
        }
    };

}
