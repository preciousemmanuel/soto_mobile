import 'package:soto_ecommerce/buyer/screens/auth/login_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

class OnboardScreenThree extends StatefulWidget {
  const OnboardScreenThree({super.key});

  @override
  State<OnboardScreenThree> createState() => _OnboardScreenThreeState();
}

class _OnboardScreenThreeState extends State<OnboardScreenThree> {
  UserType userType = UserType.user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          child: Column(
            children: [
              const YBox(20),
              Container(
                alignment: Alignment.center,
                child: imageHelper(
                  AppImages.ob3,
                  height: Sizer.height(250),
                ),
              ),
              const YBox(10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'I am a...',
                  style: AppTypography.text26
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const YBox(14),
              Row(
                children: [
                  Expanded(
                    child: UserState(
                      title: 'Customer',
                      subtitle:
                          'You can explore Soto and do a lot more without signing up except ordering.',
                      onTap: () {
                        userType = UserType.user;
                        setState(() {});
                      },
                    ),
                  ),
                  const XBox(26),
                  Expanded(
                    child: UserState(
                      title: 'Vendor',
                      subtitle:
                          'Kindly create an account to enable product upload and other key features.',
                      onTap: () {
                        userType = UserType.vendor;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomBtn.solid(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  if (userType == UserType.user) {
                    Navigator.pushReplacementNamed(
                        context, RoutePath.dashboardNavScreen);
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutePath.loginScreen,
                      arguments: LoginScreenArgs(isVendor: true),
                    );
                  }
                },
                text: "Continue",
              ),
              const YBox(60)
            ],
          ),
        ),
      ),
    );
  }
}

class UserState extends StatelessWidget {
  const UserState({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Sizer.height(12),
          horizontal: Sizer.width(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryOrange.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: AppTypography.text14.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text32,
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTypography.text12.copyWith(
                color: AppColors.text32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
