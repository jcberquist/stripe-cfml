component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    credit_amount: 'currency',
                    lines: {
                        amount: 'currency',
                        unit_amount: 'currency',
                        unit_amount_decimal: 'currency'
                    },
                    out_of_band_amount: 'currency',
                    refund_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/credit_notes'
            },
            'list': {
                path: '/credit_notes'
            },
            'listLineItems': {
                path: '/credit_notes/{credit_note_id}/lines'
            },
            'listPreviewLineItems': {
                arguments: {
                    amount: 'currency',
                    credit_amount: 'currency',
                    lines: {
                        amount: 'currency',
                        unit_amount: 'currency',
                        unit_amount_decimal: 'currency'
                    },
                    out_of_band_amount: 'currency',
                    refund_amount: 'currency'
                },
                path: '/credit_notes/preview/lines'
            },
            'preview': {
                arguments: {
                    amount: 'currency',
                    credit_amount: 'currency',
                    lines: {
                        amount: 'currency',
                        unit_amount: 'currency',
                        unit_amount_decimal: 'currency'
                    },
                    out_of_band_amount: 'currency',
                    refund_amount: 'currency'
                },
                path: '/credit_notes/preview'
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
