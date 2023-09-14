component {

    this.metadata = {
        methods: {
            'deliverCard': {
                httpMethod: 'post',
                path: '/test_helpers/issuing/cards/{card_id}/shipping/deliver'
            },
            'failCard': {
                httpMethod: 'post',
                path: '/test_helpers/issuing/cards/{card_id}/shipping/fail'
            },
            'returnCard': {
                httpMethod: 'post',
                path: '/test_helpers/issuing/cards/{card_id}/shipping/return'
            },
            'shipCard': {
                httpMethod: 'post',
                path: '/test_helpers/issuing/cards/{card_id}/shipping/ship'
            }
        }
    };

}
