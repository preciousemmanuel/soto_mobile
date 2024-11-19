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

  static const List faqs = [
    {
      "title": "What is Soto?",
      "subTitle":
          "Soto is a secure eCommerce platform that caters to customers, vendors, and administrators.",
    },
    {
      "title": "Do I have to sign up?",
      "subTitle":
          "Soto offers you the opportunity to explore the amazing features on the platform before your decision to sign up.",
    },
    {
      "title": "How do I make payment?",
      "subTitle":
          "There are three seamless payment gateways on Soto which you can make a choice from depending on your preference",
    },
    {
      "title": "Can I cancel my order?",
      "subTitle":
          "Yes, you can cancel your order, however, there are easy steps to follow for a successful cancelation.",
    },
    {
      "title": "Can customer become a vendor?",
      "subTitle":
          "Yes, customers can easily switch from their profile to become vendors with their business information.",
    },
  ];
}
