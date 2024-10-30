import 'package:soto_ecommerce/common/common.dart';

class SignupVM extends BaseVM {
  UserType userType = UserType.user;
  String signupChannel = SignupChannel.normal.name;
  bool setLowStockAlert = false;

  Future<ApiResponse> signUp({
    required String fullname,
    required String email,
    required String phone,
    required String password,
  }) async {
    var body = {
      "FullName": fullname,
      "Email": email,
      "PhoneNumber": phone,
      "Password": password,
      "SignupChannel": signupChannel,
      "UserType": userType.name,
    };

    printty(body, logName: "Sign call");
    return await performApiCall(
      url: "/user/signup",
      method: apiService.post,
      body: body,
      onSuccess: (data) {
        String token = data["data"]["Token"];
        StorageService.storeAccessToken(token);
        return ApiResponse(
          success: true,
          data: apiResponse.data,
          message: apiResponse.message,
        );
      },
    );
  }

  Future<ApiResponse> updateShippingAddress({
    required String address,
  }) async {
    var body = {
      "address": address,
    };

    printty(body, logName: "updateShippingAddress call");
    return await performApiCall(
      url: "/user/add-shipping-address",
      method: apiService.putWithAuth,
      body: body,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  void resetData() {
    setLowStockAlert = false;
  }
}
