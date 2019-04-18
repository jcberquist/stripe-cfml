component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    application_fee: 'currency',
                    due_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/invoices'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/invoices/{invoice_id}'
            },
            'list': {
                arguments: {
                    date: 'datefilter',
                    due_date: 'datefilter'
                },
                path: '/invoices'
            },
            'markUncollectible': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/mark_uncollectible'
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
                    subscription_proration_date: 'timestamp',
                    subscription_trial_end: 'timestamp',
                    invoice_items: {
                        amount: 'currency'
                    }
                },
                path: '/invoices/upcoming',
                positionalArgs: [
                    'customer'
                ]
            },
            'update': {
                arguments: {
                    application_fee: 'currency',
                    due_date: 'timestamp',
                    proration_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}'
            },
            'void': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/void'
            }
        }
    };

}
