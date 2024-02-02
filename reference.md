# stripe-cfml reference

For documentation on which arguments can be passed to each method please see the [Stripe API Reference](https://stripe.com/docs/api). The arguments that are listed here are named arguments that ultimately appear in the URL of an API HTTP request. Since the Node library passes these arguments by position, you can refer to this page to see the names to use when passing these arguments by name.

## stripe.accountLinks

```cfc
stripe.accountLinks.create();
```

## stripe.accountSessions

```cfc
stripe.accountSessions.create();
```

## stripe.accounts

```cfc
stripe.accounts.create();
stripe.accounts.createExternalAccount(account_id);
stripe.accounts.createLoginLink(account_id);
stripe.accounts.createPerson(account_id);
stripe.accounts.delete(account_id);
stripe.accounts.deleteExternalAccount(account_id, external_account_id);
stripe.accounts.deletePerson(account_id, person_id);
stripe.accounts.list();
stripe.accounts.listCapabilities(account_id);
stripe.accounts.listExternalAccounts(account_id);
stripe.accounts.listPersons(account_id);
stripe.accounts.reject(account_id);
stripe.accounts.retrieve();
stripe.accounts.retrieve(account_id);
stripe.accounts.retrieveCapability(account_id, capability_id);
stripe.accounts.retrieveExternalAccount(account_id, external_account_id);
stripe.accounts.retrievePerson(account_id, person_id);
stripe.accounts.update(account_id);
stripe.accounts.updateCapability(account_id, capability_id);
stripe.accounts.updateExternalAccount(account_id, external_account_id);
stripe.accounts.updatePerson(account_id, person_id);
```

## stripe.applePayDomains

```cfc
stripe.applePayDomains.create();
stripe.applePayDomains.delete(domain_id);
stripe.applePayDomains.list();
stripe.applePayDomains.retrieve(domain_id);
```

## stripe.applicationFees

```cfc
stripe.applicationFees.createRefund(application_fee_id);
stripe.applicationFees.list();
stripe.applicationFees.listRefunds(application_fee_id);
stripe.applicationFees.retrieve(application_fee_id);
stripe.applicationFees.retrieveRefund(application_fee_id, refund_id);
stripe.applicationFees.updateRefund(application_fee_id, refund_id);
```

## stripe.apps.secrets

```cfc
stripe.apps.secrets.create();
stripe.apps.secrets.deleteWhere();
stripe.apps.secrets.find();
stripe.apps.secrets.list();
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
stripe.charges.search();
stripe.charges.update(charge_id);
```

## stripe.checkout.sessions

```cfc
stripe.checkout.sessions.create();
stripe.checkout.sessions.expire(session_id);
stripe.checkout.sessions.list();
stripe.checkout.sessions.listLineItems(session_id);
stripe.checkout.sessions.retrieve(session_id);
```

## stripe.climate.orders

```cfc
stripe.climate.orders.cancel(order_id);
stripe.climate.orders.create();
stripe.climate.orders.list();
stripe.climate.orders.retrieve(order_id);
stripe.climate.orders.update(order_id);
```

## stripe.climate.products

```cfc
stripe.climate.products.list();
stripe.climate.products.retrieve(product_id);
```

## stripe.climate.suppliers

```cfc
stripe.climate.suppliers.list();
stripe.climate.suppliers.retrieve(supplier_id);
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

## stripe.customerSessions

```cfc
stripe.customerSessions.create();
```

## stripe.customers

```cfc
stripe.customers.create();
stripe.customers.createBalanceTransaction(customer_id);
stripe.customers.createFundingInstructions(customer_id);
stripe.customers.createSource(customer_id);
stripe.customers.createTaxId(customer_id);
stripe.customers.delete(customer_id);
stripe.customers.deleteDiscount(customer_id);
stripe.customers.deleteSource(customer_id, source_id);
stripe.customers.deleteTaxId(customer_id, tax_id);
stripe.customers.list();
stripe.customers.listBalanceTransactions(customer_id);
stripe.customers.listCashBalanceTransactions(customer_id);
stripe.customers.listPaymentMethods(customer_id);
stripe.customers.listSources(customer_id);
stripe.customers.listTaxIds(customer_id);
stripe.customers.retrieve(customer_id);
stripe.customers.retrieveBalanceTransaction(customer_id, balance_transaction_id);
stripe.customers.retrieveCashBalance(customer_id);
stripe.customers.retrieveCashBalanceTransaction(customer_id, cash_balance_transaction_id);
stripe.customers.retrievePaymentMethod(customer_id, payment_method_id);
stripe.customers.retrieveSource(customer_id, source_id);
stripe.customers.retrieveTaxId(customer_id, tax_id);
stripe.customers.search();
stripe.customers.update(customer_id);
stripe.customers.updateBalanceTransaction(customer_id, balance_transaction_id);
stripe.customers.updateCashBalance(customer_id);
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

## stripe.financialConnections.accounts

```cfc
stripe.financialConnections.accounts.disconnect(account_id);
stripe.financialConnections.accounts.list();
stripe.financialConnections.accounts.listOwners(account_id);
stripe.financialConnections.accounts.refresh(account_id);
stripe.financialConnections.accounts.retrieve(account_id);
stripe.financialConnections.accounts.subscribe(account_id);
stripe.financialConnections.accounts.unsubscribe(account_id);
```

## stripe.financialConnections.sessions

```cfc
stripe.financialConnections.sessions.create();
stripe.financialConnections.sessions.retrieve(session_id);
```

## stripe.financialConnections.transactions

```cfc
stripe.financialConnections.transactions.list();
stripe.financialConnections.transactions.retrieve(transaction_id);
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
stripe.invoices.listUpcomingLines();
stripe.invoices.markUncollectible(invoice_id);
stripe.invoices.pay(invoice_id);
stripe.invoices.retrieve(invoice_id);
stripe.invoices.retrieveUpcoming();
stripe.invoices.search();
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

## stripe.issuing.tokens

```cfc
stripe.issuing.tokens.list();
stripe.issuing.tokens.retrieve(token_id);
stripe.issuing.tokens.update(token_id);
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
stripe.orders.cancel(order_id);
stripe.orders.create();
stripe.orders.list();
stripe.orders.listLineItems(order_id);
stripe.orders.reopen(order_id);
stripe.orders.retrieve(order_id);
stripe.orders.submit(order_id);
stripe.orders.update(order_id);
```

## stripe.paymentIntents

```cfc
stripe.paymentIntents.applyCustomerBalance(payment_intent_id);
stripe.paymentIntents.cancel(payment_intent_id);
stripe.paymentIntents.capture(payment_intent_id);
stripe.paymentIntents.confirm(payment_intent_id);
stripe.paymentIntents.create();
stripe.paymentIntents.incrementAuthorization(payment_intent_id);
stripe.paymentIntents.list();
stripe.paymentIntents.retrieve(payment_intent_id);
stripe.paymentIntents.search();
stripe.paymentIntents.update(payment_intent_id);
stripe.paymentIntents.verifyMicrodeposits(payment_intent_id);
```

## stripe.paymentLinks

```cfc
stripe.paymentLinks.create();
stripe.paymentLinks.list();
stripe.paymentLinks.listLineItems(payment_link_id);
stripe.paymentLinks.retrieve(payment_link_id);
stripe.paymentLinks.update(payment_link_id);
```

## stripe.paymentMethodConfigurations

```cfc
stripe.paymentMethodConfigurations.create();
stripe.paymentMethodConfigurations.list();
stripe.paymentMethodConfigurations.retrieve(payment_method_configuration_id);
stripe.paymentMethodConfigurations.update(payment_method_configuration_id);
```

## stripe.paymentMethodDomains

```cfc
stripe.paymentMethodDomains.create();
stripe.paymentMethodDomains.list();
stripe.paymentMethodDomains.retrieve(payment_method_domain_id);
stripe.paymentMethodDomains.update(payment_method_domain_id);
stripe.paymentMethodDomains.validate(payment_method_domain_id);
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
stripe.prices.search();
stripe.prices.update(price_id);
```

## stripe.products

```cfc
stripe.products.create();
stripe.products.delete(product_id);
stripe.products.list();
stripe.products.retrieve(product_id);
stripe.products.search();
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
stripe.refunds.cancel(refund_id);
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
stripe.setupIntents.verifyMicrodeposits(setup_intent_id);
```

## stripe.shippingRates

```cfc
stripe.shippingRates.create();
stripe.shippingRates.list();
stripe.shippingRates.retrieve(shipping_rate_id);
stripe.shippingRates.update(shipping_rate_id);
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
stripe.subscriptions.cancel(subscription_id);
stripe.subscriptions.create();
stripe.subscriptions.deleteDiscount(subscription_id);
stripe.subscriptions.list();
stripe.subscriptions.resume(subscription_id);
stripe.subscriptions.retrieve(subscription_id);
stripe.subscriptions.search();
stripe.subscriptions.update(subscription_id);
```

## stripe.tax.calculations

```cfc
stripe.tax.calculations.create();
stripe.tax.calculations.listLineItems(calculation_id);
```

## stripe.tax.registrations

```cfc
stripe.tax.registrations.create();
stripe.tax.registrations.list();
stripe.tax.registrations.retrieve(registration_id);
stripe.tax.registrations.update(registration_id);
```

## stripe.tax.settings

```cfc
stripe.tax.settings.retrieve();
stripe.tax.settings.update();
```

## stripe.tax.transactions

```cfc
stripe.tax.transactions.createFromCalculation();
stripe.tax.transactions.createReversal();
stripe.tax.transactions.listLineItems(transaction_id);
stripe.tax.transactions.retrieve(transaction_id);
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

## stripe.terminal.configurations

```cfc
stripe.terminal.configurations.create();
stripe.terminal.configurations.delete(configuration_id);
stripe.terminal.configurations.list();
stripe.terminal.configurations.retrieve(configuration_id);
stripe.terminal.configurations.update(configuration_id);
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
stripe.terminal.readers.cancelAction(reader_id);
stripe.terminal.readers.create();
stripe.terminal.readers.delete(reader_id);
stripe.terminal.readers.list();
stripe.terminal.readers.processPaymentIntent(reader_id);
stripe.terminal.readers.processSetupIntent(reader_id);
stripe.terminal.readers.refundPayment(reader_id);
stripe.terminal.readers.retrieve(reader_id);
stripe.terminal.readers.setReaderDisplay(reader_id);
stripe.terminal.readers.update(reader_id);
```

## stripe.testHelpers.customers

```cfc
stripe.testHelpers.customers.fundCashBalance(customer_id);
```

## stripe.testHelpers.issuing.authorizations

```cfc
stripe.testHelpers.issuing.authorizations.capture(authorization_id);
stripe.testHelpers.issuing.authorizations.create();
stripe.testHelpers.issuing.authorizations.expire(authorization_id);
stripe.testHelpers.issuing.authorizations.increment(authorization_id);
stripe.testHelpers.issuing.authorizations.reverse(authorization_id);
```

## stripe.testHelpers.issuing.cards

```cfc
stripe.testHelpers.issuing.cards.deliverCard(card_id);
stripe.testHelpers.issuing.cards.failCard(card_id);
stripe.testHelpers.issuing.cards.returnCard(card_id);
stripe.testHelpers.issuing.cards.shipCard(card_id);
```

## stripe.testHelpers.issuing.transactions

```cfc
stripe.testHelpers.issuing.transactions.createForceCapture();
stripe.testHelpers.issuing.transactions.createUnlinkedRefund();
stripe.testHelpers.issuing.transactions.refund(transaction_id);
```

## stripe.testHelpers.refunds

```cfc
stripe.testHelpers.refunds.expire(refund_id);
```

## stripe.testHelpers.terminal.readers

```cfc
stripe.testHelpers.terminal.readers.presentPaymentMethod(reader_id);
```

## stripe.testHelpers.testClocks

```cfc
stripe.testHelpers.testClocks.advance(test_clock_id);
stripe.testHelpers.testClocks.create();
stripe.testHelpers.testClocks.delete(test_clock_id);
stripe.testHelpers.testClocks.list();
stripe.testHelpers.testClocks.retrieve(test_clock_id);
```

## stripe.testHelpers.treasury.inboundTransfers

```cfc
stripe.testHelpers.treasury.inboundTransfers.fail(inbound_transfer_id);
stripe.testHelpers.treasury.inboundTransfers.returnInboundTransfer(inbound_transfer_id);
stripe.testHelpers.treasury.inboundTransfers.succeed(inbound_transfer_id);
```

## stripe.testHelpers.treasury.outboundPayments

```cfc
stripe.testHelpers.treasury.outboundPayments.fail(outbound_payment_id);
stripe.testHelpers.treasury.outboundPayments.post(outbound_payment_id);
stripe.testHelpers.treasury.outboundPayments.returnOutboundPayment(outbound_payment_id);
```

## stripe.testHelpers.treasury.outboundTransfers

```cfc
stripe.testHelpers.treasury.outboundTransfers.fail(outbound_transfer_id);
stripe.testHelpers.treasury.outboundTransfers.post(outbound_transfer_id);
stripe.testHelpers.treasury.outboundTransfers.returnOutboundTransfer(outbound_transfer_id);
```

## stripe.testHelpers.treasury.receivedCredits

```cfc
stripe.testHelpers.treasury.receivedCredits.create();
```

## stripe.testHelpers.treasury.receivedDebits

```cfc
stripe.testHelpers.treasury.receivedDebits.create();
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
stripe.transfers.retrieveReversal(transfer_id, reversal_id);
stripe.transfers.update(transfer_id);
stripe.transfers.updateReversal(transfer_id, reversal_id);
```

## stripe.treasury.creditReversals

```cfc
stripe.treasury.creditReversals.create();
stripe.treasury.creditReversals.list();
stripe.treasury.creditReversals.retrieve(credit_reversal_id);
```

## stripe.treasury.debitReversals

```cfc
stripe.treasury.debitReversals.create();
stripe.treasury.debitReversals.list();
stripe.treasury.debitReversals.retrieve(debit_reversal_id);
```

## stripe.treasury.financialAccounts

```cfc
stripe.treasury.financialAccounts.create();
stripe.treasury.financialAccounts.list();
stripe.treasury.financialAccounts.retrieve(financial_account_id);
stripe.treasury.financialAccounts.retrieveFeatures(financial_account_id);
stripe.treasury.financialAccounts.update(financial_account_id);
stripe.treasury.financialAccounts.updateFeatures(financial_account_id);
```

## stripe.treasury.inboundTransfers

```cfc
stripe.treasury.inboundTransfers.cancel(inbound_transfer_id);
stripe.treasury.inboundTransfers.create();
stripe.treasury.inboundTransfers.list();
stripe.treasury.inboundTransfers.retrieve(inbound_transfer_id);
```

## stripe.treasury.outboundPayments

```cfc
stripe.treasury.outboundPayments.cancel(outbound_payment_id);
stripe.treasury.outboundPayments.create();
stripe.treasury.outboundPayments.list();
stripe.treasury.outboundPayments.retrieve(outbound_payment_id);
```

## stripe.treasury.outboundTransfers

```cfc
stripe.treasury.outboundTransfers.cancel(outbound_transfer_id);
stripe.treasury.outboundTransfers.create();
stripe.treasury.outboundTransfers.list();
stripe.treasury.outboundTransfers.retrieve(outbound_transfer_id);
```

## stripe.treasury.receivedCredits

```cfc
stripe.treasury.receivedCredits.list();
stripe.treasury.receivedCredits.retrieve(received_credit_id);
```

## stripe.treasury.receivedDebits

```cfc
stripe.treasury.receivedDebits.list();
stripe.treasury.receivedDebits.retrieve(received_debit_id);
```

## stripe.treasury.transactionEntries

```cfc
stripe.treasury.transactionEntries.list();
stripe.treasury.transactionEntries.retrieve(transaction_entry_id);
```

## stripe.treasury.transactions

```cfc
stripe.treasury.transactions.list();
stripe.treasury.transactions.retrieve(transaction_id);
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
