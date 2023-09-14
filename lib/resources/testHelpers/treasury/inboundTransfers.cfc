component {

    this.metadata = {
        methods: {
            'fail': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/inbound_transfers/{inbound_transfer_id}/fail'
            },
            'returnInboundTransfer': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/inbound_transfers/{inbound_transfer_id}/return'
            },
            'succeed': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/inbound_transfers/{inbound_transfer_id}/succeed'
            }
        }
    };

}
