/**
* https://docs.stripe.com/api/payouts
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/payouts/cancel
            */
            'cancel': {
                httpMethod: 'post',
                path: '/payouts/{payout_id}/cancel'
            },
            /**
            * https://docs.stripe.com/api/payouts/create
            */
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    description: 'string',
                    destination: 'string',
                    metadata: 'struct',
                    method: 'string', // enum: standard, instant
                    source_type: 'string', // enum: bank_account, card, fpx
                    statement_descriptor: 'string'
                },
                httpMethod: 'post',
                path: '/payouts'
            },
            /**
            * https://docs.stripe.com/api/payouts/list
            */
            'list': {
                arguments: {
                    arrival_date: 'datefilter',
                    created: 'datefilter',
                    destination: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string',
                    status: 'string' // enum: pending, paid, failed, canceled
                },
                path: '/payouts'
            },
            /**
            * https://docs.stripe.com/api/payouts/retrieve
            */
            'retrieve': {
                path: '/payouts/{payout_id}'
            },
            /**
            * https://docs.stripe.com/api/payouts/reverse
            */
            'reverse': {
                arguments: {
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/payouts/{payout_id}/reverse'
            },
            /**
            * https://docs.stripe.com/api/payouts/update
            */
            'update': {
                arguments: {
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/payouts/{payout_id}'
            }
        }
    };

}
