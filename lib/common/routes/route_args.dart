// for product details
class ProductArgs {
  final String productId;
  ProductArgs({required this.productId});
}

class AllProductArgs {
  AllProductArgs({
    this.categoryId,
    this.searchQuery,
    this.isSearch = false,
  });

  final String? categoryId;
  final String? searchQuery;
  final bool isSearch;
}
