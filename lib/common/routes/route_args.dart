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

class WithdrawArgs {
  final String bankId;

  WithdrawArgs(this.bankId);
}

// for webview
class WebViewArg {
  final String? appBarText;
  final String webURL;
  final Function()? onBackPress;

  WebViewArg({
    this.appBarText,
    required this.webURL,
    this.onBackPress,
  });
}

class DashArg {
  final int? index;
  DashArg({this.index});
}

class VendorProductArgs {
  final bool isEdit;
  final Product? product;

  VendorProductArgs({this.isEdit = false, this.product});
}

class OrderDetailArg {
  final String orderId;
  OrderDetailArg({required this.orderId});
}
