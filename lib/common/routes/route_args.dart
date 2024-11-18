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

// for webview
class WebViewArg {
  final String? appBarText;
  final String webURL;

  WebViewArg({this.appBarText, required this.webURL});
}
