import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

const String salesAnalyticsState = "salesAnalyticsState";
const String vendorInventoryState = "vendorInventoryState";

class VendorDashboardVM extends BaseVM {
  List<Transaction> _transactionList = <Transaction>[];
  List<Transaction> get transactionList => _transactionList;
  SalesAnalytics? _salesAnalytics;
  SalesAnalytics? get salesAnalytics => _salesAnalytics;
  VendorInventory? _vendorInventory;
  VendorInventory? get vendorInventory => _vendorInventory;
  List<InventoryRecordData> get inventoryRecords =>
      _vendorInventory?.inventoryRecords?.data ?? [];

  Future<ApiResponse> getVendorInventory() async {
    return await performApiCall(
      url: "/user/vendor-inventory?limit=10&page=1",
      method: apiService.getWithAuth,
      busyObjectName: vendorInventoryState,
      onSuccess: (data) {
        _vendorInventory = vendorInventoryFromJson(json.encode(data['data']));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getSalesAnalytics() async {
    return await performApiCall(
      url: "/user/sales-analytics",
      method: apiService.getWithAuth,
      busyObjectName: salesAnalyticsState,
      onSuccess: (data) {
        _salesAnalytics = salesAnalyticsFromJson(json.encode(data['data']));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getTransactions() async {
    return await performApiCall(
      url: "/transaction/logs?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _transactionList =
            transactionFromJson(json.encode(data['data']['data']));
        return apiResponse;
      },
    );
  }
}
