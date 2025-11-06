/**
* https://docs.stripe.com/api/payment_method_configurations
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/payment_method_configurations/create
            */
            'create': {
                arguments: {
                    acss_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    active: 'boolean',
                    affirm: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    afterpay_clearpay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    alipay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    apple_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    au_becs_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    bacs_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    bancontact: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    blik: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    boleto: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    card: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    cartes_bancaires: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    cashapp: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    eps: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    fpx: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    giropay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    google_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    grabpay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    ideal: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    jcb: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    klarna: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    konbini: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    link: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    name: 'string',
                    oxxo: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    p24: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    parent: 'string',
                    paypal: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    paynow: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    promptpay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    revolut_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    sepa_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    sofort: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    us_bank_account: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    wechat_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    zip: { display_preference: { preference: 'string' } } // enum: on, off, none
                },
                httpMethod: 'post',
                path: '/payment_method_configurations'
            },
            /**
            * https://docs.stripe.com/api/payment_method_configurations/list
            */
            'list': {
                arguments: {
                    application: 'string',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/payment_method_configurations'
            },
            /**
            * https://docs.stripe.com/api/payment_method_configurations/retrieve
            */
            'retrieve': {
                path: '/payment_method_configurations/{payment_method_configuration_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_method_configurations/update
            */
            'update': {
                arguments: {
                    acss_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    active: 'boolean',
                    affirm: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    afterpay_clearpay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    alipay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    apple_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    au_becs_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    bacs_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    bancontact: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    blik: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    boleto: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    card: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    cartes_bancaires: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    cashapp: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    eps: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    fpx: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    giropay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    google_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    grabpay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    ideal: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    jcb: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    klarna: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    konbini: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    link: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    name: 'string',
                    oxxo: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    p24: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    paypal: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    paynow: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    promptpay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    revolut_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    sepa_debit: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    sofort: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    us_bank_account: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    wechat_pay: { display_preference: { preference: 'string' } }, // enum: on, off, none
                    zip: { display_preference: { preference: 'string' } } // enum: on, off, none
                },
                httpMethod: 'post',
                path: '/payment_method_configurations/{payment_method_configuration_id}'
            }
        }
    };

}
