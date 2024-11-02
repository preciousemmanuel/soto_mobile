enum PaymentType { instant, onDelivery }

extension PaymentTypeExtension on PaymentType {
  String get name {
    switch (this) {
      case PaymentType.instant:
        return 'INSTANT';
      case PaymentType.onDelivery:
        return 'ON_DELIVERY';
    }
  }
}
