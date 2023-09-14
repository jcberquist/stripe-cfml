component {

    this.metadata = {
        methods: {
            'fail': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/outbound_transfers/{outbound_transfer_id}/fail'
            },
            'post': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/outbound_transfers/{outbound_transfer_id}/post'
            },
            'returnOutboundTransfer': {
                httpMethod: 'post',
                path: '/test_helpers/treasury/outbound_transfers/{outbound_transfer_id}/return'
            }
        }
    };

}
