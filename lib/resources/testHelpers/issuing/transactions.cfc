component {

    this.metadata = {
        methods: {
            'createForceCapture': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    purchase_details: {
                        flight: {
                            departure_at: 'timestamp',
                            refundable: 'boolean',
                            segments: {
                                stopover_allowed: 'boolean'
                            }
                        },
                        lodging: {
                            check_in_at: 'timestamp'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/test_helpers/issuing/transactions/create_force_capture'
            },
            'createUnlinkedRefund': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    purchase_details: {
                        flight: {
                            departure_at: 'timestamp',
                            refundable: 'boolean',
                            segments: {
                                stopover_allowed: 'boolean'
                            }
                        },
                        lodging: {
                            check_in_at: 'timestamp'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/test_helpers/issuing/transactions/create_unlinked_refund'
            },
            'refund': {
                arguments: {
                    refund_amount: 'currency'
                },
                httpMethod: 'post',
                path: '/test_helpers/issuing/transactions/{transaction_id}/refund'
            }
        }
    };

}
