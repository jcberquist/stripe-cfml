component {

    this.name = 'stripecfml';
    this.title = 'Stripe CFML';
    this.author = 'John Berquist';
    this.webURL = 'https://github.com/jcberquist/stripe-cfml';
    this.description = 'This module will provide you with connectivity to the Stripe API for any ColdFusion (CFML) application.';
    this.entryPoint = 'stripecfml';
    this.modelNamespace = 'stripecfml';
    this.cfmapping = 'stripecfml';
    this.dependencies = [ ];

    /**
    * apiKey is required, but note that it can be set via a Java system property
    * or environment variables instead of being passed in at init.
    * See README.md for the config struct options - these can also be set via
    * system properties or environment variables if desired.
    */
    function configure() {
        settings = {
            apiKey: '',
            endpointSecret: '',
            config: { }
        };

        routes = [
            {
                'pattern': '/webhooks',
                'handler': 'Webhooks',
                'action': 'handle'
            }
        ];

        interceptorSettings = {
            customInterceptionPoints: [
                'onStripeAccountUpdated', // "account.updated",
                'onStripeAccountApplicationAuthorized', // "account.application.authorized",
                'onStripeAccountApplicationDeauthorized', // "account.application.deauthorized",
                'onStripeAccountExternalAccountCreated', // "account.external_account.created",
                'onStripeAccountExternalAccountDeleted', // "account.external_account.deleted",
                'onStripeAccountExternalAccountUpdated', // "account.external_account.updated",
                'onStripeApplicationFeeCreated', // "application_fee.created",
                'onStripeApplicationFeeRefunded', // "application_fee.refunded",
                'onStripeApplicationFeeRefundUpdated', // "application_fee.refund.updated",
                'onStripeBalanceAvailable', // "balance.available",
                'onStripeCapabilityUpdated', // "capability.updated",
                'onStripeChargeCaptured', // "charge.captured",
                'onStripeChargeExpired', // "charge.expired",
                'onStripeChargeFailed', // "charge.failed",
                'onStripeChargePending', // "charge.pending",
                'onStripeChargeRefunded', // "charge.refunded",
                'onStripeChargeSucceeded', // "charge.succeeded",
                'onStripeChargeUpdated', // "charge.updated",
                'onStripeChargeDisputeClosed', // "charge.dispute.closed",
                'onStripeChargeDisputeCreated', // "charge.dispute.created",
                'onStripeChargeDisputeFundsReinstated', // "charge.dispute.funds_reinstated",
                'onStripeChargeDisputeFundsWithdrawn', // "charge.dispute.funds_withdrawn",
                'onStripeChargeDisputeUpdated', // "charge.dispute.updated",
                'onStripeChargeRefundUpdated', // "charge.refund.updated",
                'onStripeCheckoutSessionAsyncPaymentFailed', // "checkout.session.async_payment_failed",
                'onStripeCheckoutSessionAsyncPaymentSucceeded', // "checkout.session.async_payment_succeeded",
                'onStripeCheckoutSessionCompleted', // "checkout.session.completed",
                'onStripeCouponCreated', // "coupon.created",
                'onStripeCouponDeleted', // "coupon.deleted",
                'onStripeCouponUpdated', // "coupon.updated",
                'onStripeCreditNoteCreated', // "credit_note.created",
                'onStripeCreditNoteUpdated', // "credit_note.updated",
                'onStripeCreditNoteVoided', // "credit_note.voided",
                'onStripeCustomerCreated', // "customer.created",
                'onStripeCustomerDeleted', // "customer.deleted",
                'onStripeCustomerUpdated', // "customer.updated",
                'onStripeCustomerDiscountCreated', // "customer.discount.created",
                'onStripeCustomerDiscountDeleted', // "customer.discount.deleted",
                'onStripeCustomerDiscountUpdated', // "customer.discount.updated",
                'onStripeCustomerSourceCreated', // "customer.source.created",
                'onStripeCustomerSourceDeleted', // "customer.source.deleted",
                'onStripeCustomerSourceExpiring', // "customer.source.expiring",
                'onStripeCustomerSourceUpdated', // "customer.source.updated",
                'onStripeCustomerSubscriptionCreated', // "customer.subscription.created",
                'onStripeCustomerSubscriptionDeleted', // "customer.subscription.deleted",
                'onStripeCustomerSubscriptionPendingUpdateApplied', // "customer.subscription.pending_update_applied",
                'onStripeCustomerSubscriptionPendingUpdateExpired', // "customer.subscription.pending_update_expired",
                'onStripeCustomerSubscriptionTrialWillEnd', // "customer.subscription.trial_will_end",
                'onStripeCustomerSubscriptionUpdated', // "customer.subscription.updated",
                'onStripeCustomerTaxIdCreated', // "customer.tax_id.created",
                'onStripeCustomerTaxIdDeleted', // "customer.tax_id.deleted",
                'onStripeCustomerTaxIdUpdated', // "customer.tax_id.updated",
                'onStripeFileCreated', // "file.created",
                'onStripeInvoiceCreated', // "invoice.created",
                'onStripeInvoiceDeleted', // "invoice.deleted",
                'onStripeInvoiceFinalizationFailed', // "invoice.finalization_failed",
                'onStripeInvoiceFinalized', // "invoice.finalized",
                'onStripeInvoiceMarkedUncollectible', // "invoice.marked_uncollectible",
                'onStripeInvoicePaid', // "invoice.paid",
                'onStripeInvoicePaymentActionRequired', // "invoice.payment_action_required",
                'onStripeInvoicePaymentFailed', // "invoice.payment_failed",
                'onStripeInvoicePaymentSucceeded', // "invoice.payment_succeeded",
                'onStripeInvoiceSent', // "invoice.sent",
                'onStripeInvoiceUpcoming', // "invoice.upcoming",
                'onStripeInvoiceUpdated', // "invoice.updated",
                'onStripeInvoiceVoided', // "invoice.voided",
                'onStripeInvoiceitemCreated', // "invoiceitem.created",
                'onStripeInvoiceitemDeleted', // "invoiceitem.deleted",
                'onStripeInvoiceitemUpdated', // "invoiceitem.updated",
                'onStripeIssuingAuthorizationCreated', // "issuing_authorization.created",
                'onStripeIssuingAuthorizationRequest', // "issuing_authorization.request",
                'onStripeIssuingAuthorizationUpdated', // "issuing_authorization.updated",
                'onStripeIssuingCardCreated', // "issuing_card.created",
                'onStripeIssuingCardUpdated', // "issuing_card.updated",
                'onStripeIssuingCardholderCreated', // "issuing_cardholder.created",
                'onStripeIssuingCardholderUpdated', // "issuing_cardholder.updated",
                'onStripeIssuingDisputeClosed', // "issuing_dispute.closed",
                'onStripeIssuingDisputeCreated', // "issuing_dispute.created",
                'onStripeIssuingDisputeFundsReinstated', // "issuing_dispute.funds_reinstated",
                'onStripeIssuingDisputeSubmitted', // "issuing_dispute.submitted",
                'onStripeIssuingDisputeUpdated', // "issuing_dispute.updated",
                'onStripeIssuingTransactionCreated', // "issuing_transaction.created",
                'onStripeIssuingTransactionUpdated', // "issuing_transaction.updated",
                'onStripeMandateUpdated', // "mandate.updated",
                'onStripeOrderCreated', // "order.created",
                'onStripeOrderPaymentFailed', // "order.payment_failed",
                'onStripeOrderPaymentSucceeded', // "order.payment_succeeded",
                'onStripeOrderUpdated', // "order.updated",
                'onStripeOrderReturnCreated', // "order_return.created",
                'onStripePaymentIntentAmountCapturableUpdated', // "payment_intent.amount_capturable_updated",
                'onStripePaymentIntentCanceled', // "payment_intent.canceled",
                'onStripePaymentIntentCreated', // "payment_intent.created",
                'onStripePaymentIntentPaymentFailed', // "payment_intent.payment_failed",
                'onStripePaymentIntentProcessing', // "payment_intent.processing",
                'onStripePaymentIntentRequiresAction', // "payment_intent.requires_action",
                'onStripePaymentIntentSucceeded', // "payment_intent.succeeded",
                'onStripePaymentMethodAttached', // "payment_method.attached",
                'onStripePaymentMethodAutomaticallyUpdated', // "payment_method.automatically_updated",
                'onStripePaymentMethodDetached', // "payment_method.detached",
                'onStripePaymentMethodUpdated', // "payment_method.updated",
                'onStripePayoutCanceled', // "payout.canceled",
                'onStripePayoutCreated', // "payout.created",
                'onStripePayoutFailed', // "payout.failed",
                'onStripePayoutPaid', // "payout.paid",
                'onStripePayoutUpdated', // "payout.updated",
                'onStripePersonCreated', // "person.created",
                'onStripePersonDeleted', // "person.deleted",
                'onStripePersonUpdated', // "person.updated",
                'onStripePlanCreated', // "plan.created",
                'onStripePlanDeleted', // "plan.deleted",
                'onStripePlanUpdated', // "plan.updated",
                'onStripePriceCreated', // "price.created",
                'onStripePriceDeleted', // "price.deleted",
                'onStripePriceUpdated', // "price.updated",
                'onStripeProductCreated', // "product.created",
                'onStripeProductDeleted', // "product.deleted",
                'onStripeProductUpdated', // "product.updated",
                'onStripePromotionCodeCreated', // "promotion_code.created",
                'onStripePromotionCodeUpdated', // "promotion_code.updated",
                'onStripeRadarEarlyFraudWarningCreated', // "radar.early_fraud_warning.created",
                'onStripeRadarEarlyFraudWarningUpdated', // "radar.early_fraud_warning.updated",
                'onStripeRecipientCreated', // "recipient.created",
                'onStripeRecipientDeleted', // "recipient.deleted",
                'onStripeRecipientUpdated', // "recipient.updated",
                'onStripeReportingReportRunFailed', // "reporting.report_run.failed",
                'onStripeReportingReportRunSucceeded', // "reporting.report_run.succeeded",
                'onStripeReportingReportTypeUpdated', // "reporting.report_type.updated",
                'onStripeReviewClosed', // "review.closed",
                'onStripeReviewOpened', // "review.opened",
                'onStripeSetupIntentCanceled', // "setup_intent.canceled",
                'onStripeSetupIntentCreated', // "setup_intent.created",
                'onStripeSetupIntentRequiresAction', // "setup_intent.requires_action",
                'onStripeSetupIntentSetupFailed', // "setup_intent.setup_failed",
                'onStripeSetupIntentSucceeded', // "setup_intent.succeeded",
                'onStripeSigmaScheduledQueryRunCreated', // "sigma.scheduled_query_run.created",
                'onStripeSkuCreated', // "sku.created",
                'onStripeSkuDeleted', // "sku.deleted",
                'onStripeSkuUpdated', // "sku.updated",
                'onStripeSourceCanceled', // "source.canceled",
                'onStripeSourceChargeable', // "source.chargeable",
                'onStripeSourceFailed', // "source.failed",
                'onStripeSourceMandateNotification', // "source.mandate_notification",
                'onStripeSourceRefundAttributesRequired', // "source.refund_attributes_required",
                'onStripeSourceTransactionCreated', // "source.transaction.created",
                'onStripeSourceTransactionUpdated', // "source.transaction.updated",
                'onStripeSubscriptionScheduleAborted', // "subscription_schedule.aborted",
                'onStripeSubscriptionScheduleCanceled', // "subscription_schedule.canceled",
                'onStripeSubscriptionScheduleCompleted', // "subscription_schedule.completed",
                'onStripeSubscriptionScheduleCreated', // "subscription_schedule.created",
                'onStripeSubscriptionScheduleExpiring', // "subscription_schedule.expiring",
                'onStripeSubscriptionScheduleReleased', // "subscription_schedule.released",
                'onStripeSubscriptionScheduleUpdated', // "subscription_schedule.updated",
                'onStripeTaxRateCreated', // "tax_rate.created",
                'onStripeTaxRateUpdated', // "tax_rate.updated",
                'onStripeTopupCanceled', // "topup.canceled",
                'onStripeTopupCreated', // "topup.created",
                'onStripeTopupFailed', // "topup.failed",
                'onStripeTopupReversed', // "topup.reversed",
                'onStripeTopupSucceeded', // "topup.succeeded",
                'onStripeTransferCreated', // "transfer.created",
                'onStripeTransferFailed', // "transfer.failed",
                'onStripeTransferPaid', // "transfer.paid",
                'onStripeTransferReversed', // "transfer.reversed",
                'onStripeTransferUpdated' // "transfer.updated",
            ]
        };
    }

    function onLoad() {
        binder
            .map( 'stripe@stripecfml' )
            .to( '#moduleMapping#.stripe' )
            .asSingleton()
            .initWith( apiKey = settings.apiKey, config = settings.config );
    }

}
