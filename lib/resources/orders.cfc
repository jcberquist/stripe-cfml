component {

    this.metadata = {
        methods: {
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
            'pay': {
                arguments: {
                    application_fee: 'currency'
                },
                httpMethod: 'post',
                path: '/orders/{order_id}/pay'
            },
            'retrieve': {
                path: '/orders/{order_id}'
            },
            'returnOrder': {
                arguments: {
                    items: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/orders/{order_id}/returns'
            },
            'update': {
                httpMethod: 'post',
                path: '/orders/{order_id}'
            }
        }
    };

}
