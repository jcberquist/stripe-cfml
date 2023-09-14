component {

    this.metadata = {
        methods: {
            'cancel': {
                httpMethod: 'post',
                path: '/treasury/inbound_transfers/{inbound_transfer_id}/cancel'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/treasury/inbound_transfers'
            },
            'list': {
                path: '/treasury/inbound_transfers'
            },
            'retrieve': {
                path: '/treasury/inbound_transfers/{inbound_transfer_id}'
            }
        }
    };

}
