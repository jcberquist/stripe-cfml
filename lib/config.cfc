component {

    variables.settings = {
        api_key: '',
        api_version: '',
        convert_timestamps: true,
        convert_to_cents: false,
        default_currency: '',
        endpoint: 'api.stripe.com/v1',
        stripe_version: ''
    };

    public any function init( string apiKey = '', struct config = { } ) {
        loadEnvSettings();
        mergeConfig( config );
        if ( len( apiKey ) ) {
            settings.api_key = apiKey;
        }
        return this;
    }

    public any function get( required string key ) {
        if ( settings.keyExists( key ) ) return settings[ key ];
        return '';
    }

    private void function loadEnvSettings() {
        var system = createObject( 'java', 'java.lang.System' );
        for ( var key in settings ) {
            var envKey = key.left( 6 ) != 'stripe' ? 'STRIPE_#key.ucase()#' : key.ucase();
            var envSetting = system.getenv( envKey );
            if ( !isNull( envSetting ) ) settings[ key ] = envSetting;
            var propKey = envKey
                .lcase()
                .replace( 'stripe_', 'stripe.' )
                .replace( '_', '', 'all' );
            var propSetting = system.getProperty( propKey );
            if ( !isNull( propSetting ) ) settings[ key ] = propSetting;
        }
    }

    private void function mergeConfig( required struct config ) {
        for ( var key in settings ) {
            if ( config.keyExists( key ) ) {
                settings[ key ] = config[ key ];
            } else if ( config.keyExists( key.replace( '_', '', 'all' ) ) ) {
                settings[ key ] = config[ key.replace( '_', '', 'all' ) ];
            }
        }
    }

}
