import 'package:soto_ecommerce/common/common.dart';

class CustomOrderVm extends BaseVM {
  // CustomOrderRes? _customOrderRes;
  // CustomOrderRes? get customOrderRes => _customOrderRes;

  Future<ApiResponse> createCustomOrder(
      List<CustomOrderRes> customOrders) async {
    // Remove all null or empty values from the CustomOrderRes objects
    final nonEmptyOrders = customOrders
        .map((order) =>
            order.toJson()..removeWhere((k, v) => v == null || v == ''))
        .toList();

    final body = {
      "orders": nonEmptyOrders,
    };
    printty("createCustomOrder body: $body");
    printty("createCustomOrder bodyxxxx: $customOrders");
    return await performApiCall(
      url: "/order/create-custom",
      method: apiService.post,
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

  Future<void> removeCustomOrderFromStorage(List<int> indexes) async {
    final storedCustomOrders =
        await StorageService.getString(StorageKey.customOrder);
    if (storedCustomOrders != null) {
      final customOrders = customOrderModelFromJson(storedCustomOrders);

      indexes.sort((a, b) => b.compareTo(a));

      for (int index in indexes) {
        if (index < customOrders.length) {
          customOrders.removeAt(index);
        }
      }

      await StorageService.storeString(
        StorageKey.customOrder,
        customOrderModelToJson(customOrders),
      );
    } else {
      await StorageService.storeString(
        StorageKey.customOrder,
        customOrderModelToJson([]),
      );
    }
  }

  Future<void> clearCustomOrderFromStorage() async {
    await StorageService.removeStringItem(StorageKey.customOrder);
  }
}
