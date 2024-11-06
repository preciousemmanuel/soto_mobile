import 'package:soto_ecommerce/common/common.dart';

class AuthUserVM extends BaseVM {
  AuthUserVM() {
    getUserFromStorage();
  }
  static const String dashboardLoading = "dashboardLoading";

  AuthUser? _authUser;
  AuthUser? get authUser => _authUser;
  Wallet? get wallet => _authUser?.wallet;
  Cart? get cart => _authUser?.cart;
  Business? get business => _authUser?.business;
  String get shippingADD =>
      '${authUser?.shippingAddress?.fullAddress}, ${authUser?.shippingAddress?.country}';
  String get fullname =>
      '${(authUser?.firstName ?? '').capitalizeFirstLetter()} ${(authUser?.lastName ?? '').capitalizeFirstLetter()}';

  void getUserFromStorage() async {
    var authUser = await StorageService.getUser();
    if (authUser != null) {
      _authUser = authUser;
      reBuildUI();
    }
  }

  void setHasSeenOnboarding() {
    StorageService.storeBoolItem(StorageKey.onboarding, true);
  }

  void setVendorUser() {
    StorageService.storeBoolItem(StorageKey.vendorUser, true);
  }

  void removeVendorUser() {
    StorageService.removeBoolItem(StorageKey.vendorUser);
  }

  Future<ApiResponse> getUserProfile({String? busyObjectName}) async {
    return await performApiCall(
      url: "/user/profile",
      method: apiService.getWithAuth,
      busyObjectName: busyObjectName,
      onSuccess: (data) {
        String token = data["data"]["Token"];
        StorageService.storeAccessToken(token);
        StorageService.storeUser(data["data"]);
        _authUser = AuthUser.fromJson(data["data"]);
        return apiResponse;
      },
    );
  }
}
