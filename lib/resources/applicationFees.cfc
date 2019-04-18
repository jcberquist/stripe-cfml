component {

    this.metadata = {
        methods: {
            'createRefund': {
                arguments: {
                    amount: 'currency'
                },
                httpMethod: 'post',
                path: '/application_fees/{application_fee_id}/refunds'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/application_fees'
            },
            'listRefunds': {
                path: '/application_fees/{application_fee_id}/refunds'
            },
            'retrieve': {
                path: '/application_fees/{application_fee_id}'
            },
            'retrieveRefund': {
                path: '/application_fees/{application_fee_id}/refunds/{fee_refund_id}'
            },
            'updateRefund': {
                httpMethod: 'post',
                path: '/application_fees/{application_fee_id}/refunds/{fee_refund_id}'
            }
        }
    };

}
