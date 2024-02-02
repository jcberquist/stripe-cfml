component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    business_profile: {
                        annual_revenue: {
                            amount: 'currency'
                        },
                        monthly_estimated_revenue: {
                            amount: 'currency'
                        }
                    },
                    capabilities: {
                        acss_debit_payments: {
                            requested: 'boolean'
                        },
                        affirm_payments: {
                            requested: 'boolean'
                        },
                        afterpay_clearpay_payments: {
                            requested: 'boolean'
                        },
                        au_becs_debit_payments: {
                            requested: 'boolean'
                        },
                        bacs_debit_payments: {
                            requested: 'boolean'
                        },
                        bancontact_payments: {
                            requested: 'boolean'
                        },
                        bank_transfer_payments: {
                            requested: 'boolean'
                        },
                        blik_payments: {
                            requested: 'boolean'
                        },
                        boleto_payments: {
                            requested: 'boolean'
                        },
                        card_issuing: {
                            requested: 'boolean'
                        },
                        card_payments: {
                            requested: 'boolean'
                        },
                        cartes_bancaires_payments: {
                            requested: 'boolean'
                        },
                        cashapp_payments: {
                            requested: 'boolean'
                        },
                        eps_payments: {
                            requested: 'boolean'
                        },
                        fpx_payments: {
                            requested: 'boolean'
                        },
                        giropay_payments: {
                            requested: 'boolean'
                        },
                        grabpay_payments: {
                            requested: 'boolean'
                        },
                        ideal_payments: {
                            requested: 'boolean'
                        },
                        india_international_payments: {
                            requested: 'boolean'
                        },
                        jcb_payments: {
                            requested: 'boolean'
                        },
                        klarna_payments: {
                            requested: 'boolean'
                        },
                        konbini_payments: {
                            requested: 'boolean'
                        },
                        legacy_payments: {
                            requested: 'boolean'
                        },
                        link_payments: {
                            requested: 'boolean'
                        },
                        oxxo_payments: {
                            requested: 'boolean'
                        },
                        'p24_payments': {
                            requested: 'boolean'
                        },
                        paynow_payments: {
                            requested: 'boolean'
                        },
                        promptpay_payments: {
                            requested: 'boolean'
                        },
                        revolut_pay_payments: {
                            requested: 'boolean'
                        },
                        sepa_debit_payments: {
                            requested: 'boolean'
                        },
                        sofort_payments: {
                            requested: 'boolean'
                        },
                        swish_payments: {
                            requested: 'boolean'
                        },
                        'tax_reporting_us_1099_k': {
                            requested: 'boolean'
                        },
                        'tax_reporting_us_1099_misc': {
                            requested: 'boolean'
                        },
                        transfers: {
                            requested: 'boolean'
                        },
                        treasury: {
                            requested: 'boolean'
                        },
                        us_bank_account_ach_payments: {
                            requested: 'boolean'
                        },
                        zip_payments: {
                            requested: 'boolean'
                        }
                    },
                    company: {
                        directors_provided: 'boolean',
                        executives_provided: 'boolean',
                        owners_provided: 'boolean',
                        ownership_declaration: {
                            date: 'timestamp'
                        }
                    },
                    individual: {
                        relationship: {
                            director: 'boolean',
                            executive: 'boolean',
                            owner: 'boolean'
                        }
                    },
                    settings: {
                        card_issuing: {
                            tos_acceptance: {
                                date: 'timestamp'
                            }
                        },
                        card_payments: {
                            decline_on: {
                                avs_failure: 'boolean',
                                cvc_failure: 'boolean'
                            }
                        },
                        payouts: {
                            debit_negative_balances: 'boolean'
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
                arguments: {
                    default_for_currency: 'boolean'
                },
                httpMethod: 'post',
                path: '/accounts/{account_id}/external_accounts'
            },
            'createLoginLink': {
                httpMethod: 'post',
                path: '/accounts/{account_id}/login_links'
            },
            'createPerson': {
                arguments: {
                    additional_tos_acceptances: {
                        account: {
                            date: 'timestamp'
                        }
                    },
                    relationship: {
                        director: 'boolean',
                        executive: 'boolean',
                        legal_guardian: 'boolean',
                        owner: 'boolean',
                        representative: 'boolean'
                    }
                },
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
                arguments: {
                    relationship: {
                        director: 'boolean',
                        executive: 'boolean',
                        legal_guardian: 'boolean',
                        owner: 'boolean',
                        representative: 'boolean'
                    }
                },
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
                        annual_revenue: {
                            amount: 'currency'
                        },
                        monthly_estimated_revenue: {
                            amount: 'currency'
                        }
                    },
                    capabilities: {
                        acss_debit_payments: {
                            requested: 'boolean'
                        },
                        affirm_payments: {
                            requested: 'boolean'
                        },
                        afterpay_clearpay_payments: {
                            requested: 'boolean'
                        },
                        au_becs_debit_payments: {
                            requested: 'boolean'
                        },
                        bacs_debit_payments: {
                            requested: 'boolean'
                        },
                        bancontact_payments: {
                            requested: 'boolean'
                        },
                        bank_transfer_payments: {
                            requested: 'boolean'
                        },
                        blik_payments: {
                            requested: 'boolean'
                        },
                        boleto_payments: {
                            requested: 'boolean'
                        },
                        card_issuing: {
                            requested: 'boolean'
                        },
                        card_payments: {
                            requested: 'boolean'
                        },
                        cartes_bancaires_payments: {
                            requested: 'boolean'
                        },
                        cashapp_payments: {
                            requested: 'boolean'
                        },
                        eps_payments: {
                            requested: 'boolean'
                        },
                        fpx_payments: {
                            requested: 'boolean'
                        },
                        giropay_payments: {
                            requested: 'boolean'
                        },
                        grabpay_payments: {
                            requested: 'boolean'
                        },
                        ideal_payments: {
                            requested: 'boolean'
                        },
                        india_international_payments: {
                            requested: 'boolean'
                        },
                        jcb_payments: {
                            requested: 'boolean'
                        },
                        klarna_payments: {
                            requested: 'boolean'
                        },
                        konbini_payments: {
                            requested: 'boolean'
                        },
                        legacy_payments: {
                            requested: 'boolean'
                        },
                        link_payments: {
                            requested: 'boolean'
                        },
                        oxxo_payments: {
                            requested: 'boolean'
                        },
                        'p24_payments': {
                            requested: 'boolean'
                        },
                        paynow_payments: {
                            requested: 'boolean'
                        },
                        promptpay_payments: {
                            requested: 'boolean'
                        },
                        revolut_pay_payments: {
                            requested: 'boolean'
                        },
                        sepa_debit_payments: {
                            requested: 'boolean'
                        },
                        sofort_payments: {
                            requested: 'boolean'
                        },
                        swish_payments: {
                            requested: 'boolean'
                        },
                        'tax_reporting_us_1099_k': {
                            requested: 'boolean'
                        },
                        'tax_reporting_us_1099_misc': {
                            requested: 'boolean'
                        },
                        transfers: {
                            requested: 'boolean'
                        },
                        treasury: {
                            requested: 'boolean'
                        },
                        us_bank_account_ach_payments: {
                            requested: 'boolean'
                        },
                        zip_payments: {
                            requested: 'boolean'
                        }
                    },
                    company: {
                        directors_provided: 'boolean',
                        executives_provided: 'boolean',
                        owners_provided: 'boolean',
                        ownership_declaration: {
                            date: 'timestamp'
                        }
                    },
                    individual: {
                        relationship: {
                            director: 'boolean',
                            executive: 'boolean',
                            owner: 'boolean'
                        }
                    },
                    settings: {
                        card_issuing: {
                            tos_acceptance: {
                                date: 'timestamp'
                            }
                        },
                        card_payments: {
                            decline_on: {
                                avs_failure: 'boolean',
                                cvc_failure: 'boolean'
                            }
                        },
                        payouts: {
                            debit_negative_balances: 'boolean'
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
                arguments: {
                    requested: 'boolean'
                },
                httpMethod: 'post',
                path: '/accounts/{account_id}/capabilities/{capability_id}'
            },
            'updateExternalAccount': {
                arguments: {
                    default_for_currency: 'boolean'
                },
                httpMethod: 'post',
                path: '/accounts/{account_id}/external_accounts/{external_account_id}'
            },
            'updatePerson': {
                arguments: {
                    additional_tos_acceptances: {
                        account: {
                            date: 'timestamp'
                        }
                    },
                    relationship: {
                        director: 'boolean',
                        executive: 'boolean',
                        legal_guardian: 'boolean',
                        owner: 'boolean',
                        representative: 'boolean'
                    }
                },
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
