component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    billing_cycle_anchor: 'timestamp',
                    trial_end: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscriptions'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/subscriptions/{subscription_id}'
            },
            'deleteDiscount': {
                httpMethod: 'delete',
                path: '/subscriptions/{subscription_id}/discount'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/subscriptions'
            },
            'retrieve': {
                path: '/subscriptions/{subscription_id}'
            },
            'update': {
                arguments: {
                    billing_cycle_anchor: 'timestamp',
                    proration_date: 'timestamp',
                    trial_end: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscriptions/{subscription_id}'
            }
        }
    };

}
