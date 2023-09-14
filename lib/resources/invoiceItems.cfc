component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    discountable: 'boolean',
                    period: {
                        end: 'timestamp',
                        start: 'timestamp'
                    },
                    price_data: {
                        currency: 'iso_currency_code',
                        unit_amount: 'currency'
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
                    created: 'datefilter',
                    pending: 'boolean'
                },
                path: '/invoiceitems'
            },
            'retrieve': {
                path: '/invoiceitems/{invoiceitem_id}'
            },
            'update': {
                arguments: {
                    amount: 'currency',
                    discountable: 'boolean',
                    period: {
                        end: 'timestamp',
                        start: 'timestamp'
                    },
                    price_data: {
                        currency: 'iso_currency_code',
                        unit_amount: 'currency'
                    },
                    unit_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/invoiceitems/{invoiceitem_id}'
            }
        }
    };

}
