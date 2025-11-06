/**
* https://docs.stripe.com/api/refunds
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/refunds/cancel
            */
            'cancel': {
                httpMethod: 'post',
                path: '/refunds/{refund_id}/cancel'
            },
            /**
            * https://docs.stripe.com/api/refunds/create
            */
            'create': {
                arguments: {
                    amount: 'currency',
                    charge: 'string',
                    instructions_email: 'string',
                    metadata: 'struct',
                    origin: 'string', // enum: customer_balance
                    payment_intent: 'string',
                    reason: 'string', // enum: duplicate, fraudulent, requested_by_customer
                    refund_application_fee: 'boolean',
                    reverse_transfer: 'boolean'
                },
                httpMethod: 'post',
                path: '/refunds'
            },
            /**
            * https://docs.stripe.com/api/refunds/list
            */
            'list': {
                arguments: {
                    charge: 'string',
                    created: 'datefilter',
                    payment_intent: 'string'
                },
                path: '/refunds'
            },
            /**
            * https://docs.stripe.com/api/refunds/retrieve
            */
            'retrieve': {
                path: '/refunds/{refund_id}'
            },
            /**
            * https://docs.stripe.com/api/refunds/update
            */
            'update': {
                arguments: {
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/refunds/{refund_id}'
            }
        }
    };

}
