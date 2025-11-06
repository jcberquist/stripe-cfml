/**
* https://docs.stripe.com/api/coupons
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/coupons/create
            */
            'create': {
                arguments: {
                    amount_off: 'currency',
                    applies_to: {
                        products: {
                            _complex: {
                                id: 'string'
                            }
                        }
                    },
                    currency: 'iso_currency_code',
                    currency_options: 'struct',
                    duration: 'string', // enum: forever, once, repeating
                    duration_in_months: 'numeric',
                    id: 'string',
                    max_redemptions: 'numeric',
                    metadata: 'struct',
                    name: 'string',
                    percent_off: 'numeric',
                    redeem_by: 'timestamp'
                },
                httpMethod: 'post',
                path: '/coupons'
            },
            /**
            * https://docs.stripe.com/api/coupons/delete
            */
            'delete': {
                httpMethod: 'delete',
                path: '/coupons/{coupon_id}'
            },
            /**
            * https://docs.stripe.com/api/coupons/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/coupons'
            },
            /**
            * https://docs.stripe.com/api/coupons/retrieve
            */
            'retrieve': {
                path: '/coupons/{coupon_id}'
            },
            /**
            * https://docs.stripe.com/api/coupons/update
            */
            'update': {
                arguments: {
                    currency_options: 'struct',
                    metadata: 'struct',
                    name: 'string'
                },
                httpMethod: 'post',
                path: '/coupons/{coupon_id}'
            }
        }
    };

}
