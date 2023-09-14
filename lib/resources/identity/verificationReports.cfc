component {

    this.metadata = {
        methods: {
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/identity/verification_reports'
            },
            'retrieve': {
                path: '/identity/verification_reports/{verification_report_id}'
            }
        }
    };

}
