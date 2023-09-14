component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    billing_thresholds: {
                        usage_gte: 'currency'
                    },
                    price_data: {
                        currency: 'iso_currency_code',
                        unit_amount: 'currency'
                    },
                    proration_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscription_items'
            },
            'createUsageRecord': {
                arguments: {
                    timestamp: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscription_items/{subscription_item_id}/usage_records'
            },
            'delete': {
                arguments: {
                    clear_usage: 'boolean',
                    proration_date: 'timestamp'
                },
                httpMethod: 'delete',
                path: '/subscription_items/{subscription_item_id}'
            },
            'list': {
                path: '/subscription_items'
            },
            'listUsageRecordSummaries': {
                path: '/subscription_items/{subscription_item_id}/usage_record_summaries'
            },
            'retrieve': {
                path: '/subscription_items/{subscription_item_id}'
            },
            'update': {
                arguments: {
                    billing_thresholds: {
                        usage_gte: 'currency'
                    },
                    off_session: 'boolean',
                    price_data: {
                        currency: 'iso_currency_code',
                        unit_amount: 'currency'
                    },
                    proration_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscription_items/{subscription_item_id}'
            }
        }
    };

}
