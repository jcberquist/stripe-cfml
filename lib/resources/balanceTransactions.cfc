/**
* https://docs.stripe.com/api/balance_transactions
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/balance_transactions/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    currency: 'iso_currency_code',
                    ending_before: 'string',
                    limit: 'numeric',
                    payout: 'string',
                    source: 'string',
                    starting_after: 'string',
                    type: 'string' // enum: charge, refund, adjustment, payout, payout_failure, transfer, transfer_refund, ...
                },
                path: '/balance_transactions'
            },
            /**
            * https://docs.stripe.com/api/balance_transactions/retrieve
            */
            'retrieve': {
                path: '/balance_transactions/{balance_transaction_id}'
            }
        }
    };

}
