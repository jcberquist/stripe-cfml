component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'list': {
                path: '/country_specs'
            },
            'retrieve': {
                path: '/country_specs/{country_spec_id}'
            }
        }
    };

}
