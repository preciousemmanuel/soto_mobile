import 'dart:convert';
import 'dart:io';

import 'package:soto_ecommerce/common/common.dart';

class AuthUserVM extends BaseVM {
  final ImageHelperPicker _imagePicker = ImageHelperPicker();
  AuthUserVM() {
    getUserFromStorage();
  }
  static const String dashboardLoading = "dashboardLoading";
  static const String updatingShipment = "updatingShipment";
  static const String pickImageState = "pickImageState";

  AuthUser? _authUser;
  AuthUser? get authUser => _authUser;
  Wallet? get wallet => _authUser?.wallet;
  Cart? get cart => _authUser?.cart;
  Business? get business => _authUser?.business;
  List<CityModel> _cities = [];
  List<CityModel> get cities => _cities;
  List<StateModel> _states = [];
  List<StateModel> get states => _states;

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  bool get isVendor =>
      _authUser?.userType?.toUpperCase() == UserType.vendor.name.toUpperCase();
  String get shippingADD =>
      '${authUser?.shippingAddress?.fullAddress}, ${authUser?.shippingAddress?.country}';
  String get fullname => _authUser?.userType == UserType.vendor.name
      ? (_authUser?.business?.businessName ?? '').capitalize()
      : '${(authUser?.firstName ?? '').capitalizeFirstLetter()} ${(authUser?.lastName ?? '').capitalizeFirstLetter()}';

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

  Future<ApiResponse> updateUserProfile({
    String? fullName,
    // String? lastName,
    String? phone,
  }) async {
    return await performApiCall(
      url: "/user/update-profile",
      method: apiService.putWithAuth,
      busyObjectName: updatingShipment,
      isFormData: true,
      body: {
        // "FirstName": firstName,
        // "LastName": lastName,
        "FullName": fullName,
        "PhoneNumber": phone,
      },
      onSuccess: (data) {
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

  Future<ApiResponse> pickImage() async {
    try {
      setBusyForObject(pickImageState, true);
      final images = await _imagePicker.pickImage();

      if (images.isNotEmpty) {
        //  check for sizes
        bool sizeExceeded = false;
        for (final image in images) {
          final file = File(image.path);
          int fileSizeInBytes = file.lengthSync();
          double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
          if (fileSizeInMB > 4.0) {
            sizeExceeded = true;
            break;
          }
        }

        if (sizeExceeded) {
          setBusyForObject(pickImageState, false);
          return ApiResponse(
              success: false,
              message: "One or more images exceed the size limit of 4MB");
        }

        for (final image in images) {
          final file = File(image.path);
          _selectedImage = file;
        }

        setBusyForObject(pickImageState, false);
        return ApiResponse(success: true);
      }

      setBusyForObject(pickImageState, false);
      return ApiResponse(success: false, message: "No image selected");
    } catch (e) {
      setBusyForObject(pickImageState, false);
      printty("Error while getting image $e");
      return ApiResponse(success: false, message: e.toString());
    }
  }

  void clearData() {
    printty('AuthUserVM clearData');
    _selectedImage = null;
    _authUser = null;
    _cities = [];
    _states = [];
  }
}
