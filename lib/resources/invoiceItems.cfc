component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    period: {
                        end: 'timestamp',
                        start: 'timestamp'
                    },
                    unit_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/invoiceitems'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/invoiceitems/{invoiceitem_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/invoiceitems'
            },
            'retrieve': {
                path: '/invoiceitems/{invoiceitem_id}'
            },
            'update': {
                arguments: {
                    amount: 'currency',
                    period: {
                        end: 'timestamp',
                        start: 'timestamp'
                    },
                    unit_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/invoiceitems/{invoiceitem_id}'
            }
        }
    };

}
