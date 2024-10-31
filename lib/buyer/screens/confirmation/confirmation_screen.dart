import 'package:soto_ecommerce/common/common.dart';

class ConfirmationScreenArgs {
  ConfirmationScreenArgs({
    required this.msg,
    this.btnText,
    this.onTap,
  });

  final String msg;
  final String? btnText;
  final VoidCallback? onTap;
}

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({
    super.key,
    required this.args,
  });

  final ConfirmationScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFF,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            imageHelper(
              AppImages.success,
              height: Sizer.height(120),
            ),
            const YBox(24),
            Text(
              args.msg,
              textAlign: TextAlign.center,
              style: AppTypography.text24.copyWith(
                color: AppColors.green58,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            const YBox(200),
            CustomBtn.solid(
              onTap: args.onTap ??
                  () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutePath.dashboardNavScreen,
                      (route) => false,
                    );
                  },
              text: args.btnText ?? "Continue",
            ),
            const YBox(40),
          ],
        ),
      )),
    );
  }
}
