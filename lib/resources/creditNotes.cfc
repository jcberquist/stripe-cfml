/**
* https://docs.stripe.com/api/credit_notes
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/credit_notes/create
            */
            'create': {
                arguments: {
                    amount: 'currency',
                    credit_amount: 'currency',
                    effective_at: 'timestamp',
                    invoice: 'string',
                    lines: {
                        _complex: {
                            amount: 'currency',
                            description: 'string',
                            invoice_line_item: 'string',
                            quantity: 'numeric',
                            tax_amounts: 'array',
                            tax_rates: 'array',
                            type: 'string', // enum: custom_line_item, invoice_line_item
                            unit_amount: 'currency',
                            unit_amount_decimal: 'string'
                        }
                    },
                    memo: 'string',
                    metadata: 'struct',
                    out_of_band_amount: 'currency',
                    reason: 'string', // enum: duplicate, fraudulent, order_change, product_unsatisfactory
                    refund: 'string',
                    refund_amount: 'currency',
                    shipping_cost: 'struct'
                },
                httpMethod: 'post',
                path: '/credit_notes'
            },
            /**
            * https://docs.stripe.com/api/credit_notes/list
            */
            'list': {
                arguments: {
                    customer: 'string',
                    ending_before: 'string',
                    invoice: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/credit_notes'
            },
            /**
            * https://docs.stripe.com/api/credit_notes/lines
            */
            'listLineItems': {
                arguments: {
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/credit_notes/{credit_note_id}/lines'
            },
            /**
            * https://docs.stripe.com/api/credit_notes/preview_lines
            */
            'listPreviewLineItems': {
                arguments: {
                    amount: 'currency',
                    credit_amount: 'currency',
                    effective_at: 'timestamp',
                    ending_before: 'string',
                    invoice: 'string',
                    limit: 'numeric',
                    lines: {
                        _complex: {
                            amount: 'currency',
                            description: 'string',
                            invoice_line_item: 'string',
                            quantity: 'numeric',
                            tax_amounts: 'array',
                            tax_rates: 'array',
                            type: 'string', // enum: custom_line_item, invoice_line_item
                            unit_amount: 'currency',
                            unit_amount_decimal: 'string'
                        }
                    },
                    memo: 'string',
                    metadata: 'struct',
                    out_of_band_amount: 'currency',
                    reason: 'string', // enum: duplicate, fraudulent, order_change, product_unsatisfactory
                    refund: 'string',
                    refund_amount: 'currency',
                    shipping_cost: 'struct',
                    starting_after: 'string'
                },
                path: '/credit_notes/preview/lines'
            },
            /**
            * https://docs.stripe.com/api/credit_notes/preview
            */
            'preview': {
                arguments: {
                    amount: 'currency',
                    credit_amount: 'currency',
                    effective_at: 'timestamp',
                    invoice: 'string',
                    lines: {
                        _complex: {
                            amount: 'currency',
                            description: 'string',
                            invoice_line_item: 'string',
                            quantity: 'numeric',
                            tax_amounts: 'array',
                            tax_rates: 'array',
                            type: 'string', // enum: custom_line_item, invoice_line_item
                            unit_amount: 'currency',
                            unit_amount_decimal: 'string'
                        }
                    },
                    memo: 'string',
                    metadata: 'struct',
                    out_of_band_amount: 'currency',
                    reason: 'string', // enum: duplicate, fraudulent, order_change, product_unsatisfactory
                    refund: 'string',
                    refund_amount: 'currency',
                    shipping_cost: 'struct'
                },
                path: '/credit_notes/preview'
            },
            /**
            * https://docs.stripe.com/api/credit_notes/retrieve
            */
            'retrieve': {
                path: '/credit_notes/{credit_note_id}'
            },
            /**
            * https://docs.stripe.com/api/credit_notes/update
            */
            'update': {
                arguments: {
                    memo: 'string',
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/credit_notes/{credit_note_id}'
            },
            /**
            * https://docs.stripe.com/api/credit_notes/void
            */
            'voidCreditNote': {
                httpMethod: 'post',
                path: '/credit_notes/{credit_note_id}/void'
            }
        }
    };

}
