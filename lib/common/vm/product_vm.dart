import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

const String paginatedProductState = 'paginatedProductState';

class ProductVM extends BaseVM {
  List<Product> _allProductList = [];
  List<Product> get allProductList => _allProductList;
  List<ProductCategory> _productCategories = [];
  List<ProductCategory> get productCategories => _productCategories;

  int _limit = 10;
  int get limit => _limit;
  final bool _gettingMore = false;
  bool get gettingMore => _gettingMore;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  Future<ApiResponse> getCategories() async {
    return await performApiCall(
      url: "/category/fetch?limit=15&page=1",
      method: apiService.get,
      onSuccess: (data) {
        _productCategories =
            productCategoryFromJson(json.encode(data['data']['data']));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getProductList({
    String? productName,
    String? category,
    String? priceUpper,
    String? priceLower,
    String? rating,
  }) async {
    QueryUriBuilder uriBuilder =
        QueryUriBuilder("/product/fetch?limit=10&page=1");

    if (productName != null) {
      uriBuilder.addQueryParameter("product_name", productName);
    }
    if (category != null) {
      uriBuilder.addQueryParameter("category", category);
    }
    if (priceUpper != null) {
      uriBuilder.addQueryParameter("price_upper", priceUpper);
    }
    if (priceLower != null) {
      uriBuilder.addQueryParameter("price_lower", priceLower);
    }
    if (rating != null) {
      uriBuilder.addQueryParameter("rating", rating);
    }

    printty(uriBuilder.build().toString(), logName: "getProductList uri");

    return await performApiCall(
      url: uriBuilder.build().toString(),
      method: apiService.get,
      onSuccess: (data) {
        _allProductList = productFromJson(jsonEncode(data["data"]["data"]));
        _hasMore = _allProductList.length == 10;
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getPaginatedProducts() async {
    _limit += 10;
    return await performApiCall(
      url: "/product/fetch?limit=$_limit&page=1",
      busyObjectName: paginatedProductState,
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _allProductList = [];
        _allProductList
            .addAll(productFromJson(jsonEncode(data["data"]["data"])));
        _hasMore = _allProductList.length == _limit;

        return apiResponse;
      },
    );
  }

  Future<ApiResponse> fetchSingleProduct({required String productId}) async {
    return await performApiCall(
      url: "/product/view-one/$productId",
      method: apiService.get,
      onSuccess: (data) {
        // _singleProduct = Product.fromJson(data["data"]["product"]);
        return ApiResponse(
            success: true, data: Product.fromJson(data["data"]["product"]));
      },
    );
  }
}
