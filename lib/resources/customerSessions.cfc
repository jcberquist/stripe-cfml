/**
* https://docs.stripe.com/api/customer_sessions
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/customer_sessions/create
            */
            'create': {
                arguments: {
                    components: {
                        buy_button: {
                            enabled: 'boolean'
                        },
                        customer_sheet: {
                            enabled: 'boolean',
                            features: {
                                payment_method_allow_redisplay_filters: 'array', // enum: limited, always
                                payment_method_remove: 'string' // enum: enabled
                            }
                        },
                        mobile_payment_element: {
                            enabled: 'boolean',
                            features: {
                                payment_method_allow_redisplay_filters: 'array', // enum: limited, always
                                payment_method_redisplay: 'string', // enum: enabled
                                payment_method_remove: 'string', // enum: enabled
                                payment_method_save: 'string' // enum: enabled
                            }
                        },
                        payment_element: {
                            enabled: 'boolean',
                            features: {
                                payment_method_allow_redisplay_filters: 'array', // enum: limited, always
                                payment_method_redisplay: 'string', // enum: enabled
                                payment_method_remove: 'string', // enum: enabled
                                payment_method_save: 'string' // enum: enabled
                            }
                        },
                        pricing_table: {
                            enabled: 'boolean'
                        }
                    },
                    customer: 'string'
                },
                httpMethod: 'post',
                path: '/customer_sessions'
            }
        }
    };

}
