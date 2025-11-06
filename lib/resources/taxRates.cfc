/**
* https://docs.stripe.com/api/tax_rates
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/tax_rates/create
            */
            'create': {
                arguments: {
                    active: 'boolean',
                    country: 'string',
                    description: 'string',
                    display_name: 'string',
                    inclusive: 'boolean',
                    jurisdiction: 'string',
                    metadata: 'struct',
                    percentage: 'numeric',
                    state: 'string',
                    tax_type: 'string' // enum: jct, gst, pst, qst, rst, vat, sales_tax
                },
                httpMethod: 'post',
                path: '/tax_rates'
            },
            /**
            * https://docs.stripe.com/api/tax_rates/list
            */
            'list': {
                arguments: {
                    active: 'boolean',
                    created: 'datefilter',
                    ending_before: 'string',
                    inclusive: 'boolean',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/tax_rates'
            },
            /**
            * https://docs.stripe.com/api/tax_rates/retrieve
            */
            'retrieve': {
                path: '/tax_rates/{tax_rate_id}'
            },
            /**
            * https://docs.stripe.com/api/tax_rates/update
            */
            'update': {
                arguments: {
                    active: 'boolean',
                    country: 'string',
                    description: 'string',
                    display_name: 'string',
                    jurisdiction: 'string',
                    metadata: 'struct',
                    state: 'string',
                    tax_type: 'string' // enum: jct, gst, pst, qst, rst, vat, sales_tax
                },
                httpMethod: 'post',
                path: '/tax_rates/{tax_rate_id}'
            }
        }
    };

}
