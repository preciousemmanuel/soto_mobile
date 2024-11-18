import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

class OrderVM extends BaseVM {
  List<OrderRes> _vendorOrder = [];
  List<OrderRes> get vendorOrder => _vendorOrder;

  Future<ApiResponse> addproductToCart(
      {required List<ProductCart> items}) async {
    printty("add to cart call");
    var bodyItemsList = items
        .map((item) => {
              "product_id": item.productId,
              "quantity": item.qty,
            })
        .toList();

    final body = {
      "items": bodyItemsList,
    };
    printty('bodyItemsList: $body');
    return await performApiCall(
      url: "/order/add-to-cart",
      method: apiService.postWithAuth,
      body: body,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> removeProductFromCart(String productId) async {
    printty("add to cart call with productId: $productId");
    return await performApiCall(
      url: "/order/remove-from-cart",
      method: apiService.putWithAuth,
      body: {"product_id": productId},
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> createOder({
    required List<ProductCart> items,
    required String address,
    PaymentType paymentType = PaymentType.instant,
  }) async {
    var bodyItemsList = items
        .map((item) => {
              "product_id": item.productId,
              "quantity": item.qty,
            })
        .toList();

    final body = {
      "items": bodyItemsList,
      "address": address,
      "payment_type": paymentType.name,
    };
    printty("add to cart call with body: $body");
    return await performApiCall(
      url: "/order/create",
      method: apiService.postWithAuth,
      body: body,
      onSuccess: (data) {
        return ApiResponse(success: true, data: data["data"]["_id"]);
      },
    );
  }

  Future<ApiResponse> generatePaymentLink({
    required int amount,
    required String orderId,
    PaymentNarration narration = PaymentNarration.order,
  }) async {
    final body = {
      "amount": amount,
      "narration": narration.text, // ORDER | PAYOUT | REFUND | WITHDRAWAL
      "narration_id": orderId
    };
    printty("add to cart call with body: $body");
    return await performApiCall(
      url: "/transaction/generate-payment-link",
      method: apiService.postWithAuth,
      body: body,
      onSuccess: (data) {
        return ApiResponse(
          success: true,
          data: data["data"]["data"]["authorization_url"],
        );
      },
    );
  }

  Future<ApiResponse> fetchBuyerOrders() async {
    printty("add to cart call");
    return await performApiCall(
      url: "/order/fetch/by-buyer?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _vendorOrder = orderResFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }
}

class ProductCart {
  ProductCart({required this.productId, required this.qty});

  final String productId;
  final int qty;
}
