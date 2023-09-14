component {

    this.metadata = {
        methods: {
            'createFromCalculation': {
                httpMethod: 'post',
                path: '/tax/transactions/create_from_calculation'
            },
            'createReversal': {
                arguments: {
                    flat_amount: 'currency',
                    line_items: {
                        amount: 'currency',
                        amount_tax: 'currency',
                        quantity: 'currency'
                    },
                    shipping_cost: {
                        amount: 'currency',
                        amount_tax: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/tax/transactions/create_reversal'
            },
            'listLineItems': {
                path: '/tax/transactions/{transaction_id}/line_items'
            },
            'retrieve': {
                path: '/tax/transactions/{transaction_id}'
            }
        }
    };

}
