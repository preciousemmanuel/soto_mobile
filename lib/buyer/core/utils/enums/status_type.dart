enum StatusType {
  success,
  pending,
  fail,
  none,
}

enum ResType {
  success,
  fail,
  info,
  none,
}

extension StatusTypeName on StatusType {
  String get name {
    switch (this) {
      case StatusType.success:
        return "successful";
      case StatusType.pending:
        return "pending";
      case StatusType.fail:
        return "failed";
      default:
        return ""; // Handle the case if no match is found
    }
  }
}
