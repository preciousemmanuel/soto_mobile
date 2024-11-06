import 'package:soto_ecommerce/buyer/screens/auth/login_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFF,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        child: Column(
          children: [
            const YBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackIcon(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      NavKey.appNavigatorKey.currentContext!,
                      RoutePath.loginScreen,
                      arguments: LoginScreenArgs(isVendor: true),
                      (r) => false,
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: Sizer.width(20),
                  ),
                  child: Text(
                    'Awaiting Admin Approval!!',
                    style: AppTypography.text16.copyWith(
                      color: AppColors.text20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(),
              ],
            ),
            const YBox(70),
            imageHelper(
              AppImages.approval,
              height: Sizer.height(315),
            ),
            const YBox(6),
            Text(
              'Your registration will be approved \nby the admin within a short time',
              textAlign: TextAlign.center,
              style: AppTypography.text16.copyWith(
                color: AppColors.black33,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
