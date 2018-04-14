component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'create': {
                arguments: {
                    application_fee: 'currency',
                    due_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/invoices'
            },
            'list': {
                arguments: {
                    date: 'datefilter',
                    due_date: 'datefilter'
                },
                path: '/invoices'
            },
            'pay': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/pay'
            },
            'retrieve': {
                path: '/invoices/{invoice_id}'
            },
            'retrieveLines': {
                arguments: {
                    subscription_proration_date: 'timestamp',
                    subscription_trial_end: 'timestamp'
                },
                path: '/invoices/{invoice_id}/lines'
            },
            'retrieveUpcoming': {
                arguments: {
                    invoice_items: {
                        amount: 'currency'
                    }
                },
                path: '/invoices/{invoice_id}/upcoming'
            },
            'update': {
                arguments: {
                    application_fee: 'currency',
                    due_date: 'timestamp',
                    proration_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}'
            }
        }
    };

}
