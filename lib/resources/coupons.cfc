component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount_off: 'currency',
                    redeem_by: 'timestamp'
                },
                httpMethod: 'post',
                path: '/coupons'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/coupons/{coupon_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/coupons'
            },
            'retrieve': {
                path: '/coupons/{coupon_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/coupons/{coupon_id}'
            }
        }
    };

}
