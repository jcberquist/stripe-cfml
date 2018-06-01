component {

    this.title = 'Stripe CFML';
    this.author = 'John Berquist';
    this.webURL = 'https://github.com/jcberquist/stripe-cfml';
    this.description = 'This module will provide you with connectivity to the Stripe API for any ColdFusion (CFML) application.';

    /**
     * apiKey is required, but note that it can be set via a Java system property
     * or environment variables instead of being passed in at init.
     * See README.md for the config struct options - these can also be set via
     * system properties or environment variables if desired.
     */
    function configure() {
        settings = {
            apiKey = '',
            config = { }
        };
    }

    function onLoad() {
        binder.map( 'stripe@stripecfml' )
            .to( '#moduleMapping#.stripe' )
            .asSingleton()
            .initWith( apiKey = settings.apiKey, config = settings.config );
    }

}
