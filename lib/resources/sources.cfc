component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    mandate: {
                        acceptance: {
                            date: 'timestamp'
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
                    mandate: {
                        acceptance: {
                            date: 'timestamp'
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
