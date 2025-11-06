/**
* https://docs.stripe.com/api/shipping_rates
*/
component {

    this.metadata = {
		methods: {
			/**
			* https://docs.stripe.com/api/shipping_rates/create
			*/
			'create': {
				arguments: {
					display_name: 'string',
					delivery_estimate: {
						maximum: {
							unit: 'string', // enum: business_day, day, hour, month, week
							value: 'numeric'
						},
						minimum: {
							unit: 'string', // enum: business_day, day, hour, month, week
							value: 'numeric'
						}
					},
					fixed_amount: {
						amount: 'currency',
						currency: 'iso_currency_code'
					},
					metadata: 'struct',
					tax_behavior: 'string', // enum: inclusive, exclusive, unspecified
					tax_code: 'string',
					type: 'string' // enum: fixed_amount
				},
				httpMethod: 'post',
				path: '/shipping_rates'
			},
			/**
			* https://docs.stripe.com/api/shipping_rates/list
			*/
			'list': {
				arguments: {
					active: 'boolean',
					created: 'datefilter',
					currency: 'iso_currency_code',
					ending_before: 'string',
					limit: 'numeric',
					starting_after: 'string'
				},
				path: '/shipping_rates'
			},
			/**
			* https://docs.stripe.com/api/shipping_rates/retrieve
			*/
			'retrieve': {
				path: '/shipping_rates/{shipping_rate_id}'
			},
			/**
			* https://docs.stripe.com/api/shipping_rates/update
			*/
			'update': {
				arguments: {
					active: 'boolean',
					metadata: 'struct',
					tax_behavior: 'string' // enum: inclusive, exclusive, unspecified
				},
				httpMethod: 'post',
				path: '/shipping_rates/{shipping_rate_id}'
			}
		}
    };

}
