import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

class ProductVM extends BaseVM {
  List<Product> _wishListProduct = [];
  List<Product> get wishListProduct => _wishListProduct;

  Future<ApiResponse> getProductList() async {
    return await performApiCall(
      url: "/product/fetch?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> fetchSingleProduct({required String productId}) async {
    return await performApiCall(
      url: "/product/view-one/$productId",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        return ApiResponse(success: true, data: Product.fromJson(data["data"]));
      },
    );
  }

  Future<ApiResponse> getWishList() async {
    return await performApiCall(
      url: "/product/fetch-wishlist?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _wishListProduct = productFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }
}
