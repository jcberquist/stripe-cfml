component accessors="true" {

    property objectMetadata;

    function init( required any stripe ) {
        variables.stripe = arguments.stripe;
        variables.objectMetadata = variables.stripe.loadBundle( 'metadata' );
        return this;
    }

    public struct function get( required string objectName ) {
        if ( variables.objectMetadata.keyExists( objectName ) ) {
            return variables.objectMetadata[ objectName ];
        }
        return { };
    }

}
