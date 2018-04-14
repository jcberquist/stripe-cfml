component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'capture': {
                arguments: {
                    amount: 'currency',
                    application_fee: 'currency',
                    destination: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/charges/{charge_id}/capture'
            },
            'create': {
                arguments: {
                    amount: 'currency',
                    application_fee: 'currency',
                    currency: 'iso_currency_code',
                    destination: {
                        amount: 'currency'
                    }
                },
                httpMethod: 'post',
                path: '/charges'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/charges'
            },
            'retrieve': {
                path: '/charges/{charge_id}'
            },
            'update': {
                httpMethod: 'post',
                path: '/charges/{charge_id}'
            }
        }
    };

    public struct function markAsSafe() {
        var argOverrides = { fraud_details: { user_report: 'safe' } };
        return stripe.call( 'charges', 'markAsSafe', arguments, metadata.methods.update, argOverrides );
    }

    public struct function markAsFraudulent() {
        var argOverrides = { fraud_details: { user_report: 'fraudulent' } };
        return stripe.call( 'charges', 'markAsFraudulent', arguments, metadata.methods.update, argOverrides );
    }

}
