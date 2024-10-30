import 'package:soto_ecommerce/common/common.dart';

class LoginVM extends BaseVM {
  late UserType userType;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  bool get btnIsValid {
    return emailC.text.trim().isNotEmpty && passwordC.text.trim().length > 7;
  }

  init({required UserType userType}) {
    this.userType = userType;
  }

  Future<ApiResponse> login() async {
    printty("Login got called");
    return await performApiCall(
      url: "//user/login",
      method: apiService.post,
      body: {
        "email_or_phone_number": emailC.text.trim(),
        "password": passwordC.text.trim(),
        "userType": userType.name
      },
      onSuccess: (data) {
        String token = data["data"]["Token"];
        StorageService.storeAccessToken(token);
        return ApiResponse(success: true, data: apiResponse.data);
      },
    );
  }

  // Future<ApiResponse> logout() async {
  //   try {
  //     setBusy(true);
  //     await Future.delayed(const Duration(seconds: 1));
  //     final AuthUser? user = await StorageService.getUser();
  //     Navigator.pushNamedAndRemoveUntil(
  //       NavigatorKeys.appNavigatorKey.currentContext!,
  //       RoutePath.loginScreen,
  //       (r) => false,
  //     );
  //     setBusy(false);
  //     String url = "/auth/logout";
  //     apiResponse = await apiService.postWithAuth(body: null, url: url);

  //     await StorageService.logout();
  //     await StorageService.storeStringItem(StorageKey.email, user?.email ?? "");

  //     apiService = DioApiService(appInterceptors: AppInterceptors());
  //     printty(apiResponse, logLevel: "Logout Response");
  //     return apiResponse;
  //   } catch (e) {
  //     printty(e.toString(), logLevel: "Logout Error");
  //     setBusy(false);
  //     return ApiResponse(success: false, message: e.toString());
  //     //return errorResponse;
  //   }
  // }

  clearData() {
    emailC.clear();
    passwordC.clear();

    reBuildUI();
  }

  @override
  void dispose() {
    printty('Login VM Disposed');
    emailC.dispose();
    passwordC.dispose();

    super.dispose();
  }
}
