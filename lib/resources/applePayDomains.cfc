/**
* https://docs.stripe.com/api/apple_pay_domains
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/apple_pay_domains/create
            */
            'create': {
                httpMethod: 'post',
                path: '/apple_pay/domains'
            },
            /**
            * https://docs.stripe.com/api/apple_pay_domains/delete
            */
            'delete': {
                httpMethod: 'delete',
                path: '/apple_pay/domains/{domain_id}'
            },
            /**
            * https://docs.stripe.com/api/apple_pay_domains/list
            */
            'list': {
                path: '/apple_pay/domains'
            },
            /**
            * https://docs.stripe.com/api/apple_pay_domains/retrieve
            */
            'retrieve': {
                path: '/apple_pay/domains/{domain_id}'
            }
        }
    };

}
