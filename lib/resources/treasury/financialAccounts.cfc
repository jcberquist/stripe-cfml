component {

    this.metadata = {
        methods: {
            'create': {
                arguments: {
                    features: {
                        card_issuing: {
                            requested: 'boolean'
                        },
                        deposit_insurance: {
                            requested: 'boolean'
                        },
                        financial_addresses: {
                            aba: {
                                requested: 'boolean'
                            }
                        },
                        inbound_transfers: {
                            ach: {
                                requested: 'boolean'
                            }
                        },
                        intra_stripe_flows: {
                            requested: 'boolean'
                        },
                        outbound_payments: {
                            ach: {
                                requested: 'boolean'
                            },
                            us_domestic_wire: {
                                requested: 'boolean'
                            }
                        },
                        outbound_transfers: {
                            ach: {
                                requested: 'boolean'
                            },
                            us_domestic_wire: {
                                requested: 'boolean'
                            }
                        }
                    }
                },
                httpMethod: 'post',
                path: '/treasury/financial_accounts'
            },
            'list': {
                arguments: {
                    created: 'datefilter'
                },
                path: '/treasury/financial_accounts'
            },
            'retrieve': {
                path: '/treasury/financial_accounts/{financial_account_id}'
            },
            'retrieveFeatures': {
                path: '/treasury/financial_accounts/{financial_account_id}/features'
            },
            'update': {
                arguments: {
                    features: {
                        card_issuing: {
                            requested: 'boolean'
                        },
                        deposit_insurance: {
                            requested: 'boolean'
                        },
                        financial_addresses: {
                            aba: {
                                requested: 'boolean'
                            }
                        },
                        inbound_transfers: {
                            ach: {
                                requested: 'boolean'
                            }
                        },
                        intra_stripe_flows: {
                            requested: 'boolean'
                        },
                        outbound_payments: {
                            ach: {
                                requested: 'boolean'
                            },
                            us_domestic_wire: {
                                requested: 'boolean'
                            }
                        },
                        outbound_transfers: {
                            ach: {
                                requested: 'boolean'
                            },
                            us_domestic_wire: {
                                requested: 'boolean'
                            }
                        }
                    }
                },
                httpMethod: 'post',
                path: '/treasury/financial_accounts/{financial_account_id}'
            },
            'updateFeatures': {
                arguments: {
                    card_issuing: {
                        requested: 'boolean'
                    },
                    deposit_insurance: {
                        requested: 'boolean'
                    },
                    financial_addresses: {
                        aba: {
                            requested: 'boolean'
                        }
                    },
                    inbound_transfers: {
                        ach: {
                            requested: 'boolean'
                        }
                    },
                    intra_stripe_flows: {
                        requested: 'boolean'
                    },
                    outbound_payments: {
                        ach: {
                            requested: 'boolean'
                        },
                        us_domestic_wire: {
                            requested: 'boolean'
                        }
                    },
                    outbound_transfers: {
                        ach: {
                            requested: 'boolean'
                        },
                        us_domestic_wire: {
                            requested: 'boolean'
                        }
                    }
                },
                httpMethod: 'post',
                path: '/treasury/financial_accounts/{financial_account_id}/features'
            }
        }
    };

}
