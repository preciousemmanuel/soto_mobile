import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

class VendorOrderVm extends BaseVM {
  List<VendorOrder> _activeOrders = [];
  List<VendorOrder> get activeOrders => _activeOrders;

  Future<ApiResponse> fetchBuyerOrders({String? status}) async {
    printty("add to cart call");

    final url = "/order/fetch/by-vendor?limit=10&page=1&status=${status ?? ''}";
    return await performApiCall(
      url: url,
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _activeOrders = vendorOrderFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }
}
