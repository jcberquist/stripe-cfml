component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    components: {
                        account_onboarding: {
                            enabled: 'boolean'
                        },
                        payment_details: {
                            enabled: 'boolean',
                            features: {
                                capture_payments: 'boolean',
                                dispute_management: 'boolean',
                                refund_management: 'boolean'
                            }
                        },
                        payments: {
                            enabled: 'boolean',
                            features: {
                                capture_payments: 'boolean',
                                dispute_management: 'boolean',
                                refund_management: 'boolean'
                            }
                        },
                        payouts: {
                            enabled: 'boolean',
                            features: {
                                edit_payout_schedule: 'boolean',
                                instant_payouts: 'boolean',
                                standard_payouts: 'boolean'
                            }
                        }
                    }
                },
                httpMethod: 'post',
                path: '/account_sessions'
            }
        }
    };

}
