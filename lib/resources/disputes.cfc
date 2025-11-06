/**
* https://docs.stripe.com/api/disputes
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/disputes/close
            */
            'close': {
                httpMethod: 'post',
                path: '/disputes/{dispute_id}/close'
            },
            /**
            * https://docs.stripe.com/api/disputes/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    ending_before: 'string',
                    limit: 'numeric',
                    payment_intent: 'string',
                    starting_after: 'string'
                },
                path: '/disputes'
            },
            /**
            * https://docs.stripe.com/api/disputes/retrieve
            */
            'retrieve': {
                path: '/disputes/{dispute_id}'
            },
            /**
            * https://docs.stripe.com/api/disputes/update
            */
            'update': {
                arguments: {
                    evidence: {
                        access_activity_log: 'string',
                        billing_address: 'string',
                        cancellation_policy: 'string',
                        cancellation_policy_disclosure: 'string',
                        cancellation_rebuttal: 'string',
                        customer_communication: 'string',
                        customer_email_address: 'string',
                        customer_name: 'string',
                        customer_purchase_ip: 'string',
                        customer_signature: 'string',
                        duplicate_charge_documentation: 'string',
                        duplicate_charge_explanation: 'string',
                        duplicate_charge_id: 'string',
                        product_description: 'string',
                        receipt: 'string',
                        refund_policy: 'string',
                        refund_policy_disclosure: 'string',
                        refund_refusal_explanation: 'string',
                        service_date: 'string',
                        service_documentation: 'string',
                        shipping_address: 'string',
                        shipping_carrier: 'string',
                        shipping_date: 'string',
                        shipping_documentation: 'string',
                        shipping_tracking_number: 'string',
                        uncategorized_file: 'string',
                        uncategorized_text: 'string'
                    },
                    metadata: 'struct',
                    submit: 'boolean'
                },
                httpMethod: 'post',
                path: '/disputes/{dispute_id}'
            }
        }
    };

}
