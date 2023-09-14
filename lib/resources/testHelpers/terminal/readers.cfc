component {

    this.metadata = {
        methods: {
            'presentPaymentMethod': {
                arguments: {
                    amount_tip: 'currency'
                },
                httpMethod: 'post',
                path: '/test_helpers/terminal/readers/{reader_id}/present_payment_method'
            }
        }
    };

}
