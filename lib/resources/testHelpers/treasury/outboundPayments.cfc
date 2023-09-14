component {

    this.metadata = {
        methods: {
            'fail': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/outbound_payments/{outbound_payment_id}/fail'
            },
            'post': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/outbound_payments/{outbound_payment_id}/post'
            },
            'returnOutboundPayment': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/outbound_payments/{outbound_payment_id}/return'
            }
        }
    };

}
