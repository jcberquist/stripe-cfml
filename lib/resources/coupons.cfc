component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/coupons'
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
