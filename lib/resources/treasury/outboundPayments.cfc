component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/treasury/outbound_payments/{outbound_payment_id}/cancel'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    end_user_details: {
                        present: 'boolean'
                    }
                },
                httpMethod: 'post',
                path: '/treasury/outbound_payments'
            },
            'list': {
                path: '/treasury/outbound_payments'
            },
            'retrieve': {
                path: '/treasury/outbound_payments/{outbound_payment_id}'
            }
        }
    };

}
