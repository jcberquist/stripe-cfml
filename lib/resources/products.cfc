/**
* https://docs.stripe.com/api/products
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/products/create
            */
            'create': {
                arguments: {
                    active: 'boolean',
                    default_price_data: {
                        currency: 'iso_currency_code',
                        currency_options: 'struct',
                        recurring: 'struct',
                        tax_behavior: 'string', // enum: exclusive, inclusive, unspecified
                        unit_amount: 'currency',
                        unit_amount_decimal: 'string'
                    },
                    description: 'string',
                    id: 'string',
                    images: 'array',
                    metadata: 'struct',
                    name: 'string',
                    package_dimensions: 'struct',
                    shippable: 'boolean',
                    statement_descriptor: 'string',
                    tax_code: 'string',
                    type: 'string', // enum: service, good
                    unit_label: 'string',
                    url: 'string'
                },
                httpMethod: 'post',
                path: '/products'
            },
            /**
            * https://docs.stripe.com/api/products/delete
            */
            'delete': {
                httpMethod: 'delete',
                path: '/products/{product_id}'
            },
            /**
            * https://docs.stripe.com/api/products/list
            */
            'list': {
                arguments: {
                    active: 'boolean',
                    created: 'datefilter',
                    ending_before: 'string',
                    ids: 'array',
                    limit: 'numeric',
                    shippable: 'boolean',
                    starting_after: 'string',
                    url: 'string'
                },
                path: '/products'
            },
            /**
            * https://docs.stripe.com/api/products/retrieve
            */
            'retrieve': {
                path: '/products/{product_id}'
            },
            /**
            * https://docs.stripe.com/api/products/search
            */
            'search': {
                arguments: {
                    query: 'string',
                    limit: 'numeric',
                    page: 'string'
                },
                path: '/products/search'
            },
            /**
            * https://docs.stripe.com/api/products/update
            */
            'update': {
                arguments: {
                    active: 'boolean',
                    default_price: 'string',
                    description: 'string',
                    images: 'array',
                    metadata: 'struct',
                    name: 'string',
                    package_dimensions: 'struct',
                    shippable: 'boolean',
                    statement_descriptor: 'string',
                    tax_code: 'string',
                    unit_label: 'string',
                    url: 'string'
                },
                httpMethod: 'post',
                path: '/products/{product_id}'
            }
        }
    };

}
