import 'package:soto_ecommerce/common/common.dart';

class CustomOrderVm extends BaseVM {
  // CustomOrderRes? _customOrderRes;
  // CustomOrderRes? get customOrderRes => _customOrderRes;

  Future<ApiResponse> createCustomOrder(
      List<CustomOrderRes> customOrders) async {
    final body = {
      "orders": [...customOrders.map((e) => e.toJson())],
    };
    printty("createCustomOrder body: $body");
    return await performApiCall(
      url: "/order/create-custom",
      method: apiService.postWithAuth,
      body: body,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> saveCustomOrderToStorage(
      CustomOrderRes customOrder) async {
    printty('customOrder: ${customOrder.toString()}');
    List<CustomOrderRes> customOrders = [];

    final storedCustomOrders =
        await StorageService.getString(StorageKey.customOrder);
    if (storedCustomOrders != null) {
      customOrders = customOrderModelFromJson(storedCustomOrders);
    }
    customOrders.add(customOrder);
    await StorageService.storeString(
        StorageKey.customOrder, customOrderModelToJson(customOrders));
    return ApiResponse(success: true, message: 'Order saved successfully');
  }

  Future<List<CustomOrderRes>> getCustomOrderFromStorage() async {
    final storedCustomOrders =
        await StorageService.getString(StorageKey.customOrder);

    return storedCustomOrders != null
        ? customOrderModelFromJson(storedCustomOrders)
        : [];
  }

  Future<void> clearCustomOrderFromStorage() async {
    await StorageService.removeStringItem(StorageKey.customOrder);
  }
}
