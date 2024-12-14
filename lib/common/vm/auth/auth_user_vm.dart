import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

class AuthUserVM extends BaseVM {
  AuthUserVM() {
    getUserFromStorage();
  }
  static const String dashboardLoading = "dashboardLoading";
  static const String updatingShipment = "updatingShipment";

  AuthUser? _authUser;
  AuthUser? get authUser => _authUser;
  Wallet? get wallet => _authUser?.wallet;
  Cart? get cart => _authUser?.cart;
  Business? get business => _authUser?.business;
  List<CityModel> _cities = [];
  List<CityModel> get cities => _cities;
  List<StateModel> _states = [];
  List<StateModel> get states => _states;

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
        String? token = data["data"]?["Token"];
        if (token != null) StorageService.storeAccessToken(token);
        if (data["data"] != null) StorageService.storeUser(data["data"]);
        if (data["data"] != null) _authUser = AuthUser.fromJson(data["data"]);
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> userUpdateShippingAddress({
    String? address,
    String? city,
    String? state,
    String? country,
    String? postalCode,
  }) async {
    return await performApiCall(
      url: "/user/add-shipping-address",
      method: apiService.putWithAuth,
      busyObjectName: updatingShipment,
      body: {
        "address": address,
        "city": city,
        "postal_code": postalCode,
        "state": state,
        "country": country
      },
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getStates() async {
    return await performApiCall(
      url: "/delivery/get-states",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _states = stateModelFromJson(jsonEncode(data["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getCities({
    required String countryCode,
    required String stateCode,
  }) async {
    return await performApiCall(
      url:
          "/delivery/get-cities?country_code=$countryCode&state_code=$stateCode",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _cities = cityModelFromJson(jsonEncode(data["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> addFCMToken({
    required String fcmToken,
  }) async {
    printty('fcmToken: $fcmToken');
    return await performApiCall(
      url: "/notification/add-tokens",
      method: apiService.postWithAuth,
      body: {
        "fcmToken": fcmToken, // for firebase push notification
        // "playerId": "23465ydrgfsa", // for one signal push notification
        "user_id": _authUser?.id ?? "",
      },
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  void clearData() {
    _authUser = null;
    _cities = [];
    _states = [];
  }
}
