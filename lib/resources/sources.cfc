/**
* https://docs.stripe.com/api/sources
*/
component {

    this.metadata = {
        methods: {
            // @deprecated https://docs.stripe.com/docs/api/sources
            /**
            * https://docs.stripe.com/api/sources/create
            */
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    flow: 'string', // enum: redirect, receiver, code_verification, none
                    mandate: 'struct',
                    metadata: 'struct',
                    owner: 'struct',
                    receiver: 'struct',
                    redirect: 'struct',
                    source_order: 'struct',
                    statement_descriptor: 'string',
                    token: 'string',
                    type: 'string',
                    usage: 'string' // enum: reusable, single_use
                },
                httpMethod: 'post',
                path: '/sources'
            },
            // @deprecated https://docs.stripe.com/docs/api/sources
            /**
            * https://docs.stripe.com/api/source_transactions/list
            */
            'listSourceTransactions': {
                path: '/sources/{source_id}/source_transactions'
            },
            // @deprecated https://docs.stripe.com/docs/api/sources
            /**
            * https://docs.stripe.com/api/sources/retrieve
            */
            'retrieve': {
                arguments: {
                    client_secret: 'string'
                },
                path: '/sources/{source_id}'
            },
            // @deprecated https://docs.stripe.com/docs/api/sources
            /**
            * https://docs.stripe.com/api/sources/update
            */
            'update': {
                arguments: {
                    amount: 'currency',
                    mandate: 'struct',
                    metadata: 'struct',
                    owner: 'struct',
                    source_order: 'struct'
                },
                httpMethod: 'post',
                path: '/sources/{source_id}'
            },
            // @deprecated https://docs.stripe.com/docs/api/sources
            /**
            * https://docs.stripe.com/api/sources/verify
            */
            'verify': {
                httpMethod: 'post',
                path: '/sources/{source_id}/verify'
            }
        }
    };

}
