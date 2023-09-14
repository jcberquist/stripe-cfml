component {

    this.metadata = {
        methods: {
            'fundCashBalance': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code'
                },
                httpMethod: 'post',
                path: '/test_helpers/customers/{customer_id}/fund_cash_balance'
            }
        }
    };

}
