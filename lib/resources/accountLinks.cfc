/**
* https://docs.stripe.com/api/account_links
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/account_links/create
            */
            'create': {
                arguments: {
                    account: 'string',
                    refresh_url: 'string',
                    return_url: 'string',
                    type: 'string' // enum: account_onboarding, account_update
                },
                httpMethod: 'post',
                path: '/account_links'
            }
        }
    };

}
