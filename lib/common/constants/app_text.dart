import 'package:soto_ecommerce/common/common.dart';

class AppText {
  static const String errorMsg =
      "An error occurred. Please try again.\nContact support if error persists";

  static const List forgotPasswordCollections = [
    {
      "img": AppImages.mail,
      "title": "Forget Password ",
      "subTitle":
          "Kindly enter your registered email or phone \nnumber to reset your password",
    },
    {
      "img": AppImages.mail,
      "title": "Enter OTP ",
      "subTitle":
          "Enter the OTP code we just sent to \nyou on your registered Email/Phone number",
    },
    {
      "img": AppImages.lock,
      "title": "Reset Password",
      "subTitle": "Well done! Now you can enter a new password to continue",
    },
  ];

  static const List changePasswordCollections = [
    {
      "img": AppImages.mail,
      "title": "Change Password",
      "subTitle":
          "Kindly enter your registered email or phone \nnumber to reset your password",
    },
    {
      "img": AppImages.mail,
      "title": "Enter OTP ",
      "subTitle":
          "Enter the OTP code we just sent to \nyou on your registered Email/Phone number",
    },
    {
      "img": AppImages.lock,
      "title": "New Password",
      "subTitle": "Well done! Now you can enter a new password to continue",
    },
  ];
}
