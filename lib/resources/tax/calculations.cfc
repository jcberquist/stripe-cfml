component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    currency: 'iso_currency_code',
                    line_items: {
                        amount: 'currency',
                        quantity: 'currency'
                    },
                    shipping_cost: {
                        amount: 'currency'
                    },
                    tax_date: 'timestamp'
                },
                httpMethod: 'post',
                path: '/tax/calculations'
            },
            'listLineItems': {
                path: '/tax/calculations/{calculation_id}/line_items'
            }
        }
    };

}
