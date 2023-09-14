component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    amount: 'currency',
                    currency: 'iso_currency_code',
                    mandate: {
                        acceptance: {
                            date: 'timestamp',
                            online: {
                                date: 'timestamp'
                            }
                        },
                        amount: 'currency'
                    },
                    source_order: {
                        items: {
                            amount: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/sources'
            },
            'listSourceTransactions': {
                path: '/sources/{source_id}/source_transactions'
            },
            'retrieve': {
                path: '/sources/{source_id}'
            },
            'update': {
                arguments: {
                    amount: 'currency',
                    mandate: {
                        acceptance: {
                            date: 'timestamp',
                            online: {
                                date: 'timestamp'
                            }
                        },
                        amount: 'currency'
                    },
                    source_order: {
                        items: {
                            amount: 'currency'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/sources/{source_id}'
            },
            'verify': {
                httpMethod: 'post',
                path: '/sources/{source_id}/verify'
            }
        }
    };

}
