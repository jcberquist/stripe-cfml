component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/treasury/outbound_transfers/{outbound_transfer_id}/cancel'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/treasury/outbound_transfers'
            },
            'list': {
                path: '/treasury/outbound_transfers'
            },
            'retrieve': {
                path: '/treasury/outbound_transfers/{outbound_transfer_id}'
            }
        }
    };

}
