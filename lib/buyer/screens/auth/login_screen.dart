import 'package:flutter/gestures.dart';
import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class LoginScreenArgs {
  final bool isVendor;
  LoginScreenArgs({
    this.isVendor = false,
  });
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.args,
  });

  final LoginScreenArgs? args;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    final vm = context.read<LoginVM>();
    vm.init(
      userType: widget.args?.isVendor == true ? UserType.vendor : UserType.user,
    );
  }

  unFocusAll() {
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVM>(builder: (context, vm, _) {
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
                          'Login',
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
                    const YBox(60),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: SocialsCTA(
                    //         icon: AppSvgs.fb,
                    //         text: 'Facebook',
                    //         onTap: () {
                    //           // Navigator.pushNamed(
                    //           //     context, RoutePath.approvalScreen);
                    //         },
                    //       ),
                    //     ),
                    //     const XBox(25),
                    //     Expanded(
                    //       child: SocialsCTA(
                    //         icon: AppSvgs.google,
                    //         text: 'Google',
                    //         onTap: () {},
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const YBox(16),
                    // const OrWidget(),
                    // const YBox(16),
                    CustomTextField(
                      focusNode: emailFocus,
                      labelText: "Name/Email",
                      showLabelHeader: true,
                      fillColor: AppColors.orangeEA.withOpacity(0.5),
                      hintText: 'Enter name or email',
                      controller: vm.emailC,
                      prefixIcon: Icon(
                        Iconsax.sms,
                        color: AppColors.iconC4,
                        size: Sizer.height(20),
                      ),
                      onChanged: (val) => vm.reBuildUI(),
                    ),
                    const YBox(16),
                    CustomTextField(
                      focusNode: passwordFocus,
                      labelText: "Password",
                      showLabelHeader: true,
                      fillColor: AppColors.orangeEA.withOpacity(0.5),
                      hintText: 'Password',
                      controller: vm.passwordC,
                      prefixIcon: Icon(
                        Iconsax.lock_1,
                        color: AppColors.iconC4,
                        size: Sizer.height(20),
                      ),
                      isPassword: true,
                      onChanged: (val) => vm.reBuildUI(),
                      onSubmitted: (p0) {},
                    ),
                    const YBox(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutePath.changeOrForgotPasswordScreen,
                            arguments: const PasswordScreenArgs(
                              type: PasswordType.forgotPassword,
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppTypography.text14.copyWith(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const YBox(30),
                    CustomBtn.solid(
                      online: vm.btnIsValid,
                      onTap: () {
                        login();
                      },
                      text: "Login",
                    ),
                    const YBox(8),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "New to Soto? ",
                              style: AppTypography.text14.copyWith(
                                color: AppColors.text32,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            widget.args?.isVendor == true
                                ? TextSpan(
                                    text: "Register New account",
                                    style: AppTypography.text14.copyWith(
                                      color: AppColors.primaryOrange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context,
                                            RoutePath
                                                .createBusinessAccountScreen);
                                      },
                                  )
                                : TextSpan(
                                    text: "Create an Account",
                                    style: AppTypography.text14.copyWith(
                                      color: AppColors.primaryOrange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context,
                                            RoutePath.createAccountScreen);
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
    });
  }

  void login() {
    unFocusAll();
    final vm = context.read<LoginVM>();
    vm.login().then((value) {
      handleApiResponse(
          response: value,
          onSuccess: () {
            vm.clearData();
            printty("IsVerified: ${value.data["data"]["IsVerified"]}");
            gotoApprovalOrDashboard(value.data["data"]["IsVerified"]);
          });
    });
  }

  void gotoApprovalOrDashboard([bool isVendorVerified = false]) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      widget.args?.isVendor == true
          ? isVendorVerified
              ? RoutePath.sellerDashboardNavScreen
              : RoutePath.approvalScreen
          : RoutePath.dashboardNavScreen,
      (route) => false,
    );
  }
}
