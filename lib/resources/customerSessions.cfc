component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    components: {
                        buy_button: {
                            enabled: 'boolean'
                        },
                        pricing_table: {
                            enabled: 'boolean'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/customer_sessions'
            }
        }
    };

}
