component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    currency: 'iso_currency_code',
                    expires_at: 'timestamp',
                    line_items: {
                        price_data: {
                            currency: 'iso_currency_code',
                            unit_amount: 'currency'
                        }
                    },
                    payment_intent_data: {
                        application_fee_amount: 'currency',
                        transfer_data: {
                            amount: 'currency'
                        }
                    },
                    payment_method_options: {
                        acss_debit: {
                            currency: 'iso_currency_code'
                        }
                    },
                    shipping_options: {
                        shipping_rate_data: {
                            fixed_amount: {
                                amount: 'currency',
                                currency: 'iso_currency_code'
                            }
                        }
                    },
                    subscription_data: {
                        billing_cycle_anchor: 'timestamp',
                        trial_end: 'timestamp'
                    }
                },
                httpMethod: 'post',
                path: '/checkout/sessions'
            },
            'expire': {
                httpMethod: 'post',
                path: '/checkout/sessions/{session_id}/expire'
            },
            'list': {
                path: '/checkout/sessions'
            },
            'listLineItems': {
                path: '/checkout/sessions/{session_id}/line_items'
            },
            'retrieve': {
                path: '/checkout/sessions/{session_id}'
            }
        }
    };

}
