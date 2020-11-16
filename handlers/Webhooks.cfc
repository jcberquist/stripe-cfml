component {

    property name="endpointSecret" inject="coldbox:setting:endpointSecret@stripecfml";
    property name="interceptorService" inject="coldbox:interceptorService";
    property name="stripe" inject="stripe@stripecfml";
    property name="log" inject="logbox:logger:{this}";

    function handle( event, rc, prc ) {
        try {
            var httpBody = event.getHTTPContent();
            if ( variables.log.canDebug() ) {
                variables.log.debug( 'Incoming Stripe Event', httpBody );
            }
            var stripeSignature = event.getHTTPHeader( 'Stripe-Signature', '' );
            variables.log.debug( 'Stripe-Signature Header: #stripeSignature#' );
            var stripeEvent = variables.stripe.webhooks.constructEvent(
                httpBody,
                stripeSignature,
                variables.endpointSecret
            );

            variables.log.debug( 'Stripe event: #stripeEvent.type#' );
            variables.log.debug( 'Converting incoming webhook event to interception points' );
            var stateName = generateStateName( stripeEvent );
            if ( variables.log.canDebug() ) {
                variables.log.debug( 'Announcing #stateName# Stripe event', stripeEvent );
            }
            variables.interceptorService.processState( stateName, stripeEvent );

            variables.log.debug( 'Event announced.  Returning 200 to Stripe.' );
            event.renderData(
                type = 'json',
                data = {
                    'received': true
                },
                statusCode = 200,
                statusText = 'OK'
            );
        } catch ( StripeSignatureVerificationException e ) {
            log.warn( 'Invalid Webhook Signature' );
            event.renderData(
                type = 'text',
                data = 'Invalid Webhook Signature',
                statusCode = 400,
                statusText = 'Bad Request'
            );
        }
    }

    /**
    * Generate an interceptor state name from a Stripe event name.
    *
    * @webhookEvent The Stripe webhook event struct.
    *
    * @returns An interceptor state name.
    */
    private function generateStateName( stripeEvent ) {
        return 'onStripe' & normalizeEventName( stripeEvent.type );
    }

    /**
    * Normalize a Stripe event name by removing any special characters.
    *
    * @webhookEvent The Stripe webhook event name.
    *
    * @returns A normalized Stripe webhook event name.
    */
    private function normalizeEventName( eventName ) {
        return reReplace(
            eventName,
            '(?:^|[._])(\w)',
            '\u\1',
            'all'
        );
    }

}
