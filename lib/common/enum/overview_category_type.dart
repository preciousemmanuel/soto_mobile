enum OverviewCategoryType {
  overview,
  inventory,
  transactions,
}

extension OverviewCategoryTypeExtension on OverviewCategoryType {
  String get name {
    switch (this) {
      case OverviewCategoryType.overview:
        return "Overview";
      case OverviewCategoryType.inventory:
        return "Inventory";
      case OverviewCategoryType.transactions:
        return "Transactions";
    }
  }
}
