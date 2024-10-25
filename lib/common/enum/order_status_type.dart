enum OrderStatusType { active, custom, delivered, cancelled }

extension OrderStatusTypeExtension on OrderStatusType {
  String get name {
    switch (this) {
      case OrderStatusType.active:
        return 'Active';
      case OrderStatusType.custom:
        return 'Custom';
      case OrderStatusType.delivered:
        return 'Delivered';
      case OrderStatusType.cancelled:
        return 'Cancelled';
    }
  }
}
