component {

    this.metadata = {
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
            'createPerson': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/persons'
            },
            'delete': {
                httpMethod: 'delete',
                path: '/accounts/{account_id}'
            },
            'deleteExternalAccount': {
                httpMethod: 'delete',
                path: '/accounts/{account_id}/external_accounts/{source_id}'
            },
            'deletePerson': {
                httpMethod: 'delete',
                path: '/accounts/{account_id}/persons/{person_id}'
            },
            'list': {
                path: '/accounts'
            },
            'listCapabilities': {
                path: '/accounts/{account_id}/capabilities'
            },
            'listExternalAccounts': {
                path: '/accounts/{account_id}/external_accounts'
            },
            'listPersons': {
                path: '/accounts/{account_id}/persons'
            },
            'reject': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/reject'
            },
            'retrieve': {
                path: '/accounts/{account_id}'
            },
            'retrieveCapability': {
                path: '/accounts/{account_id}/capabilities/{capability_id}'
            },
            'retrieveExternalAccount': {
                path: '/accounts/{account_id}/external_accounts/{source_id}'
            },
            'retrievePerson': {
                path: '/accounts/{account_id}/persons/{person_id}'
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
            'updateCapability': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/capabilities/{capability_id}'
            },
            'updateExternalAccount': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/external_accounts/{source_id}'
            },
            'updatePerson': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/persons/{person_id}'
            }
        }
    };

    public struct function retrieve() {
        if (
            arrayLen( arguments ) == 0 ||
            (
                !structKeyExists( arguments, 'account_id' ) &&
                !( structKeyExists( arguments, '1' ) && isSimpleValue( arguments[ 1 ] ) )
            )
        ) {
            // special case return `/account` instead of default since no account id was supplied
            var methodMetadata = getBaseMethodMetadata();
            methodMetadata.path = '/account';
            methodMetadata.pathArgs = [ ];
            methodMetadata.positionalArgs = [ ];
            return stripe.call(
                'accounts',
                'retrieve',
                arguments,
                methodMetadata
            );
        }
        return stripe.call(
            'accounts',
            'retrieve',
            arguments,
            metadata.methods.retrieve
        );
    }

}
