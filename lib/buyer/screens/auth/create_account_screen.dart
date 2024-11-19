import 'package:flutter/gestures.dart';
import 'package:soto_ecommerce/common/common.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController fullnameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  unFocusAll() {
    fullNameFocusNode.unfocus();
    emailFocusNode.unfocus();
    phoneFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  @override
  void dispose() {
    fullnameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    passwordC.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupVM>(
      builder: (context, vm, _) {
        return BusyOverlay(
          show: vm.isBusy,
          child: Scaffold(
            backgroundColor: AppColors.bgFF,
            body: SafeArea(
              bottom: false,
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: Sizer.width(20),
                ),
                child: Center(
                  child: ListView(
                    children: [
                      const YBox(10),
                      imageHelper(
                        AppImages.logo,
                        height: Sizer.height(74),
                      ),
                      const YBox(14),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Create New Account',
                            style: AppTypography.text24.copyWith(
                              color: AppColors.primaryOrange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Kindly enter your correct details',
                            style: AppTypography.text14.copyWith(
                              color: AppColors.text7D,
                            ),
                          ),
                        ],
                      ),
                      const YBox(30),
                      Row(
                        children: [
                          Expanded(
                            child: SocialsCTA(
                              icon: AppSvgs.fb,
                              text: 'Facebook',
                              onTap: () {},
                            ),
                          ),
                          const XBox(25),
                          Expanded(
                            child: SocialsCTA(
                              icon: AppSvgs.google,
                              text: 'Google',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const YBox(16),
                      const OrWidget(),
                      const YBox(16),
                      CustomTextField(
                        focusNode: fullNameFocusNode,
                        controller: fullnameC,
                        labelText: "Full name",
                        showLabelHeader: true,
                        fillColor: AppColors.orangeEA.withOpacity(0.5),
                        hintText: 'First & last name',
                        prefixIcon: Icon(
                          Iconsax.user,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        onChanged: (val) => vm.reBuildUI(),
                        onSubmitted: (p0) => emailFocusNode.requestFocus(),
                      ),
                      const YBox(16),
                      CustomTextField(
                        focusNode: emailFocusNode,
                        controller: emailC,
                        labelText: "Email Address",
                        showLabelHeader: true,
                        fillColor: AppColors.orangeEA.withOpacity(0.5),
                        hintText: 'Enter email Address',
                        errorText: emailC.text.isNotEmpty && !emailIsValid()
                            ? 'Invalid email address'
                            : null,
                        prefixIcon: Icon(
                          Iconsax.sms,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        onChanged: (val) => vm.reBuildUI(),
                        onSubmitted: (p0) => phoneFocusNode.requestFocus(),
                      ),
                      const YBox(16),
                      CustomTextField(
                        focusNode: phoneFocusNode,
                        controller: phoneC,
                        labelText: "Phone",
                        showLabelHeader: true,
                        fillColor: AppColors.orangeEA.withOpacity(0.5),
                        hintText: 'Enter phone number',
                        prefixIcon: Icon(
                          Iconsax.call,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        onChanged: (val) => vm.reBuildUI(),
                        onSubmitted: (p0) => passwordFocusNode.requestFocus(),
                      ),
                      const YBox(16),
                      CustomTextField(
                        focusNode: passwordFocusNode,
                        controller: passwordC,
                        labelText: "Password",
                        showLabelHeader: true,
                        fillColor: AppColors.orangeEA.withOpacity(0.5),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Iconsax.lock_1,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        isPassword: true,
                        onChanged: (val) => vm.reBuildUI(),
                        onSubmitted: (p0) => passwordFocusNode.unfocus(),
                      ),
                      const YBox(30),
                      CustomBtn.solid(
                        online: activateBtn(),
                        onTap: () {
                          _createNewAccount();
                          // Navigator.pushNamed(
                          //     context, RoutePath.shippingAddressScreen);
                        },
                        text: "Create Account",
                      ),
                      const YBox(8),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Already have an account with Soto? Login ",
                                style: AppTypography.text12.copyWith(
                                  color: AppColors.text32,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: "Login",
                                style: AppTypography.text12.copyWith(
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                    // Navigator.pushNamed(
                                    //     context, RoutePath.loginScreen);
                                  },
                              ),
                            ],
                          )),
                      const YBox(60)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _createNewAccount() {
    unFocusAll();
    final vm = context.read<SignupVM>();
    vm
        .signUp(
      fullname: fullnameC.text.trim(),
      email: emailC.text.trim(),
      phone: phoneC.text.trim(),
      password: passwordC.text.trim(),
    )
        .then(
      (value) {
        handleApiResponse(
            response: value,
            onSuccess: () {
              gotoShippingAddress();
            });
      },
    );
  }

  void gotoShippingAddress() {
    Navigator.pushReplacementNamed(
      context,
      RoutePath.shippingAddressScreen,
    );
  }

  bool activateBtn() {
    return emailIsValid() &&
        fullnameC.text.isNotEmpty &&
        phoneC.text.isNotEmpty &&
        passwordC.text.isNotEmpty;
  }

  bool emailIsValid() {
    return emailC.text.contains("@") &&
        emailC.text.contains(".") &&
        emailC.text.split('.').last.isNotEmpty;
  }
}
