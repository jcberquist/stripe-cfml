component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    allow_promotion_codes: 'boolean',
                    application_fee_amount: 'currency',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    currency: 'iso_currency_code',
                    custom_fields: {
                        optional: 'boolean'
                    },
                    invoice_creation: {
                        enabled: 'boolean'
                    },
                    line_items: {
                        adjustable_quantity: {
                            enabled: 'boolean'
                        }
                    },
                    phone_number_collection: {
                        enabled: 'boolean'
                    },
                    tax_id_collection: {
                        enabled: 'boolean'
                    },
                    transfer_data: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/payment_links'
            },
            'list': {
                arguments: {
                    active: 'boolean'
                },
                path: '/payment_links'
            },
            'listLineItems': {
                path: '/payment_links/{payment_link_id}/line_items'
            },
            'retrieve': {
                path: '/payment_links/{payment_link_id}'
            },
            'update': {
                arguments: {
                    active: 'boolean',
                    allow_promotion_codes: 'boolean',
                    automatic_tax: {
                        enabled: 'boolean'
                    },
                    custom_fields: {
                        optional: 'boolean'
                    },
                    invoice_creation: {
                        enabled: 'boolean'
                    },
                    line_items: {
                        adjustable_quantity: {
                            enabled: 'boolean'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/payment_links/{payment_link_id}'
            }
        }
    };

}
