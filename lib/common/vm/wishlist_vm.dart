import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

const String favouriteState = 'favouriteState';

class WishlistVM extends BaseVM {
  List<WaitlistRes> _wishListProduct = [];
  List<WaitlistRes> get wishListProduct => _wishListProduct;

  Future<ApiResponse> getWishList() async {
    return await performApiCall(
      url: "/product/fetch-wishlist?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _wishListProduct =
            waitlistResFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> addToWishList(String productId) async {
    printty("add to wish list call with productId: $productId");
    return await performApiCall(
      url: "/product/add-to-wishlist/$productId",
      method: apiService.postWithAuth,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }
}
