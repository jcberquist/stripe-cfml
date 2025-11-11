# stripe-cfml

**stripe-cfml** is a CFML (Lucee, ColdFusion, and BoxLang) library for interacting with the Stripe API.

## Installation
This wrapper can be installed as standalone library or as a ColdBox Module. Either approach requires a simple CommandBox command:

```
$ box install stripecfml
```

Alternatively the git repository can be cloned into the desired directory.

### Standalone Usage

Once the library has been installed, the core `stripe` component can be instantiated directly:

```cfc
stripe = new path.to.stripecfml.stripe(
    apiKey = '',
    config = {
        apiVersion: '2025-10-29.clover'
    }
);
```

### ColdBox Module

To use the library as a ColdBox Module, add the init arguments to the `moduleSettings` struct in `config/Coldbox.cfc`:

```cfc
moduleSettings = {
    stripecfml: {
        apiKey: '',
        config: {
            apiVersion: '2025-10-29.clover'
        }
    }
}
```

You can then leverage the library via the injection DSL: `stripe@stripecfml`:

```cfc
property name="stripe" inject="stripe@stripecfml";
```

*Note: You can bypass the init arguments altogether and use Java system properties or environment variables to configure stripe-cfml. See [Configuration via environment variables and system properties](#configuration-via-environment-variables-and-system-properties) below.*

## API Version

As of major version 4 of `stripe-cfml`, it is highly recommended that you set the API version you intend to use explicitly in the config (either as an initialization argument, or in the environment) when instantiating `stripe.cfc`. Stripe has moved to major version releases denoted by code names, and they preserve backwards compatibility within updates to each major version. API versions are now specified by a release date, followed by the major version (e.g. `2025-10-29.clover`). To work with this, `stripe-cfml` now bases available methods and object signatures on the Stripe major version.

If an API version is *not* specified, `stripe-cfml` will use method and object signatures from the latest major API version available to it. However, when Stripe receives a request with no API version specified, it will fall back to the default version set on your account, and that might not line up with the metadata that `stripe-cfml` uses.

If you specify an API version that came before the named major versions (e.g. `2024-06-20`) `stripe-cfml` will use metadata and method signatures belonging to the last release before Stripe moved to the named major versions.

Please see [versioning](https://stripe.com/docs/api#versioning) and [changelog](https://docs.stripe.com/changelog) in the Stripe documentation for more details.

## Getting Started

```cfc
// To charge $20 to a card for which a card token has been created
paymentIntent = stripe.paymentIntents.create({
    amount: 2000,
    currency: 'usd',
    payment_method_data: {
        type: 'card',
        card: {
            token: cardToken
        }
    },
    confirm: true
});
// OR
paymentIntent = stripe.paymentIntents.create(
    amount = 2000,
    currency = 'usd',
    payment_method_data = {
        type: 'card',
        card: {
            token: cardToken
        }
    },
    confirm = true
);


// paymentIntent is a struct which can be inspected for the result of the create payment intent api call
writeDump(paymentIntent);
```

**stripe-cfml** is modeled after the official Stripe SDKs. In particular it copies the class and method names used in the Node SDK. The Node method signatures given in the official Stripe documentation are simply able to be copied and used (without the async/await approach of that SDK). (Please note that the structure of what is returned from `stripe-cfml` varies from the Node SDK, see [Responses](#responses) below.) However, since CFML supports named arguments, you can also use named arguments instead of passing the arguments in a single struct.  The following examples are all valid ways of using this library:

```cfc
stripe.customers.updateSource('customer_id', 'source_id', {metadata = {'a': 1}});
stripe.customers.updateSource(customer_id = 'customer_id', source_id = 'source_id', metadata = {'a': 1});
```

Note that the `customers` component and the method name, `updateSource`, do not change, only the how the arguments are passed to the method. See the [reference](reference.md) for more information on the method signatures.

## Headers

There are a several arguments you can pass to any method that are passed to the Stripe API as headers: `apiKey`, `stripeVersion` (or `apiVersion`), `idempotencyKey`, and `stripeAccount`.

- `apiKey` and `stripeVersion` will override the default values passed into the `stripe.cfc` init method (see [Configuration](#Configuration) below). *Note that `apiVersion` will also work as an alternate to `stripeVersion` when positional arguments are used, but is not supported when using named arguments.*
- `idempotencyKey` is used to allow you to make idempotent requests (see https://stripe.com/docs/api#idempotent_requests).
- `stripeAccount` is used when making API requests on behalf of a connected account - see https://stripe.com/docs/connect/authentication.

When copying the Node SDK method signatures, headers are passed in a single struct:

```cfc
charge = stripe.charges.create(
    {amount: 2000, currency: 'usd', source: cardToken},
    {stripeAccount: 'abc', idempotencyKey: 'def'}
);
```

They can also be passed as named arguments:

```cfc
charge = stripe.charges.create(
    amount = 2000,
    currency = 'usd',
    source = cardToken,
    stripeAccount = 'abc',
    idempotencyKey = 'def'
);
```
## Configuration

You can pass some configuration parameters in a struct to the constructor of `stripe.cfc`:

```cfc
config = {
    apiVersion: '',
    defaultCurrency: '',
    convertTimestamps: true,
    convertToCents: false,
    resources: ['accounts', 'customers', 'paymentIntents']
}
stripe = new stripe('stripe_api_key', config);
```

- `apiVersion` specifies the version of the Stripe API to use. You should always specify this either via the inline config, or in the environment.
- `defaultCurrency` specifies the currency to use when making requests (e.g. `usd`) - when it is specified in the config you do not need to specify it when making requests.
- `convertTimestamps` (default: `true`) - The Stripe API expects all datetimes to be given as Unix timestamps; when this setting is true, `stripe-cfml` converts all CFML date objects passed into methods to UNIX timestamps and converts timestamps in the API responses back to CFML date objects.
- `convertToCents` (default: `false`) - when this is set to `true` all currency amounts passed in are multiplied by 100 and all amounts in the responses are divided by 100. (This enables one to work in dollar amounts instead of cents, if so desired.)
- `resources` (default: `[]`) - By default, `stripe-cfml` will load all available api resources. If you know you only intend to interact with a handful of resources (e.g. `customers` and `paymentIntents`), then you can specify those in the `resources` array, and only for those resources will the JSON source files be loaded and parsed, and `lib.apiResource` components instantiated.

### Configuration via environment variables and system properties

All of these configuration keys, including the Stripe secret key, can be specified in environment variables or Java system properties instead of being passed in at initialization. When using environment variables your config keys should be prefixed with `STRIPE_` and underscores are used to separate words: `STRIPE_API_KEY`, `STRIPE_API_VERSION`, `STRIPE_DEFAULT_CURRENCY`, `STRIPE_CONVERT_TIMESTAMPS`, and `STRIPE_CONVERT_TO_CENTS`. When using system properties your config keys should be prefixed with `stripe.` and all lowercase: `stripe.apikey`, `stripe.version`, `stripe.defaultcurrency`, `stripe.converttimestamps`, and `stripe.converttocents`.

## Responses

The Stripe API returns a JSON object in response to all HTTP requests (see https://stripe.com/docs/api). **stripe-cfml** deserializes this object into a CFML struct and makes it available in a response struct under the `content` key.

Responses to API calls are all returned as structs in the following format:

```cfc
{
    requestId: ''  // request identifier - see https://stripe.com/docs/api#request_ids
    content: {}    // struct containing the body of the response
    duration: 300  // time the HTTP request took in milliseconds
    headers: {}    // struct containing headers returned by the Stripe API
    status: 200    // status code returned by the Stripe API
}
```

## Webhooks

**stripe-cfml** can verify signed webhooks received by your server in a similar fashion to the official Stripe SDKs:

```cfc
try {
    event = stripe.webhooks.constructEvent(webhookJSONPayload, stripeSignatureHeader, endpointSecret);
} catch (any e) {
    // the webhook was not signed properly
}
// otherwise do something with the event

```

See <https://stripe.com/docs/webhooks> and <https://stripe.com/docs/webhooks/signatures> for more information on setting up signed webhooks.


### ColdBox Interception Points for Webhooks

ColdBox users can automatically convert incoming webhooks to interception point events.  To do this,
point Stripe at `/stripecfml/webhooks`.  `stripe-cfml` will take care of verifying the validity
of incoming webhooks and announcing the associated interception point.

Interception Points are a combination of `onStripe` and the camelCase version of the webhook type.
For example, a `payment_intent.succeeded` type would become a `onStripePaymentIntentSucceeded` interception
point.  A full list of interception points can be found in the `ModuleConfig.cfc` for this module.

To use this feature, you will need to set your `endpointSecret` in your module settings:

```cfc
moduleSettings = {
    "stripecfml": {
        "apiKey": getSystemSetting( "STRIPE_API_KEY" ),
        "endpointSecret": getSystemSetting( "STRIPE_ENDPOINT_SECRET" )
    }
};
```

More information about endpoint secrets can be found on [Stripe's website](https://stripe.com/docs/webhooks/signatures).

> This library installs via CommandBox as `stripecfml`.  To fully test the ColdBox functionality of this package, you must clone this repo as `stripecfml`, e.g. `git clone git@github.com:jcberquist/stripe-cfml.git stripecfml`.
