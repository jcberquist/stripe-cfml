/**
* https://docs.stripe.com/api/tokens
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/tokens/create
            */
            'create': {
                arguments: {
                    account: {
                        company: {
                            directors_provided: 'boolean',
                            executives_provided: 'boolean',
                            owners_provided: 'boolean',
                            ownership_declaration: {
                                date: 'timestamp'
                            },
                            ownership_declaration_shown_and_signed: 'boolean'
                        },
                        individual: {
                            relationship: {
                                director: 'boolean',
                                executive: 'boolean',
                                owner: 'boolean'
                            }
                        },
                        tos_shown_and_accepted: 'boolean'
                    },
                    bank_account: {
                        account_holder_name: 'string',
                        account_holder_type: 'string', // enum: individual, company
                        account_number: 'string',
                        country: 'string',
                        currency: 'iso_currency_code',
                        routing_number: 'string'
                    },
                    card: {
                        address_city: 'string',
                        address_country: 'string',
                        address_line1: 'string',
                        address_line2: 'string',
                        address_state: 'string',
                        address_zip: 'string',
                        currency: 'iso_currency_code',
                        cvc: 'string',
                        exp_month: 'string',
                        exp_year: 'string',
                        name: 'string',
                        number: 'string'
                    },
                    customer: 'string',
                    cvc_update: {
                        cvc: 'string'
                    },
                    person: {
                        additional_tos_acceptances: {
                            account: {
                                date: 'timestamp'
                            }
                        },
                        relationship: {
                            director: 'boolean',
                            executive: 'boolean',
                            legal_guardian: 'boolean',
                            owner: 'boolean',
                            representative: 'boolean'
                        }
                    },
                    pii: {
                        id_number: 'string'
                    }
                },
                httpMethod: 'post',
                path: '/tokens'
            },
            /**
            * https://docs.stripe.com/api/tokens/retrieve
            */
            'retrieve': {
                path: '/tokens/{token_id}'
            }
        }
    };

}
