component accessors="true" {

    property objectMetadata;

    function init( required any stripe ) {
        variables.stripe = arguments.stripe;
        variables.objectMetadata = variables.stripe.list( 'metadata' );
        return this;
    }

    public struct function get( required string objectName ) {
        var metadata = { };
        if ( variables.objectMetadata.keyExists( objectName ) ) {
            if ( isSimpleValue( variables.objectMetadata[ objectName ] ) ) {
                variables.objectMetadata[ objectName ] = variables.stripe.loadJSONFile(
                    variables.objectMetadata[ objectName ]
                );
            }
            metadata = variables.objectMetadata[ objectName ];
        }

        // almost all objects have a `created` timestamp
        // adding a check here so any object metadata that only
        // needs to register `created` can be implicit
        if ( !metadata.keyExists( 'created' ) ) {
            metadata[ 'created' ] = 'datetime';
        }

        return metadata;
    }

}
