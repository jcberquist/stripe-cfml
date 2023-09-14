component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    parameters: {
                        interval_end: 'timestamp',
                        interval_start: 'timestamp'
                    }
                },
                httpMethod: 'post',
                path: '/reporting/report_runs'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/reporting/report_runs'
            },
            'retrieve': {
                path: '/reporting/report_runs/{report_run_id}'
            }
        }
    };

}
