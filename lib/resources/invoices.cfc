component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    application_fee: 'currency',
                    application_fee_amount: 'currency',
                    due_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/invoices'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/invoices/{invoice_id}'
            },
            'finalizeInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/finalize'
            },
            'list': {
                arguments: {
                    date: 'datefilter',
                    due_date: 'datefilter'
                },
                path: '/invoices'
            },
            'listLineItems': {
                arguments: {
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp'
                },
                path: '/invoices/{invoice_id}/lines'
            },
            'listUpcomingLineItems': {
                arguments: {
                    invoice_items: {
                        amount: 'currency'
                    },
                    subscription_billing_cycle_anchor: 'timestamp',
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp'
                },
                path: '/invoices/upcoming/lines'
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
            'retrieveUpcoming': {
                arguments: {
                    invoice_items: {
                        amount: 'currency'
                    },
                    subscription_billing_cycle_anchor: 'timestamp',
                    subscription_proration_date: 'timestamp',
                    subscription_start_date: 'timestamp',
                    subscription_trial_end: 'timestamp'
                },
                path: '/invoices/upcoming'
            },
            'sendInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/send'
            },
            'update': {
                arguments: {
                    application_fee: 'currency',
                    application_fee_amount: 'currency',
                    due_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/invoices/{invoice_id}'
            },
            'voidInvoice': {
                httpMethod: 'post',
                path: '/invoices/{invoice_id}/void'
            }
        }
    };

}
