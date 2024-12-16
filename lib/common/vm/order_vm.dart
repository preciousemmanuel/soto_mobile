import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

class OrderVM extends BaseVM {
  List<OrderRes> _activeOrders = [];
  List<OrderRes> get activeOrders => _activeOrders;
  List<ProductCart> _cartItems = [];
  List<ProductCart> get cartItems => _cartItems;
  OrderDetailsRes? _singleOrder;
  OrderDetailsRes? get singleOrder => _singleOrder;
  ShippingCostAgility? _shippingCostAgility;
  ShippingCostAgility? get shippingCostAgility => _shippingCostAgility;
  List<String> get orderTrackSteps {
    final orderItinerary = _singleOrder?.orderItinerary;
    if (orderItinerary == null) return [];

    return orderItinerary.toJson().values.whereType<String>().toList();
  }

  Future<void> addproductToCart({required ProductCart product}) async {
    printty("add to cart call with product: $product");

    final index =
        _cartItems.indexWhere((item) => item.productId == product.productId);

    if (index != -1) {
      _cartItems[index].qty += product.qty;
    } else {
      _cartItems.add(product);
    }

    StorageService.storeString(
        StorageKey.productCart, productCartToJson(_cartItems));
    reBuildUI();
  }

  Future<void> getCartFromStorage() async {
    final cart = await StorageService.getString(StorageKey.productCart);
    printty("cart: $cart");
    _cartItems = cart != null ? productCartFromJson(cart) : [];

    reBuildUI();
  }

  Future<void> removeProductFromCart(String productId) async {
    final index = _cartItems.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      _cartItems.removeAt(index);
    }
    StorageService.storeString(
        StorageKey.productCart, productCartToJson(_cartItems));
    reBuildUI();
  }

  double get cartTotalAmount {
    double total = 0;
    for (var item in _cartItems) {
      total += (item.qty) * (item.unitPrice ?? 0);
    }
    return total;
  }

  void increaseCartQty(String productId) {
    for (var item in _cartItems) {
      if (item.productId == productId) {
        item.qty++;
      }
    }

    reBuildUI();
  }

  void decreaseCartQty(String productId) {
    for (var item in _cartItems) {
      if (item.productId == productId) {
        if (item.qty == 1) {
          removeProductFromCart(productId);
          return;
        }
        item.qty--;
      }
    }

    reBuildUI();
  }

  void clearCart() {
    _cartItems = [];
    StorageService.removeStringItem(StorageKey.productCart);
    reBuildUI();
  }

  // Future<ApiResponse> removeProductFromCart(String productId) async {
  //   printty("add to cart call with productId: $productId");
  //   return await performApiCall(
  //     url: "/order/remove-from-cart",
  //     method: apiService.putWithAuth,
  //     body: {"product_id": productId},
  //     onSuccess: (data) {
  //       return apiResponse;
  //     },
  //   );
  // }

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
    required double amount,
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

  Future<ApiResponse> fetchBuyerOrders({String? status}) async {
    printty("add to cart call");

    final url = "/order/fetch/by-buyer?limit=10&page=1&status=${status ?? ''}";
    return await performApiCall(
      url: url,
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _activeOrders = orderResFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getDeliveryAgilityPrice({
    required List<ProductCart> items,
  }) async {
    final bodyItemsList = items
        .map((item) => {
              "_id": item.productId,
              "quantity": item.qty,
            })
        .toList();

    printty("add to cart call with body: $bodyItemsList");
    return await performApiCall(
      url: "/delivery/agility-get-price",
      method: apiService.postWithAuth,
      body: {"items": bodyItemsList},
      onSuccess: (data) {
        _shippingCostAgility =
            shippingCostAgilityFromJson(jsonEncode(data["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> fetchOrderDetails(String id) async {
    final url = "/order/view-one/$id";
    return await performApiCall(
      url: url,
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _singleOrder = OrderDetailsRes.fromJson(data["data"]);
        return apiResponse;
      },
    );
  }

  //   Future<ApiResponse> addproductToCart(
  //     {required List<ProductCart> items}) async {
  //   printty("add to cart call");
  //   var bodyItemsList = items
  //       .map((item) => {
  //             "product_id": item.productId,
  //             "quantity": item.qty,
  //           })
  //       .toList();

  //   final body = {
  //     "items": bodyItemsList,
  //   };
  //   printty('bodyItemsList: $body');
  //   return await performApiCall(
  //     url: "/order/add-to-cart",
  //     method: apiService.postWithAuth,
  //     body: body,
  //     onSuccess: (data) {
  //       return apiResponse;
  //     },
  //   );
  // }
}

// Used to format payloads, not API res
List<ProductCart> productCartFromJson(String str) => List<ProductCart>.from(
    json.decode(str).map((x) => ProductCart.fromJson(x)));

String productCartToJson(List<ProductCart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCart {
  ProductCart({
    required this.productId,
    required this.qty,
    this.productImage,
    this.productName,
    this.unitPrice,
  });

  String productId;
  int qty;
  String? productImage;
  String? productName;
  double? unitPrice;

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'qty': qty,
      'productImage': productImage,
      'productName': productName,
      'unitPrice': unitPrice,
    };
  }

  factory ProductCart.fromMap(Map<String, dynamic> map) {
    return ProductCart(
      productId: map['productId'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      productImage: map['productImage'],
      productName: map['productName'],
      unitPrice: map['unitPrice']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCart.fromJson(String source) =>
      ProductCart.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductCart &&
        other.productId == productId &&
        other.qty == qty &&
        other.productImage == productImage &&
        other.productName == productName &&
        other.unitPrice == unitPrice;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        qty.hashCode ^
        productImage.hashCode ^
        productName.hashCode ^
        unitPrice.hashCode;
  }
}
