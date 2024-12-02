// for product details
import 'package:soto_ecommerce/common/common.dart';

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

class ProductCatArg {
  ProductCatArg({
    required this.category,
  });

  final ProductCategory category;
}

// for webview
class WebViewArg {
  final String? appBarText;
  final String webURL;

  WebViewArg({this.appBarText, required this.webURL});
}
