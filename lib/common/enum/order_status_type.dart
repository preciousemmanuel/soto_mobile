enum OrderStatusType {
  pending,
  delivered,
  cancelled,
  failed,
}

extension OrderStatusTypeExtension on OrderStatusType {
  String get name {
    switch (this) {
      case OrderStatusType.pending:
        return 'Pending';
      case OrderStatusType.delivered:
        return 'Delivered';
      case OrderStatusType.cancelled:
        return 'Cancelled';
      case OrderStatusType.failed:
        return 'Failed';
    }
  }
}
