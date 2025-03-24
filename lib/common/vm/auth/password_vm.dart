import 'package:soto_ecommerce/common/common.dart';

class PasswordVM extends BaseVM {
  TextEditingController emailC = TextEditingController();
  TextEditingController otpC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController passwordConfirmC = TextEditingController();
  // PasswordType otpPurpose = PasswordType.accountValidation;

  bool _isValidEmail = false;
  bool get isValidEmail => _isValidEmail;

  void emailIsValid() {
    _isValidEmail = emailC.text.isNotEmpty &&
        emailC.text.contains("@") &&
        emailC.text.contains(".") &&
        emailC.text.split('.').last.isNotEmpty;
    reBuildUI();
  }

  bool get passwordIsValid =>
      passwordC.text.isNotEmpty && passwordC.text == passwordConfirmC.text;

  Future<ApiResponse> changePassword() async {
    return await performApiCall(
      url: "/user/change-password-request",
      method: apiService.post,
      body: {
        "email_or_phone_number": emailC.text.trim(),
      },
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> validateOtp(String otp,
      {PasswordType type = PasswordType.changePassword}) async {
    final data = {
      "otp": otp,
      "otp_purpose": type.name,
    };

    printty('validateOtp body: $data');
    return await performApiCall(
      url: "/user/validate-otp",
      method: apiService.post,
      body: data,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> newPassword({PasswordType? type}) async {
    final payload = {
      "new_password": passwordC.text.trim(),
      "otp": otpC.text.trim(),
      "otp_purpose": PasswordType.changePassword.name,
    };
    printty('newPassword body: $payload');
    return await performApiCall(
      url: "/user/new-password",
      method: apiService.putWithAuth,
      body: payload,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  clearData() {
    emailC.clear();
    otpC.clear();
    passwordC.clear();
    passwordConfirmC.clear();

    _isValidEmail = false;

    reBuildUI();
  }

  @override
  void dispose() {
    printty('Password VM Disposed');

    emailC.dispose();
    otpC.dispose();
    passwordC.dispose();
    passwordConfirmC.dispose();
    super.dispose();
  }
}
