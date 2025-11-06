/**
* https://docs.stripe.com/api/file_links
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/file_links/create
            */
            'create': {
                arguments: {
                    file: 'string',
                    expires_at: 'timestamp',
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/file_links'
            },
            /**
            * https://docs.stripe.com/api/file_links/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    ending_before: 'string',
                    expired: 'boolean',
                    file: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/file_links'
            },
            /**
            * https://docs.stripe.com/api/file_links/retrieve
            */
            'retrieve': {
                path: '/file_links/{file_link_id}'
            },
            /**
            * https://docs.stripe.com/api/file_links/update
            */
            'update': {
                arguments: {
                    expires_at: 'timestamp',
                    metadata: 'struct'
                },
                httpMethod: 'post',
                path: '/file_links/{file_link_id}'
            }
        }
    };

}
