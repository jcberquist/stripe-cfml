component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    line_items: {
                        amount: 'currency'
                    },
                    payment_intent_data: {
                        application_fee_amount: 'currency'
                    },
                    subscription_data: {
                        trial_end: 'timestamp'
                    }
                },
                httpMethod: 'post',
                path: '/checkout/sessions'
            },
            'retrieve': {
                path: '/checkout/sessions/{session_id}'
            }
        }
    };

}
