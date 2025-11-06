/**
* https://docs.stripe.com/api/files
*/
component {

    this.metadata = {
        methods: {
            /**
            * https://docs.stripe.com/api/files/create
            */
            'create': {
                arguments: {
                    file: 'file',
                    file_link_data: {
                        create: 'boolean',
                        expires_at: 'timestamp',
                        metadata: 'struct'
                    },
                    purpose: 'string' // enum: account_requirement, additional_verification, business_icon, business_logo, customer_signature, dispute_evidence, identity_document, issuing_regulatory_reporting, pci_document, tax_document_user_upload, terminal_reader_splashscreen
                },
                endpoint: 'files.stripe.com/v1',
                httpMethod: 'post',
                multipart: true,
                path: '/files'
            },
            /**
            * https://docs.stripe.com/api/files/list
            */
            'list': {
                arguments: {
                    created: 'datefilter',
                    ending_before: 'string',
                    limit: 'numeric',
                    purpose: 'string', // enum: account_requirement, additional_verification, business_icon, business_logo, customer_signature, dispute_evidence, identity_document, issuing_regulatory_reporting, pci_document, tax_document_user_upload, terminal_reader_splashscreen
                    starting_after: 'string'
                },
                endpoint: 'files.stripe.com/v1',
                path: '/files'
            },
            /**
            * https://docs.stripe.com/api/files/retrieve
            */
            'retrieve': {
                endpoint: 'files.stripe.com/v1',
                path: '/files/{file_id}'
            }
        }
    };

}
