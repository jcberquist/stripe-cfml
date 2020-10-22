component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/payouts/{payout_id}/cancel'
            },
            'create': {
                arguments: {
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/payouts'
            },
            'list': {
                arguments: {
                    arrival_date: 'datefilter',
                    created: 'datefilter'
                },
                path: '/payouts'
            },
            'retrieve': {
                path: '/payouts/{payout_id}'
            },
            'reverse': {
                httpMethod: 'post',
                path: '/payouts/{payout_id}/reverse'
            },
            'update': {
                httpMethod: 'post',
                path: '/payouts/{payout_id}'
            }
        }
    };

}
