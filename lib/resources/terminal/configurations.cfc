component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    offline: {
                        enabled: 'boolean'
                    },
                    tipping: {
                        aud: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        cad: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        chf: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        czk: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        dkk: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        eur: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        gbp: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        hkd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        myr: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        nok: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        nzd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        sek: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        sgd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        usd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/terminal/configurations'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/terminal/configurations/{configuration_id}'
            },
            'list': {
                arguments: {
                    is_account_default: 'boolean'
                },
                path: '/terminal/configurations'
            },
            'retrieve': {
                path: '/terminal/configurations/{configuration_id}'
            },
            'update': {
                arguments: {
                    offline: {
                        enabled: 'boolean'
                    },
                    tipping: {
                        aud: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        cad: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        chf: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        czk: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        dkk: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        eur: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        gbp: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        hkd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        myr: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        nok: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        nzd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        sek: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        sgd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        },
                        usd: {
                            fixed_amounts: 'currency',
                            smart_tip_threshold: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/terminal/configurations/{configuration_id}'
            }
        }
    };

}
