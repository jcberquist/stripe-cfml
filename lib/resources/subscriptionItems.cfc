component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
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
                    proration_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/subscription_items/{subscription_item_id}'
            }
        }
    };

}
