import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

class VendorOrderVm extends BaseVM {
  List<VendorOrder> _activeOrders = [];
  List<VendorOrder> get activeOrders => _activeOrders;
  OrderDetailsRes? _singleOrder;
  OrderDetailsRes? get singleOrder => _singleOrder;

  Future<ApiResponse> fetchVendorOrders({String? status}) async {
    printty("add to cart call");

    final url =
        "/order/fetch/by-vendor-new?limit=100&page=1&status=${status ?? ''}";
    return await performApiCall(
      url: url,
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _activeOrders = vendorOrderFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> fetchOrderDetails(String id) async {
    final url = "/order/view-one-by-vendor/$id";
    return await performApiCall(
      url: url,
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _singleOrder = OrderDetailsRes.fromJson(data["data"]);
        return apiResponse;
      },
    );
  }
}
