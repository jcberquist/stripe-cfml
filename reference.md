# stripe-cfml reference

For documentation on which arguments can be passed to each method please see the [Stripe API Reference](https://stripe.com/docs/api). The arguments that are listed here are named arguments that ultimately appear in the URL of an API HTTP request. Since the Node library passes these arguments by position, you can refer to this page to see the names to use when passing these arguments by name.

## stripe.accountLinks

```cfc
stripe.accountLinks.create();
```

## stripe.accounts

```cfc
stripe.accounts.create();
stripe.accounts.createExternalAccount(account_id);
stripe.accounts.createLoginLink(account_id);
stripe.accounts.createPerson(account_id);
stripe.accounts.delete(account_id);
stripe.accounts.deleteExternalAccount(account_id, source_id);
stripe.accounts.deletePerson(account_id, person_id);
stripe.accounts.list();
stripe.accounts.listCapabilities(account_id);
stripe.accounts.listExternalAccounts(account_id);
stripe.accounts.listPersons(account_id);
stripe.accounts.reject(account_id);
stripe.accounts.retrieve();
stripe.accounts.retrieve(account_id);
stripe.accounts.retrieveCapability(account_id, capability_id);
stripe.accounts.retrieveExternalAccount(account_id, source_id);
stripe.accounts.retrievePerson(account_id, person_id);
stripe.accounts.update(account_id);
stripe.accounts.updateCapability(account_id, capability_id);
stripe.accounts.updateExternalAccount(account_id, source_id);
stripe.accounts.updatePerson(account_id, person_id);
```

## stripe.applePayDomains

```cfc
stripe.applePayDomains.create();
stripe.applePayDomains.delete(apple_pay_domain_id);
stripe.applePayDomains.list();
stripe.applePayDomains.retrieve(apple_pay_domain_id);
```

## stripe.applicationFees

```cfc
stripe.applicationFees.createRefund(application_fee_id);
stripe.applicationFees.list();
stripe.applicationFees.listRefunds(application_fee_id);
stripe.applicationFees.retrieve(application_fee_id);
stripe.applicationFees.retrieveRefund(application_fee_id, fee_refund_id);
stripe.applicationFees.updateRefund(application_fee_id, fee_refund_id);
```

## stripe.balance

```cfc
stripe.balance.retrieve();
```

## stripe.balanceTransactions

```cfc
stripe.balanceTransactions.list();
stripe.balanceTransactions.retrieve(balance_transaction_id);
```

## stripe.billingPortal.configurations

```cfc
stripe.billingPortal.configurations.create();
stripe.billingPortal.configurations.list();
stripe.billingPortal.configurations.retrieve(configuration_id);
stripe.billingPortal.configurations.update(configuration_id);
```

## stripe.billingPortal.sessions

```cfc
stripe.billingPortal.sessions.create();
```

## stripe.charges

```cfc
stripe.charges.capture(charge_id);
stripe.charges.create();
stripe.charges.list();
stripe.charges.retrieve(charge_id);
stripe.charges.update(charge_id);
```

## stripe.checkout.sessions

```cfc
stripe.checkout.sessions.create();
stripe.checkout.sessions.list();
stripe.checkout.sessions.listLineItems(session_id);
stripe.checkout.sessions.retrieve(session_id);
```

## stripe.countrySpecs

```cfc
stripe.countrySpecs.list();
stripe.countrySpecs.retrieve(country_spec_id);
```

## stripe.coupons

```cfc
stripe.coupons.create();
stripe.coupons.delete(coupon_id);
stripe.coupons.list();
stripe.coupons.retrieve(coupon_id);
stripe.coupons.update(coupon_id);
```

## stripe.creditNotes

```cfc
stripe.creditNotes.create();
stripe.creditNotes.list();
stripe.creditNotes.listLineItems(credit_note_id);
stripe.creditNotes.listPreviewLineItems();
stripe.creditNotes.preview();
stripe.creditNotes.retrieve(credit_note_id);
stripe.creditNotes.update(credit_note_id);
stripe.creditNotes.voidCreditNote(credit_note_id);
```

## stripe.customers

```cfc
stripe.customers.create();
stripe.customers.createBalanceTransaction(customer_id);
stripe.customers.createSource(customer_id);
stripe.customers.createTaxId(customer_id);
stripe.customers.delete(customer_id);
stripe.customers.deleteDiscount(customer_id);
stripe.customers.deleteSource(customer_id, source_id);
stripe.customers.deleteTaxId(customer_id, tax_id);
stripe.customers.list();
stripe.customers.listBalanceTransactions(customer_id);
stripe.customers.listSources(customer_id);
stripe.customers.listTaxIds(customer_id);
stripe.customers.retrieve(customer_id);
stripe.customers.retrieveBalanceTransaction(customer_id, customer_balance_transaction_id);
stripe.customers.retrieveSource(customer_id, source_id);
stripe.customers.retrieveTaxId(customer_id, tax_id);
stripe.customers.update(customer_id);
stripe.customers.updateBalanceTransaction(customer_id, customer_balance_transaction_id);
stripe.customers.updateSource(customer_id, source_id);
stripe.customers.verifySource(customer_id, source_id);
```

## stripe.disputes

```cfc
stripe.disputes.close(dispute_id);
stripe.disputes.list();
stripe.disputes.retrieve(dispute_id);
stripe.disputes.update(dispute_id);
```

## stripe.ephemeralKeys

```cfc
stripe.ephemeralKeys.create();
stripe.ephemeralKeys.delete(ephemeral_key_id);
```

## stripe.events

```cfc
stripe.events.list();
stripe.events.retrieve(event_id);
```

## stripe.exchangeRates

```cfc
stripe.exchangeRates.list();
stripe.exchangeRates.retrieve(exchange_rate_id);
```

## stripe.fileLinks

```cfc
stripe.fileLinks.create();
stripe.fileLinks.list();
stripe.fileLinks.retrieve(file_link_id);
stripe.fileLinks.update(file_link_id);
```

## stripe.fileUploads

```cfc
stripe.fileUploads.create();
stripe.fileUploads.list();
stripe.fileUploads.retrieve(file_upload_id);
```

## stripe.files

```cfc
stripe.files.create();
stripe.files.list();
stripe.files.retrieve(file_id);
```

## stripe.identity.verificationIntents

Identity beta 3 and earlier.

```cfc
stripe.identity.verificationIntents.cancel(verification_intent_id);
stripe.identity.verificationIntents.create();
stripe.identity.verificationIntents.list();
stripe.identity.verificationIntents.retrieve(verification_intent_id);
stripe.identity.verificationIntents.update(verification_intent_id);
```

## stripe.identity.verificationReports

```cfc
stripe.identity.verificationReports.list();
stripe.identity.verificationReports.retrieve(verification_report_id);
```

## stripe.identity.verificationSessions

Identity beta 4 and later.

```cfc
stripe.identity.verificationSessions.cancel(verification_session_id);
stripe.identity.verificationSessions.create();
stripe.identity.verificationSessions.list();
stripe.identity.verificationSessions.redact(verification_session_id);
stripe.identity.verificationSessions.retrieve(verification_session_id);
stripe.identity.verificationSessions.update(verification_session_id);
```

## stripe.invoiceItems

```cfc
stripe.invoiceItems.create();
stripe.invoiceItems.delete(invoiceitem_id);
stripe.invoiceItems.list();
stripe.invoiceItems.retrieve(invoiceitem_id);
stripe.invoiceItems.update(invoiceitem_id);
```

## stripe.invoices

```cfc
stripe.invoices.create();
stripe.invoices.delete(invoice_id);
stripe.invoices.finalizeInvoice(invoice_id);
stripe.invoices.list();
stripe.invoices.listLineItems(invoice_id);
stripe.invoices.listUpcomingLineItems();
stripe.invoices.markUncollectible(invoice_id);
stripe.invoices.pay(invoice_id);
stripe.invoices.retrieve(invoice_id);
stripe.invoices.retrieveUpcoming();
stripe.invoices.sendInvoice(invoice_id);
stripe.invoices.update(invoice_id);
stripe.invoices.voidInvoice(invoice_id);
```

## stripe.issuerFraudRecords

```cfc
stripe.issuerFraudRecords.list();
stripe.issuerFraudRecords.retrieve(issuer_fraud_record_id);
```

## stripe.issuing.authorizations

```cfc
stripe.issuing.authorizations.approve(authorization_id);
stripe.issuing.authorizations.decline(authorization_id);
stripe.issuing.authorizations.list();
stripe.issuing.authorizations.retrieve(authorization_id);
stripe.issuing.authorizations.update(authorization_id);
```

## stripe.issuing.cardholders

```cfc
stripe.issuing.cardholders.create();
stripe.issuing.cardholders.list();
stripe.issuing.cardholders.retrieve(cardholder_id);
stripe.issuing.cardholders.update(cardholder_id);
```

## stripe.issuing.cards

```cfc
stripe.issuing.cards.create();
stripe.issuing.cards.list();
stripe.issuing.cards.retrieve(card_id);
stripe.issuing.cards.retrieveDetails(card_id);
stripe.issuing.cards.update(card_id);
```

## stripe.issuing.disputes

```cfc
stripe.issuing.disputes.create();
stripe.issuing.disputes.list();
stripe.issuing.disputes.retrieve(dispute_id);
stripe.issuing.disputes.submit(dispute_id);
stripe.issuing.disputes.update(dispute_id);
```

## stripe.issuing.transactions

```cfc
stripe.issuing.transactions.list();
stripe.issuing.transactions.retrieve(transaction_id);
stripe.issuing.transactions.update(transaction_id);
```

## stripe.mandates

```cfc
stripe.mandates.retrieve(mandate_id);
```

## stripe.orderReturns

```cfc
stripe.orderReturns.list();
stripe.orderReturns.retrieve(order_return_id);
```

## stripe.orders

```cfc
stripe.orders.create();
stripe.orders.list();
stripe.orders.pay(order_id);
stripe.orders.retrieve(order_id);
stripe.orders.returnOrder(order_id);
stripe.orders.update(order_id);
```

## stripe.paymentIntents

```cfc
stripe.paymentIntents.cancel(payment_intent_id);
stripe.paymentIntents.capture(payment_intent_id);
stripe.paymentIntents.confirm(payment_intent_id);
stripe.paymentIntents.create();
stripe.paymentIntents.list();
stripe.paymentIntents.retrieve(payment_intent_id);
stripe.paymentIntents.update(payment_intent_id);
```

## stripe.paymentMethods

```cfc
stripe.paymentMethods.attach(payment_method_id);
stripe.paymentMethods.create();
stripe.paymentMethods.detach(payment_method_id);
stripe.paymentMethods.list();
stripe.paymentMethods.retrieve(payment_method_id);
stripe.paymentMethods.update(payment_method_id);
```

## stripe.payouts

```cfc
stripe.payouts.cancel(payout_id);
stripe.payouts.create();
stripe.payouts.list();
stripe.payouts.retrieve(payout_id);
stripe.payouts.reverse(payout_id);
stripe.payouts.update(payout_id);
```

## stripe.plans

```cfc
stripe.plans.create();
stripe.plans.delete(plan_id);
stripe.plans.list();
stripe.plans.retrieve(plan_id);
stripe.plans.update(plan_id);
```

## stripe.prices

```cfc
stripe.prices.create();
stripe.prices.list();
stripe.prices.retrieve(price_id);
stripe.prices.update(price_id);
```

## stripe.products

```cfc
stripe.products.create();
stripe.products.delete(product_id);
stripe.products.list();
stripe.products.retrieve(product_id);
stripe.products.update(product_id);
```

## stripe.promotionCodes

```cfc
stripe.promotionCodes.create();
stripe.promotionCodes.list();
stripe.promotionCodes.retrieve(promotion_code_id);
stripe.promotionCodes.update(promotion_code_id);
```

## stripe.quotes

```cfc
stripe.quotes.accept(quote_id);
stripe.quotes.cancel(quote_id);
stripe.quotes.create();
stripe.quotes.finalizeQuote(quote_id);
stripe.quotes.list();
stripe.quotes.listComputedUpfrontLineItems(quote_id);
stripe.quotes.listLineItems(quote_id);
stripe.quotes.pdf(quote_id);
stripe.quotes.retrieve(quote_id);
stripe.quotes.update(quote_id);
```

## stripe.radar.earlyFraudWarnings

```cfc
stripe.radar.earlyFraudWarnings.list();
stripe.radar.earlyFraudWarnings.retrieve(early_fraud_warning_id);
```

## stripe.radar.valueListItems

```cfc
stripe.radar.valueListItems.create();
stripe.radar.valueListItems.delete(value_list_item_id);
stripe.radar.valueListItems.list();
stripe.radar.valueListItems.retrieve(value_list_item_id);
```

## stripe.radar.valueLists

```cfc
stripe.radar.valueLists.create();
stripe.radar.valueLists.delete(value_list_id);
stripe.radar.valueLists.list();
stripe.radar.valueLists.retrieve(value_list_id);
stripe.radar.valueLists.update(value_list_id);
```

## stripe.refunds

```cfc
stripe.refunds.create();
stripe.refunds.list();
stripe.refunds.retrieve(refund_id);
stripe.refunds.update(refund_id);
```

## stripe.reporting.reportRuns

```cfc
stripe.reporting.reportRuns.create();
stripe.reporting.reportRuns.list();
stripe.reporting.reportRuns.retrieve(report_run_id);
```

## stripe.reporting.reportTypes

```cfc
stripe.reporting.reportTypes.list();
stripe.reporting.reportTypes.retrieve(report_type_id);
```

## stripe.reviews

```cfc
stripe.reviews.approve(review_id);
stripe.reviews.list();
stripe.reviews.retrieve(review_id);
```

## stripe.setupAttempts

```cfc
stripe.setupAttempts.list();
```

## stripe.setupIntents

```cfc
stripe.setupIntents.cancel(setup_intent_id);
stripe.setupIntents.confirm(setup_intent_id);
stripe.setupIntents.create();
stripe.setupIntents.list();
stripe.setupIntents.retrieve(setup_intent_id);
stripe.setupIntents.update(setup_intent_id);
```

## stripe.sigma.scheduledQueryRuns

```cfc
stripe.sigma.scheduledQueryRuns.list();
stripe.sigma.scheduledQueryRuns.retrieve(scheduled_query_run_id);
```

## stripe.skus

```cfc
stripe.skus.create();
stripe.skus.delete(sku_id);
stripe.skus.list();
stripe.skus.retrieve(sku_id);
stripe.skus.update(sku_id);
```

## stripe.sources

```cfc
stripe.sources.create();
stripe.sources.listSourceTransactions(source_id);
stripe.sources.retrieve(source_id);
stripe.sources.update(source_id);
stripe.sources.verify(source_id);
```

## stripe.subscriptionItems

```cfc
stripe.subscriptionItems.create();
stripe.subscriptionItems.createUsageRecord(subscription_item_id);
stripe.subscriptionItems.delete(subscription_item_id);
stripe.subscriptionItems.list();
stripe.subscriptionItems.listUsageRecordSummaries(subscription_item_id);
stripe.subscriptionItems.retrieve(subscription_item_id);
stripe.subscriptionItems.update(subscription_item_id);
```

## stripe.subscriptionSchedules

```cfc
stripe.subscriptionSchedules.cancel(subscription_schedule_id);
stripe.subscriptionSchedules.create();
stripe.subscriptionSchedules.list();
stripe.subscriptionSchedules.release(subscription_schedule_id);
stripe.subscriptionSchedules.retrieve(subscription_schedule_id);
stripe.subscriptionSchedules.update(subscription_schedule_id);
```

## stripe.subscriptions

```cfc
stripe.subscriptions.create();
stripe.subscriptions.delete(subscription_id);
stripe.subscriptions.deleteDiscount(subscription_id);
stripe.subscriptions.list();
stripe.subscriptions.retrieve(subscription_id);
stripe.subscriptions.update(subscription_id);
```

## stripe.taxCodes

```cfc
stripe.taxCodes.list();
stripe.taxCodes.retrieve(tax_code_id);
```

## stripe.taxRates

```cfc
stripe.taxRates.create();
stripe.taxRates.list();
stripe.taxRates.retrieve(tax_rate_id);
stripe.taxRates.update(tax_rate_id);
```

## stripe.terminal.connectionTokens

```cfc
stripe.terminal.connectionTokens.create();
```

## stripe.terminal.locations

```cfc
stripe.terminal.locations.create();
stripe.terminal.locations.delete(location_id);
stripe.terminal.locations.list();
stripe.terminal.locations.retrieve(location_id);
stripe.terminal.locations.update(location_id);
```

## stripe.terminal.readers

```cfc
stripe.terminal.readers.create();
stripe.terminal.readers.delete(reader_id);
stripe.terminal.readers.list();
stripe.terminal.readers.retrieve(reader_id);
stripe.terminal.readers.update(reader_id);
```

## stripe.tokens

```cfc
stripe.tokens.create();
stripe.tokens.retrieve(token_id);
```

## stripe.topups

```cfc
stripe.topups.cancel(topup_id);
stripe.topups.create();
stripe.topups.list();
stripe.topups.retrieve(topup_id);
stripe.topups.update(topup_id);
```

## stripe.transfers

```cfc
stripe.transfers.create();
stripe.transfers.createReversal(transfer_id);
stripe.transfers.list();
stripe.transfers.listReversals(transfer_id);
stripe.transfers.retrieve(transfer_id);
stripe.transfers.retrieveReversal(transfer_id, transfer_reversal_id);
stripe.transfers.update(transfer_id);
stripe.transfers.updateReversal(transfer_id, transfer_reversal_id);
```

## stripe.usageRecordSummaries

```cfc
stripe.usageRecordSummaries.list(subscription_item_id);
```

## stripe.usageRecords

```cfc
stripe.usageRecords.create(subscription_item_id);
```

## stripe.webhookEndpoints

```cfc
stripe.webhookEndpoints.create();
stripe.webhookEndpoints.delete(webhook_endpoint_id);
stripe.webhookEndpoints.list();
stripe.webhookEndpoints.retrieve(webhook_endpoint_id);
stripe.webhookEndpoints.update(webhook_endpoint_id);
```
