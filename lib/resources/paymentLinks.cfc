component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    application_fee_amount: 'currency',
                    currency: 'iso_currency_code',
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_links'
            },
            'list': {
                path: '/payment_links'
            },
            'listLineItems': {
                path: '/payment_links/{payment_link_id}/line_items'
            },
            'retrieve': {
                path: '/payment_links/{payment_link_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/payment_links/{payment_link_id}'
            }
        }
    };

}
