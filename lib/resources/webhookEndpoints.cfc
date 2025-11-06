/**
* https://docs.stripe.com/api/webhook_endpoints
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/webhook_endpoints/create
            */
            'create': {
                arguments: {
                    api_version: 'string',
                    connect: 'boolean',
                    description: 'string',
                    enabled_events: 'array',
                    metadata: 'struct',
                    url: 'string'
                },
                httpMethod: 'post',
                path: '/webhook_endpoints'
            },
            /**
            * https://docs.stripe.com/api/webhook_endpoints/delete
            */
            'delete': {
                httpMethod: 'delete',
                path: '/webhook_endpoints/{webhook_endpoint_id}'
            },
            /**
            * https://docs.stripe.com/api/webhook_endpoints/list
            */
            'list': {
                path: '/webhook_endpoints'
            },
            /**
            * https://docs.stripe.com/api/webhook_endpoints/retrieve
            */
            'retrieve': {
                path: '/webhook_endpoints/{webhook_endpoint_id}'
            },
            /**
            * https://docs.stripe.com/api/webhook_endpoints/update
            */
            'update': {
                arguments: {
                    description: 'string',
                    disabled: 'boolean',
                    enabled_events: 'array',
                    metadata: 'struct',
                    url: 'string'
                },
                httpMethod: 'post',
                path: '/webhook_endpoints/{webhook_endpoint_id}'
            }
        }
    };

}
