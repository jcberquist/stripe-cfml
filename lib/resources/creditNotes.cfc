component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    credit_amount: 'currency',
                    refund_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/credit_notes'
            },
            'list': {
                path: '/credit_notes'
            },
            'retrieve': {
                path: '/credit_notes/{credit_note_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/credit_notes/{credit_note_id}'
            },
            'voidCreditNote': {
                httpMethod: 'post',
                path: '/credit_notes/{credit_note_id}/void'
            }
        }
    };

}
