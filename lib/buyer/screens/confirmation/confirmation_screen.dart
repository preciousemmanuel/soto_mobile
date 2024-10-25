import 'package:soto_ecommerce/common/common.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFF,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageHelper(
              AppImages.success,
              height: Sizer.height(120),
            ),
            const YBox(24),
            Text(
              'Password Reset \nSuccessfully',
              textAlign: TextAlign.center,
              style: AppTypography.text24.copyWith(
                color: AppColors.green58,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            )
          ],
        ),
      )),
    );
  }
}
