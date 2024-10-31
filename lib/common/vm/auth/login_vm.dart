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
    final body = {
      "email_or_phone_number": emailC.text.trim(),
      "password": passwordC.text.trim(),
      "userType": userType.name
    };
    printty("Login got called with body: $body");
    return await performApiCall(
      url: "//user/login",
      method: apiService.post,
      body: body,
      onSuccess: (data) {
        String token = data["data"]["Token"];
        StorageService.storeAccessToken(token);
        return ApiResponse(success: true, data: apiResponse.data);
      },
    );
  }

  Future<ApiResponse> logout() async {
    try {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 1));
      final AuthUser? user = await StorageService.getUser();
      Navigator.pushNamedAndRemoveUntil(
        NavKey.appNavigatorKey.currentContext!,
        RoutePath.loginScreen,
        (r) => false,
      );
      setBusy(false);

      await StorageService.logout();
      await StorageService.storeStringItem(StorageKey.email, user?.email ?? "");

      return ApiResponse(success: true);
    } catch (e) {
      printty(e.toString(), logName: "Logout Error");
      setBusy(false);
      return ApiResponse(success: false, message: e.toString());
    }
  }

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
