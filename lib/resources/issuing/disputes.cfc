component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    evidence: {
                        canceled: {
                            canceled_at: 'timestamp',
                            cancellation_policy_provided: 'boolean',
                            expected_at: 'timestamp',
                            returned_at: 'timestamp'
                        },
                        merchandise_not_as_described: {
                            received_at: 'timestamp',
                            returned_at: 'timestamp'
                        },
                        not_received: {
                            expected_at: 'timestamp'
                        },
                        service_not_as_described: {
                            canceled_at: 'timestamp',
                            received_at: 'timestamp'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/issuing/disputes'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/issuing/disputes'
            },
            'retrieve': {
                path: '/issuing/disputes/{dispute_id}'
            },
            'submit': {
                httpMethod: 'post',
                path: '/issuing/disputes/{dispute_id}/submit'
            },
            'update': {
                arguments: {
                    amount: 'currency',
                    evidence: {
                        canceled: {
                            canceled_at: 'timestamp',
                            cancellation_policy_provided: 'boolean',
                            expected_at: 'timestamp',
                            returned_at: 'timestamp'
                        },
                        merchandise_not_as_described: {
                            received_at: 'timestamp',
                            returned_at: 'timestamp'
                        },
                        not_received: {
                            expected_at: 'timestamp'
                        },
                        service_not_as_described: {
                            canceled_at: 'timestamp',
                            received_at: 'timestamp'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/issuing/disputes/{dispute_id}'
            }
        }
    };

}
