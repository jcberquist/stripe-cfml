/**
* https://docs.stripe.com/api/customers
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/customers/create
            */
            'create': {
                arguments: {
                    address: {
                        city: 'string',
                        country: 'string',
                        line1: 'string',
                        line2: 'string',
                        postal_code: 'string',
                        state: 'string'
                    },
                    balance: 'currency',
                    cash_balance: {
                        settings: {
                            reconciliation_mode: 'string' // enum: automatic, manual, merchant_default
                        }
                    },
                    description: 'string',
                    email: 'string',
                    invoice_prefix: 'string',
                    invoice_settings: {
                        custom_fields: {
                            _complex: {
                                name: 'string',
                                value: 'string'
                            }
                        },
                        default_payment_method: 'string',
                        footer: 'string',
                        rendering_options: {
                            amount_tax_display: 'string' // enum: exclude_tax, include_inclusive_tax
                        }
                    },
                    metadata: 'struct',
                    name: 'string',
                    next_invoice_sequence: 'numeric',
                    payment_method: 'string',
                    phone: 'string',
                    preferred_locales: 'array',
                    promotion_code: 'string',
                    shipping: {
                        address: {
                            city: 'string',
                            country: 'string',
                            line1: 'string',
                            line2: 'string',
                            postal_code: 'string',
                            state: 'string'
                        },
                        name: 'string',
                        phone: 'string'
                    },
                    source: 'string',
                    tax: {
                        ip_address: 'string',
                        validate_location: 'string' // enum: auto, deferred, immediately
                    },
                    tax_exempt: 'string', // enum: none, exempt, reverse
                    tax_id_data: {
                        _complex: {
                            type: 'string',
                            value: 'string'
                        }
                    },
                    test_clock: 'string'
                },
                httpMethod: 'post',
                path: '/customers'
            },
            /**
            * https://docs.stripe.com/api/customer_balance_transactions/create
            */
            'createBalanceTransaction': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    description: 'string',
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/balance_transactions'
            },
            /**
            * https://docs.stripe.com/api/cash_balance_transactions/create_or_retrieve_funding_instructions
            */
            'createFundingInstructions': {
                arguments: {
                    bank_transfer: {
                        eu_bank_transfer: {
                            country: 'string'
                        },
                        requested_address_types: 'array',
                        type: 'string' // enum: eu_bank_transfer, gb_bank_transfer, jp_bank_transfer, mx_bank_transfer, us_bank_transfer
                    },
                    currency: 'iso_currency_code',
                    funding_type: 'string' // enum: bank_transfer
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/funding_instructions'
            },
            /**
            * https://docs.stripe.com/api/customer_bank_accounts/create
            */
            'createSource': {
                arguments: {
                    source: {
                        account_holder_name: 'string',
                        account_holder_type: 'string', // enum: individual, company
                        account_number: 'string',
                        address_city: 'string',
                        address_country: 'string',
                        address_line1: 'string',
                        address_line2: 'string',
                        address_state: 'string',
                        address_zip: 'string',
                        country: 'string',
                        currency: 'iso_currency_code',
                        cvc: 'string',
                        exp_month: 'string',
                        exp_year: 'string',
                        name: 'string',
                        number: 'string',
                        object: 'string', // enum: bank_account, card
                        routing_number: 'string'
                    },
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/sources'
            },
            /**
            * https://docs.stripe.com/api/tax_ids/create
            */
            'createTaxId': {
                arguments: {
                    type: 'string',
                    value: 'string'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/tax_ids'
            },
            /**
            * https://docs.stripe.com/api/customers/delete
            */
            'delete': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}'
            },
            /**
            * https://docs.stripe.com/api/discounts/delete
            */
            'deleteDiscount': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}/discount'
            },
            /**
            * https://docs.stripe.com/api/customer_bank_accounts/delete
            */
            'deleteSource': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}/sources/{source_id}'
            },
            /**
            * https://docs.stripe.com/api/tax_ids/delete
            */
            'deleteTaxId': {
                httpMethod: 'delete',
                path: '/customers/{customer_id}/tax_ids/{tax_id}'
            },
            /**
            * https://docs.stripe.com/api/customers/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    email: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string',
                    test_clock: 'string'
                },
                path: '/customers'
            },
            /**
            * https://docs.stripe.com/api/customer_balance_transactions/list
            */
            'listBalanceTransactions': {
                arguments: {
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/customers/{customer_id}/balance_transactions'
            },
            /**
            * https://docs.stripe.com/api/cash_balance_transactions/list
            */
            'listCashBalanceTransactions': {
                arguments: {
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/customers/{customer_id}/cash_balance_transactions'
            },
            /**
            * https://docs.stripe.com/api/payment_methods/customer_list
            */
            'listPaymentMethods': {
                path: '/customers/{customer_id}/payment_methods'
            },
            /**
            * https://docs.stripe.com/api/customer_bank_accounts/list
            */
            'listSources': {
                arguments: {
                    ending_before: 'string',
                    limit: 'numeric',
                    object: 'string', // enum: card, bank_account
                    starting_after: 'string'
                },
                path: '/customers/{customer_id}/sources'
            },
            /**
            * https://docs.stripe.com/api/tax_ids/list
            */
            'listTaxIds': {
                path: '/customers/{customer_id}/tax_ids'
            },
            /**
            * https://docs.stripe.com/api/customers/retrieve
            */
            'retrieve': {
                path: '/customers/{customer_id}'
            },
            /**
            * https://docs.stripe.com/api/customer_balance_transactions/retrieve
            */
            'retrieveBalanceTransaction': {
                path: '/customers/{customer_id}/balance_transactions/{balance_transaction_id}'
            },
            /**
            * https://docs.stripe.com/api/cash_balance/retrieve
            */
            'retrieveCashBalance': {
                path: '/customers/{customer_id}/cash_balance'
            },
            /**
            * https://docs.stripe.com/api/cash_balance_transactions/retrieve
            */
            'retrieveCashBalanceTransaction': {
                path: '/customers/{customer_id}/cash_balance_transactions/{cash_balance_transaction_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_methods/customer
            */
            'retrievePaymentMethod': {
                path: '/customers/{customer_id}/payment_methods/{payment_method_id}'
            },
            /**
            * https://docs.stripe.com/api/customer_bank_accounts/retrieve
            */
            'retrieveSource': {
                path: '/customers/{customer_id}/sources/{source_id}'
            },
            /**
            * https://docs.stripe.com/api/tax_ids/retrieve
            */
            'retrieveTaxId': {
                path: '/customers/{customer_id}/tax_ids/{tax_id}'
            },
            /**
            * https://docs.stripe.com/api/customers/search
            */
            'search': {
                arguments: {
                    query: 'string',
                    limit: 'numeric',
                    page: 'string'
                },
                path: '/customers/search'
            },
            /**
            * https://docs.stripe.com/api/customers/update
            */
            'update': {
                arguments: {
                    address: {
                        city: 'string',
                        country: 'string',
                        line1: 'string',
                        line2: 'string',
                        postal_code: 'string',
                        state: 'string'
                    },
                    balance: 'currency',
                    business_name: 'string',
                    cash_balance: {
                        settings: {
                            reconciliation_mode: 'string' // enum: automatic, manual, merchant_default
                        }
                    },
                    description: 'string',
                    email: 'string',
                    individual_name: 'string',
                    invoice_prefix: 'string',
                    invoice_settings: {
                        custom_fields: {
                            _complex: {
                                name: 'string',
                                value: 'string'
                            }
                        },
                        default_payment_method: 'string',
                        footer: 'string',
                        rendering_options: {
                            amount_tax_display: 'string' // enum: exclude_tax, include_inclusive_tax
                        }
                    },
                    metadata: 'struct',
                    name: 'string',
                    next_invoice_sequence: 'numeric',
                    phone: 'string',
                    preferred_locales: 'array',
                    promotion_code: 'string',
                    shipping: {
                        address: {
                            city: 'string',
                            country: 'string',
                            line1: 'string',
                            line2: 'string',
                            postal_code: 'string',
                            state: 'string'
                        },
                        name: 'string',
                        phone: 'string'
                    },
                    source: 'string',
                    tax: {
                        ip_address: 'string',
                        validate_location: 'string' // enum: auto, deferred, immediately
                    },
                    tax_exempt: 'string' // enum: none, exempt, reverse
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}'
            },
            /**
            * https://docs.stripe.com/api/customer_balance_transactions/update
            */
            'updateBalanceTransaction': {
                arguments: {
                    description: 'string',
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/balance_transactions/{balance_transaction_id}'
            },
            /**
            * https://docs.stripe.com/api/cash_balance/update
            */
            'updateCashBalance': {
                arguments: {
                    settings: {
                        reconciliation_mode: 'string' // enum: automatic, manual, merchant_default
                    }
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/cash_balance'
            },
            /**
            * https://docs.stripe.com/api/customer_bank_accounts/update
            */
            'updateSource': {
                arguments: {
                    account_holder_name: 'string',
                    account_holder_type: 'string', // enum: individual, company
                    address_city: 'string',
                    address_country: 'string',
                    address_line1: 'string',
                    address_line2: 'string',
                    address_state: 'string',
                    address_zip: 'string',
                    exp_month: 'string',
                    exp_year: 'string',
                    metadata: 'struct',
                    name: 'string'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/sources/{source_id}'
            },
            /**
            * https://docs.stripe.com/api/customer_bank_accounts/verify
            */
            'verifySource': {
                arguments: {
                    amounts: 'array'
                },
                httpMethod: 'post',
                path: '/customers/{customer_id}/sources/{source_id}/verify'
            }
        }
    };

}
