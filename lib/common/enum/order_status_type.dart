enum OrderStatusType {
  pending,
  booked,
  delivered,
  cancelled,
  failed,
  returned,
  custom,
}

extension OrderStatusTypeExtension on OrderStatusType {
  String get name {
    switch (this) {
      case OrderStatusType.pending:
        return 'Pending';
      case OrderStatusType.booked:
        return 'Booked';
      case OrderStatusType.delivered:
        return 'Delivered';
      case OrderStatusType.cancelled:
        return 'Cancelled';
      case OrderStatusType.failed:
        return 'Failed';
      case OrderStatusType.returned:
        return 'Returned';
      case OrderStatusType.custom:
        return 'Custom';
    }
  }
}
