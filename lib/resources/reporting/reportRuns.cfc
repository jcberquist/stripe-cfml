component {

    this.metadata = {
        methods: {
            'create': {
                httpMethod: 'post',
                path: '/reporting/report_runs'
            },
            'list': {
                path: '/reporting/report_runs'
            },
            'retrieve': {
                path: '/reporting/report_runs/{report_run_id}'
            }
        }
    };

}
