/**
* https://docs.stripe.com/api/payment_methods
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/payment_methods/attach
            */
            'attach': {
                arguments: {
                    customer: 'string'
                },
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}/attach'
            },
            /**
            * https://docs.stripe.com/api/payment_methods/create
            */
            'create': {
                arguments: {
                    acss_debit: {
                        account_number: 'string',
                        institution_number: 'string',
                        transit_number: 'string'
                    },
                    affirm: {},
                    afterpay_clearpay: {},
                    alipay: {},
                    au_becs_debit: {
                        account_number: 'string',
                        bsb_number: 'string'
                    },
                    bacs_debit: {
                        account_number: 'string',
                        sort_code: 'string'
                    },
                    bancontact: {},
                    billing_details: {
                        address: {
                            city: 'string',
                            country: 'string',
                            line1: 'string',
                            line2: 'string',
                            postal_code: 'string',
                            state: 'string'
                        },
                        email: 'string',
                        name: 'string',
                        phone: 'string',
                        tax_id: 'string'
                    },
                    boleto: {
                        tax_id: 'string'
                    },
                    card: {
                        cvc: 'string',
                        exp_month: 'numeric',
                        exp_year: 'numeric',
                        number: 'string'
                    },
                    cashapp: {},
                    customer: 'string',
                    customer_balance: {},
                    eps: {
                        bank: 'string'
                    },
                    fpx: {
                        bank: 'string'
                    },
                    giropay: {},
                    grabpay: {},
                    ideal: {
                        bank: 'string'
                    },
                    interac_present: {},
                    klarna: {
                        dob: {
                            day: 'numeric',
                            month: 'numeric',
                            year: 'numeric'
                        }
                    },
                    konbini: {},
                    link: {},
                    metadata: 'struct',
                    oxxo: {},
                    'p24': {
                        bank: 'string'
                    },
                    paynow: {},
                    paypal: {},
                    pix: {},
                    promptpay: {},
                    radar_options: {
                        session: 'string'
                    },
                    revolut_pay: {},
                    sepa_debit: {
                        iban: 'string'
                    },
                    sofort: {
                        country: 'string' // enum: AT, BE, DE, ES, IT, NL
                    },
                    type: 'string', // enum: acss_debit, affirm, afterpay_clearpay, alipay, au_becs_debit, bacs_debit, bancontact, blik, boleto, card, cashapp, customer_balance, eps, fpx, giropay, grabpay, ideal, klarna, konbini, link, oxxo, p24, paynow, paypal, pix, promptpay, revolut_pay, sepa_debit, sofort, us_bank_account, wechat_pay, zip
                    us_bank_account: {
                        account_holder_type: 'string', // enum: company, individual
                        account_number: 'string',
                        account_type: 'string', // enum: checking, savings
                        financial_connections_account: 'string',
                        routing_number: 'string'
                    },
                    wechat_pay: {},
                    zip: {}
                },
                httpMethod: 'post',
                path: '/payment_methods'
            },
            /**
            * https://docs.stripe.com/api/payment_methods/detach
            */
            'detach': {
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}/detach'
            },
            /**
            * https://docs.stripe.com/api/payment_methods/list
            */
            'list': {
                arguments: {
                    allow_redisplay: 'string', // enum: always, limited, unspecified
                    customer: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string',
                    type: 'string' // enum: acss_debit, affirm, afterpay_clearpay, alipay, au_becs_debit, bacs_debit, bancontact, blik, boleto, card, cashapp, customer_balance, eps, fpx, giropay, grabpay, ideal, klarna, konbini, link, oxxo, p24, paynow, paypal, pix, promptpay, revolut_pay, sepa_debit, sofort, us_bank_account, wechat_pay, zip
                },
                path: '/payment_methods'
            },
            /**
            * https://docs.stripe.com/api/payment_methods/retrieve
            */
            'retrieve': {
                arguments: {
                    customer: 'string'
                },
                path: '/payment_methods/{payment_method_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_methods/update
            */
            'update': {
                arguments: {
                    allow_redisplay: 'string', // enum: always, limited, unspecified
                    billing_details: {
                        address: {
                            city: 'string',
                            country: 'string',
                            line1: 'string',
                            line2: 'string',
                            postal_code: 'string',
                            state: 'string'
                        },
                        email: 'string',
                        name: 'string',
                        phone: 'string',
                        tax_id: 'string'
                    },
                    card: {
                        exp_month: 'numeric',
                        exp_year: 'numeric',
                        networks: {
                            preferred: 'string' // enum: cartes_bancaires, mastercard, visa
                        }
                    },
                    link: {},
                    metadata: 'struct',
                    us_bank_account: {
                        account_holder_type: 'string', // enum: company, individual
                        account_type: 'string' // enum: checking, savings
                    }
                },
                httpMethod: 'post',
                path: '/payment_methods/{payment_method_id}'
            }
        }
    };

}
