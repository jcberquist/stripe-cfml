component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    features: {
                        customer_update: {
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
                                enabled: 'boolean'
                            },
                            enabled: 'boolean'
                        },
                        subscription_pause: {
                            enabled: 'boolean'
                        },
                        subscription_update: {
                            enabled: 'boolean'
                        }
                    },
                    login_page: {
                        enabled: 'boolean'
                    }
                },
                httpMethod: 'post',
                path: '/billing_portal/configurations'
            },
            'list': {
                arguments: {
                    active: 'boolean',
                    is_default: 'boolean'
                },
                path: '/billing_portal/configurations'
            },
            'retrieve': {
                path: '/billing_portal/configurations/{configuration_id}'
            },
            'update': {
                arguments: {
                    active: 'boolean',
                    features: {
                        customer_update: {
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
                                enabled: 'boolean'
                            },
                            enabled: 'boolean'
                        },
                        subscription_pause: {
                            enabled: 'boolean'
                        },
                        subscription_update: {
                            enabled: 'boolean'
                        }
                    },
                    login_page: {
                        enabled: 'boolean'
                    }
                },
                httpMethod: 'post',
                path: '/billing_portal/configurations/{configuration_id}'
            }
        }
    };

}
