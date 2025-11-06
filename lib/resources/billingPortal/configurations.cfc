/**
* https://docs.stripe.com/api/billing_portal/configurations
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/billing_portal/configurations/create
            */
            'create': {
                arguments: {
                    business_profile: {
                        headline: 'string',
                        privacy_policy_url: 'string',
                        terms_of_service_url: 'string'
                    },
                    default_return_url: 'string',
                    features: {
                        customer_update: {
                            allowed_updates: 'array', // enum: address, email, name, phone, shipping, tax_id
                            enabled: 'boolean'
                        },
                        invoice_history: {
                            enabled: 'boolean'
                        },
                        payment_method_update: {
                            enabled: 'boolean'
                        },
                        subscription_cancel: {
                            cancellation_reason: {
                                enabled: 'boolean',
                                options: 'array' // enum: too_expensive, missing_features, switched_service, unused, other
                            },
                            enabled: 'boolean',
                            mode: 'string', // enum: at_period_end, immediately
                            proration_behavior: 'string' // enum: none, create_prorations, always_invoice
                        },
                        subscription_pause: {
                            enabled: 'boolean'
                        },
                        subscription_update: {
                            default_allowed_updates: 'array', // enum: price, promotion_code, quantity
                            enabled: 'boolean',
                            products: 'array',
                            proration_behavior: 'string' // enum: none, create_prorations, always_invoice
                        }
                    },
                    login_page: {
                        enabled: 'boolean'
                    },
                    metadata: 'struct',
                    name: 'string'
                },
                httpMethod: 'post',
                path: '/billing_portal/configurations'
            },
            /**
            * https://docs.stripe.com/api/billing_portal/configurations/list
            */
            'list': {
                arguments: {
                    active: 'boolean',
                    ending_before: 'string',
                    is_default: 'boolean',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/billing_portal/configurations'
            },
            /**
            * https://docs.stripe.com/api/billing_portal/configurations/retrieve
            */
            'retrieve': {
                path: '/billing_portal/configurations/{configuration_id}'
            },
            /**
            * https://docs.stripe.com/api/billing_portal/configurations/update
            */
            'update': {
                arguments: {
                    active: 'boolean',
                    business_profile: {
                        headline: 'string',
                        privacy_policy_url: 'string',
                        terms_of_service_url: 'string'
                    },
                    default_return_url: 'string',
                    features: {
                        customer_update: {
                            allowed_updates: 'array', // enum: address, email, name, phone, shipping, tax_id
                            enabled: 'boolean'
                        },
                        invoice_history: {
                            enabled: 'boolean'
                        },
                        payment_method_update: {
                            enabled: 'boolean'
                        },
                        subscription_cancel: {
                            cancellation_reason: {
                                enabled: 'boolean',
                                options: 'array' // enum: too_expensive, missing_features, switched_service, unused, other
                            },
                            enabled: 'boolean',
                            mode: 'string', // enum: at_period_end, immediately
                            proration_behavior: 'string' // enum: none, create_prorations, always_invoice
                        },
                        subscription_pause: {
                            enabled: 'boolean'
                        },
                        subscription_update: {
                            default_allowed_updates: 'array', // enum: price, promotion_code, quantity
                            enabled: 'boolean',
                            products: 'array',
                            proration_behavior: 'string' // enum: none, create_prorations, always_invoice
                        }
                    },
                    login_page: {
                        enabled: 'boolean'
                    },
                    metadata: 'struct',
                    name: 'string'
                },
                httpMethod: 'post',
                path: '/billing_portal/configurations/{configuration_id}'
            }
        }
    };

}
