component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/orders/{order_id}/cancel'
            },
            'create': {
                arguments: {
                    currency: 'iso_currency_code',
                    items: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/orders'
            },
            'list': {
                arguments: {
                    created: 'datefilter',
                    status_transitions: {
                        canceled: 'datefilter',
                        fulfilled: 'datefilter',
                        paid: 'datefilter',
                        returned: 'datefilter'
                    }
                },
                path: '/orders'
            },
            'listLineItems': {
                path: '/orders/{order_id}/line_items'
            },
            'reopen': {
                httpMethod: 'post',
                path: '/orders/{order_id}/reopen'
            },
            'retrieve': {
                path: '/orders/{order_id}'
            },
            'submit': {
                arguments: {
                    expected_total: 'currency'
                },
                httpMethod: 'post',
                path: '/orders/{order_id}/submit'
            },
            'update': {
                httpMethod: 'post',
                path: '/orders/{order_id}'
            }
        }
    };

}
