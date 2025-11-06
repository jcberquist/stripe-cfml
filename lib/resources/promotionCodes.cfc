/**
* https://docs.stripe.com/api/promotion_codes
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/promotion_codes/create
            */
            'create': {
                arguments: {
                    active: 'boolean',
                    code: 'string',
                    coupon: 'string',
                    customer: 'string',
                    expires_at: 'timestamp',
                    max_redemptions: 'numeric',
                    metadata: 'struct',
                    restrictions: {
                        currency_options: 'struct',
                        first_time_transaction: 'boolean',
                        minimum_amount: 'currency',
                        minimum_amount_currency: 'iso_currency_code'
                    }
                },
                httpMethod: 'post',
                path: '/promotion_codes'
            },
            /**
            * https://docs.stripe.com/api/promotion_codes/list
            */
            'list': {
                arguments: {
                    active: 'boolean',
                    code: 'string',
                    coupon: 'string',
                    created: 'datefilter',
                    customer: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/promotion_codes'
            },
            /**
            * https://docs.stripe.com/api/promotion_codes/retrieve
            */
            'retrieve': {
                path: '/promotion_codes/{promotion_code_id}'
            },
            /**
            * https://docs.stripe.com/api/promotion_codes/update
            */
            'update': {
                arguments: {
                    active: 'boolean',
                    metadata: 'struct',
                    restrictions: {
                        currency_options: 'struct',
                        first_time_transaction: 'boolean',
                        minimum_amount: 'currency',
                        minimum_amount_currency: 'iso_currency_code'
                    }
                },
                httpMethod: 'post',
                path: '/promotion_codes/{promotion_code_id}'
            }
        }
    };

}
