component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    business_profile: {
                        monthly_estimated_revenue: {
                            amount: 'currency',
                            currency: 'iso_currency_code'
                        }
                    },
                    company: {
                        ownership_declaration: {
                            date: 'timestamp'
                        }
                    },
                    default_currency: 'iso_currency_code',
                    settings: {
                        card_issuing: {
                            tos_acceptance: {
                                date: 'timestamp'
                            }
                        },
                        treasury: {
                            tos_acceptance: {
                                date: 'timestamp'
                            }
                        }
                    },
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
                path: '/accounts/{account_id}/external_accounts/{external_account_id}'
            },
            'deletePerson': {
                httpMethod: 'delete',
                path: '/accounts/{account_id}/persons/{person_id}'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
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
                path: '/accounts/{account_id}/external_accounts/{external_account_id}'
            },
            'retrievePerson': {
                path: '/accounts/{account_id}/persons/{person_id}'
            },
            'update': {
                arguments: {
                    business_profile: {
                        monthly_estimated_revenue: {
                            amount: 'currency',
                            currency: 'iso_currency_code'
                        }
                    },
                    company: {
                        ownership_declaration: {
                            date: 'timestamp'
                        }
                    },
                    default_currency: 'iso_currency_code',
                    settings: {
                        card_issuing: {
                            tos_acceptance: {
                                date: 'timestamp'
                            }
                        },
                        treasury: {
                            tos_acceptance: {
                                date: 'timestamp'
                            }
                        }
                    },
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
                path: '/accounts/{account_id}/external_accounts/{external_account_id}'
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
