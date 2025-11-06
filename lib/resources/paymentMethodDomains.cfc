/**
* https://docs.stripe.com/api/payment_method_domains
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/payment_method_domains/create
            */
            'create': {
                arguments: {
                    domain_name: 'string',
                    enabled: 'boolean'
                },
                httpMethod: 'post',
                path: '/payment_method_domains'
            },
            /**
            * https://docs.stripe.com/api/payment_method_domains/list
            */
            'list': {
                arguments: {
                    domain_name: 'string',
                    enabled: 'boolean',
                    ending_before: 'string',
                    limit: 'numeric',
                    starting_after: 'string'
                },
                path: '/payment_method_domains'
            },
            /**
            * https://docs.stripe.com/api/payment_method_domains/retrieve
            */
            'retrieve': {
                path: '/payment_method_domains/{payment_method_domain_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_method_domains/update
            */
            'update': {
                arguments: {
                    enabled: 'boolean'
                },
                httpMethod: 'post',
                path: '/payment_method_domains/{payment_method_domain_id}'
            },
            /**
            * https://docs.stripe.com/api/payment_method_domains/validate
            */
            'validate': {
                httpMethod: 'post',
                path: '/payment_method_domains/{payment_method_domain_id}/validate'
            }
        }
    };

}
