function lpid
  if test "$argv[1]" = "-l"
    listprefixes
  else if test "$argv[1]" = "-p"
    set -l prefix $argv[2]
    set -l hexId $argv[3]
    echo (curl -s https://api.dev.limep.net/internal/utility/hex-to-contextual/$prefix/$hexId)
  else
    set -l ctxId $argv[1]
    echo (curl -s https://api.dev.limep.net/internal/utility/contextual-to-hex/$ctxId)
  end
end

function listprefixes
  echo Valid prefixes:
  echo '  - action (ActionId)'
  echo '  - acty (ActivityId)'
  echo '  - btxn (BalanceTransactionId)'
  echo '  - banktranchrg (BankTransferChargeId)'
  echo '  - banktran (BankTransferId)'
  echo '  - blockedsrc (BlockedPaymentSourceId)'
  echo '  - bnztrnrep (BnzTrnReportId)'
  echo '  - crdpsrc (CardPaymentSourceId)'
  echo '  - chrg (ChargeId)'
  echo '  - ccanal (CustomerCreditAnalysisId)'
  echo '  - custd (CustomerDelegateUserId)'
  echo '  - cust (CustomerId)'
  echo '  - ddpsrc (DirectDebitPaymentSourceId)'
  echo '  - disb (DisbursementId)'
  echo '  - dispute (DisputeId)'
  echo '  - elig (EligibilityOutcomeId)'
  echo '  - xacc (ExternalAccountId)'
  echo '  - illion (IllionResponseId)'
  echo '  - jnal (JournalEntryId)'
  echo '  - kyci (KycInfoId)'
  echo '  - kycs (KycStateId)'
  echo '  - lfile (LimeFileId)'
  echo '  - mktpfeestruct (MarketplaceFeeStructId)'
  echo '  - mktp (MarketplaceId)'
  echo '  - mktusr (MarketplaceUserId)'
  echo '  - mchtaut (MerchantAuthSettingsId)'
  echo '  - mchteo (MerchantEntityOwnerId)'
  echo '  - mchtsett (MerchantGeneralSettingsId)'
  echo '  - mcht (MerchantId)'
  echo '  - ordr (MerchantOrderId)'
  echo '  - mtok (MerchantTokenId)'
  echo '  - mtfr (MerchantTransferId)'
  echo '  - musr (MerchantUserId)'
  echo '  - murol (MerchantUserRoleId)'
  echo '  - card (PayCardId)'
  echo '  - dfrl (PayDeferralId)'
  echo '  - plan (PayPlanId)'
  echo '  - ptpf (PaymentProfileId)'
  echo '  - ptkn (PaymentTokenId)'
  echo '  - payout (PayoutId)'
  echo '  - pson (PersonId)'
  echo '  - pval (PlanValidityOutcomeId)'
  echo '  - rfnd (RefundId)'
  echo '  - raut (RemoteAuthorityId)'
  echo '  - srce (SourceId)'
  echo '  - subs (SubscriptionId)'
  echo '  - tran (TransactionId)'
  echo '  - trantransfer (TransactionTransferId)'
end
