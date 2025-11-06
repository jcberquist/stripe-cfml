/**
* https://docs.stripe.com/api/billing_portal/sessions
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/billing_portal/sessions/create
            */
            'create': {
                arguments: {
                    customer: 'string',
                    configuration: 'string',
                    flow_data: {
                        after_completion: {
                            hosted_confirmation: {
                                custom_message: 'string'
                            },
                            redirect: {
                                return_url: 'string'
                            },
                            type: 'string' // enum: hosted_confirmation, redirect
                        },
                        subscription_cancel: {
                            retention: {
                                coupon: 'string',
                                type: 'string' // enum: coupon
                            },
                            subscription: 'string'
                        },
                        subscription_update: {
                            subscription: 'string'
                        },
                        subscription_update_confirm: {
                            subscription: 'string'
                        },
                        type: 'string' // enum: payment_method_update, subscription_cancel, subscription_update, subscription_update_confirm
                    },
                    locale: 'string', // enum: auto, bg, cs, da, de, el, en, en-AU, en-CA, en-GB, en-IE, en-IN, en-NZ, en-SG, es, es-419, et, fi, fil, fr, fr-CA, hr, hu, id, it, ja, ko, lt, lv, ms, mt, nb, nl, pl, pt, pt-BR, ro, ru, sk, sl, sv, th, tr, vi, zh, zh-HK, zh-TW
                    on_behalf_of: 'string',
                    return_url: 'string'
                },
                httpMethod: 'post',
                path: '/billing_portal/sessions'
            }
        }
    };

}
