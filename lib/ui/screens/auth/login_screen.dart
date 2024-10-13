import 'package:flutter/gestures.dart';
import 'package:soto_ecommerce/lib.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  labelText: "Name/Email",
                  showLabelHeader: true,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Enter name or email',
                  prefixIcon: Icon(
                    Iconsax.sms,
                    color: AppColors.iconC4,
                    size: Sizer.height(20),
                  ),
                  onChanged: (val) {},
                ),
                const YBox(16),
                CustomTextField(
                  labelText: "Password",
                  showLabelHeader: true,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Iconsax.lock_1,
                    color: AppColors.iconC4,
                    size: Sizer.height(20),
                  ),
                  // controller: vm.passwordC,
                  isPassword: true,
                  onChanged: (val) {},
                  onSubmitted: (p0) {},
                ),
                const YBox(10),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      RouterNav.push(context, const ForgotPasswordScreen());
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
                  onTap: () {
                    RouterNav.push(context, const CreateAccountScreen());
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
                        TextSpan(
                          text: "Create an Account",
                          style: AppTypography.text14.copyWith(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              RouterNav.push(
                                  context, const CreateAccountScreen());
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
    );
  }
}
