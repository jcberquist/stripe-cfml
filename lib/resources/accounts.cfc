component extends="abstract.apiResource" {

    variables.metadata = {
        methods: {
            'create': {
                arguments: {
                    tos_acceptance: {
                        date: 'timestamp'
                    }
                },
                httpMethod: 'post',
                path: '/accounts'
            },
            'createExternalAccount': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/external_accounts'
            },
            'createLoginLink': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/login_links'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/accounts/{account_id}'
            },
            'deleteExternalAccount': {
                httpMethod: 'delete',
                path: '/accounts/{account_id}/external_accounts/{source_id}'
            },
            'list': {
                path: '/accounts'
            },
            'listExternalAccounts': {
                path: '/accounts/{account_id}/external_accounts'
            },
            'reject': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/reject'
            },
            'retrieve': {
                path: '/accounts/{account_id}'
            },
            'retrieveExternalAccount': {
                path: '/accounts/{account_id}/external_accounts/{source_id}'
            },
            'update': {
                arguments: {
                    tos_acceptance: {
                        date: 'timestamp'
                    }
                },
                httpMethod: 'post',
                path: '/accounts/{account_id}'
            },
            'updateExternalAccount': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/external_accounts/{source_id}'
            }
        }
    };

    public struct function retrieve() {
        if (
            arrayLen( arguments ) == 0 ||
            (
                !structKeyExists( arguments, 'account_id' ) &&
                ( !structKeyExists( arguments, 'params' ) || !structKeyExists( arguments.params, 'account_id' ) )
            )
        ) {
            // special case return `/account` instead of default since no account id was supplied
            var methodMetadata = getBaseMethodMetadata();
            methodMetadata.path = '/account';
            methodMetadata.pathArgs = [ ];
            methodMetadata.positionalArgs = [ ];
            return stripe.call( 'accounts', 'retrieve', arguments, methodMetadata );
        }
        return stripe.call( 'accounts', 'retrieve', arguments, metadata.methods.retrieve );
    }

}
