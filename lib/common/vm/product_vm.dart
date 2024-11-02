import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

class ProductVM extends BaseVM {
  List<Product> _allProductList = [];
  List<Product> get allProductList => _allProductList;

  Future<ApiResponse> getProductList() async {
    return await performApiCall(
      url: "/product/fetch?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _allProductList = productFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> fetchSingleProduct({required String productId}) async {
    return await performApiCall(
      url: "/product/view-one/$productId",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        // _singleProduct = Product.fromJson(data["data"]["product"]);
        return ApiResponse(
            success: true, data: Product.fromJson(data["data"]["product"]));
      },
    );
  }
}
