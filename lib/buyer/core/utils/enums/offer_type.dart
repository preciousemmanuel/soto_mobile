enum OfferType {
  buy,
  sell,
  deal,
  none,
}

extension OfferTypeExtension on OfferType {
  String get name {
    switch (this) {
      case OfferType.buy:
        return 'buy_offer';
      case OfferType.sell:
        return 'sell_offer';
      case OfferType.deal:
        return 'deal_offer';
      case OfferType.none:
        return 'none';
    }
  }
}

class OfferTypeArg {
  OfferTypeArg(this.offerType);

  final OfferType offerType;
}
