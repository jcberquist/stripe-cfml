/**
* https://docs.stripe.com/api/application_fees
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/application_fees/refund
            */
            'createRefund': {
                arguments: {
                    amount: 'currency',
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/application_fees/{application_fee_id}/refunds'
            },
            /**
            * https://docs.stripe.com/api/application_fees/list
            */
            'list': {
                arguments: {
                    charge: 'string',
                    created: 'datefilter'
                },
                path: '/application_fees'
            },
            /**
            * https://docs.stripe.com/api/application_fees/refunds
            */
            'listRefunds': {
                path: '/application_fees/{application_fee_id}/refunds'
            },
            /**
            * https://docs.stripe.com/api/application_fees/retrieve
            */
            'retrieve': {
                path: '/application_fees/{application_fee_id}'
            },
            /**
            * https://docs.stripe.com/api/application_fees/refund_retrieve
            */
            'retrieveRefund': {
                path: '/application_fees/{application_fee_id}/refunds/{refund_id}'
            },
            /**
            * https://docs.stripe.com/api/application_fees/refund_update
            */
            'updateRefund': {
                arguments: {
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/application_fees/{application_fee_id}/refunds/{refund_id}'
            }
        }
    };

}
