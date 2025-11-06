/**
* https://docs.stripe.com/api/prices
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/prices/create
            */
            'create': {
                arguments: {
                    active: 'boolean',
                    billing_scheme: 'string', // enum: per_unit, tiered
                    currency: 'iso_currency_code',
                    currency_options: 'struct',
                    custom_unit_amount: {
                        enabled: 'boolean',
                        maximum: 'currency',
                        minimum: 'currency',
                        preset: 'currency'
                    },
                    lookup_key: 'string',
                    metadata: 'struct',
                    nickname: 'string',
                    product: 'string',
                    product_data: {
                        active: 'boolean',
                        id: 'string',
                        metadata: 'struct',
                        name: 'string',
                        statement_descriptor: 'string',
                        tax_code: 'string',
                        unit_label: 'string'
                    },
                    recurring: {
                        aggregate_usage: 'string', // enum: sum, last_during_period, last_ever, max
                        interval: 'string', // enum: day, week, month, year
                        interval_count: 'numeric',
                        meter: 'string',
                        usage_type: 'string' // enum: metered, licensed
                    },
                    tax_behavior: 'string', // enum: exclusive, inclusive, unspecified
                    tiers: {
                        _complex: {
                            flat_amount: 'currency',
                            flat_amount_decimal: 'string',
                            unit_amount: 'currency',
                            unit_amount_decimal: 'string',
                            up_to: 'numeric'
                        }
                    },
                    tiers_mode: 'string', // enum: graduated, volume
                    transfer_lookup_key: 'boolean',
                    transform_quantity: {
                        divide_by: 'numeric',
                        round: 'string' // enum: up, down
                    },
                    unit_amount: 'currency',
                    unit_amount_decimal: 'string'
                },
                httpMethod: 'post',
                path: '/prices'
            },
            /**
            * https://docs.stripe.com/api/prices/list
            */
            'list': {
                arguments: {
                    active: 'boolean',
                    created: 'datefilter',
                    currency: 'iso_currency_code',
                    ending_before: 'string',
                    limit: 'numeric',
                    lookup_keys: 'array',
                    product: 'string',
                    recurring: 'struct',
                    starting_after: 'string',
                    type: 'string' // enum: one_time, recurring
                },
                path: '/prices'
            },
            /**
            * https://docs.stripe.com/api/prices/retrieve
            */
            'retrieve': {
                path: '/prices/{price_id}'
            },
            /**
            * https://docs.stripe.com/api/prices/search
            */
            'search': {
                arguments: {
                    query: 'string',
                    limit: 'numeric',
                    page: 'string'
                },
                path: '/prices/search'
            },
            /**
            * https://docs.stripe.com/api/prices/update
            */
            'update': {
                arguments: {
                    active: 'boolean',
                    currency_options: 'struct',
                    lookup_key: 'string',
                    metadata: 'struct',
                    nickname: 'string',
                    tax_behavior: 'string', // enum: exclusive, inclusive, unspecified
                    transfer_lookup_key: 'boolean'
                },
                httpMethod: 'post',
                path: '/prices/{price_id}'
            }
        }
    };

}
