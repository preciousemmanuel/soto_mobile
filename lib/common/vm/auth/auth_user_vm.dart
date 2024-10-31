import 'package:soto_ecommerce/common/common.dart';

class AuthUserVM extends BaseVM {
  AuthUserVM() {
    getUserFromStorage();
  }
  static const String dashboardLoading = "dashboardLoading";

  AuthUser? _authUser;
  AuthUser? get authUser => _authUser;
  Wallet? get wallet => _authUser?.wallet;

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
