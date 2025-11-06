/**
* https://docs.stripe.com/api/tax_codes
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/tax_codes/list
            */
            'list': {
                arguments: {
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/tax_codes'
            },
            /**
            * https://docs.stripe.com/api/tax_codes/retrieve
            */
            'retrieve': {
                path: '/tax_codes/{tax_code_id}'
            }
        }
    };

}
