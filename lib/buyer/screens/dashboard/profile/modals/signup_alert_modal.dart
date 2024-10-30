import 'package:soto_ecommerce/common/common.dart';

class SignupAlertModal extends StatelessWidget {
  const SignupAlertModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Sizer.height(53),
              decoration: BoxDecoration(
                color: AppColors.whiteF7,
                borderRadius: BorderRadius.circular(Sizer.radius(18)),
              ),
              child: Center(
                child: Text(
                  'Alert',
                  textAlign: TextAlign.center,
                  style: AppTypography.text18.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const YBox(20),
            Text(
              'Sign up to add your shipping \naddress and contact',
              textAlign: TextAlign.center,
              style: AppTypography.text14.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const YBox(20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(40),
              ),
              child: CustomBtn.solid(
                height: 50,
                onlineColor: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RoutePath.loginScreen);
                },
                textStyle: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.white),
                text: 'Sign up',
              ),
            ),
            const YBox(20),
          ],
        ),
      ),
    );
  }
}
