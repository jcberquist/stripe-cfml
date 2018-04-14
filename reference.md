# stripe-cfml reference

For documentation on which arguments can be passed to each method please see the [Stripe API Reference](https://stripe.com/docs/api). The arguments that are listed here are named arguments that ultimately appear in the URL of an API HTTP request. Since the Node library passes these arguments by position, you can refer to this page to see the names to use when passing these arguments by name.

## stripe.accounts

```cfc
stripe.accounts.create();
stripe.accounts.createExternalAccount(account_id);
stripe.accounts.createLoginLink(account_id);
stripe.accounts.delete(account_id);
stripe.accounts.deleteExternalAccount(account_id, source_id);
stripe.accounts.list();
stripe.accounts.listExternalAccounts(account_id);
stripe.accounts.reject(account_id);
stripe.accounts.retrieve();
stripe.accounts.retrieve(account_id);
stripe.accounts.retrieveExternalAccount(account_id, source_id);
stripe.accounts.update(account_id);
stripe.accounts.updateExternalAccount(account_id, source_id);
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
stripe.balance.listTransactions();
stripe.balance.retrieve();
stripe.balance.retrieveTransaction(balance_transaction_id);
```

## stripe.charges

```cfc
stripe.charges.capture(charge_id);
stripe.charges.create();
stripe.charges.list();
stripe.charges.retrieve(charge_id);
stripe.charges.update(charge_id);
stripe.charges.markAsSafe(charge_id);
stripe.charges.markAsFraudulent(charge_id);
```

## stripe.countrySpecs

```cfc
stripe.countrySpecs.list();
stripe.countrySpecs.retrieve(country_spec_id);
```

## stripe.coupons

```cfc
stripe.coupons.create();
stripe.coupons.list();
stripe.coupons.retrieve(coupon_id);
stripe.coupons.update(coupon_id);
```

## stripe.customers

```cfc
stripe.customers.create();
stripe.customers.createSource(customer_id);
stripe.customers.delete(customer_id);
stripe.customers.deleteDiscount(customer_id);
stripe.customers.deleteSource(customer_id, source_id);
stripe.customers.list();
stripe.customers.listSources(customer_id);
stripe.customers.retrieve(customer_id);
stripe.customers.retrieveSource(customer_id, source_id);
stripe.customers.update(customer_id);
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

## stripe.fileUploads

```cfc
stripe.fileUploads.create();
stripe.fileUploads.list();
stripe.fileUploads.retrieve(file_upload_id);
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
stripe.invoices.list();
stripe.invoices.pay(invoice_id);
stripe.invoices.retrieve(invoice_id);
stripe.invoices.retrieveLines(invoice_id);
stripe.invoices.retrieveUpcoming(invoice_id);
stripe.invoices.update(invoice_id);
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

## stripe.payouts

```cfc
stripe.payouts.cancel(payout_id);
stripe.payouts.create();
stripe.payouts.list();
stripe.payouts.retrieve(payout_id);
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

## stripe.products

```cfc
stripe.products.create();
stripe.products.delete(product_id);
stripe.products.list();
stripe.products.retrieve(product_id);
stripe.products.update(product_id);
```

## stripe.refunds

```cfc
stripe.refunds.create();
stripe.refunds.list();
stripe.refunds.retrieve(refund_id);
stripe.refunds.update(refund_id);
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
stripe.subscriptionItems.delete(subscription_item_id);
stripe.subscriptionItems.list();
stripe.subscriptionItems.retrieve(subscription_item_id);
stripe.subscriptionItems.update(subscription_item_id);
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

## stripe.tokens

```cfc
stripe.tokens.create();
stripe.tokens.retrieve(token_id);
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

## stripe.usageRecords

```cfc
stripe.usageRecords.create();
```
