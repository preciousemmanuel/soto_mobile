enum PaymentNarration {
  order,
  payout,
  refund,
}

extension PaymentNarrationExtension on PaymentNarration {
  String get text {
    switch (this) {
      case PaymentNarration.order:
        return "ORDER";
      case PaymentNarration.payout:
        return "PAYOUT";
      case PaymentNarration.refund:
        return "REFUND";
    }
  }
}
