import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:soto_ecommerce/common/common.dart';

const String salesAnalyticsState = "salesAnalyticsState";
const String vendorInventoryState = "vendorInventoryState";

class VendorDashboardVM extends BaseVM {
  Map<String, List<Transaction>> _groupedTransactionList = {};
  Map<String, List<Transaction>> get groupedTransactionList =>
      _groupedTransactionList;
  List<Transaction> _transactionList = <Transaction>[];
  List<Transaction> get transactionList => _transactionList;
  SalesAnalytics? _salesAnalytics;
  SalesAnalytics? get salesAnalytics => _salesAnalytics;
  VendorInventory? _vendorInventory;
  VendorInventory? get vendorInventory => _vendorInventory;
  VendorOverview? _vendorOverview;
  VendorOverview? get vendorOverview => _vendorOverview;
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
        final res = transactionFromJson(json.encode(data['data']['data']));
        _transactionList = res;
        _groupedTransactionList = groupBy(
          res,
          (Transaction session) =>
              DateFormat('dd MMM yyyy').format(session.createdAt!),
        );
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getVendorOverview(
      {TimeFrame timeFrame = TimeFrame.thisMonth}) async {
    return await performApiCall(
      url: "/user/vendor-overview?time_frame=${timeFrame.text}",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _vendorOverview = vendorOverviewFromJson(json.encode(data['data']));
        return apiResponse;
      },
    );
  }
}
