import 'package:soto_ecommerce/buyer/buyer.dart';

class ResetPasswordPageview extends StatelessWidget {
  const ResetPasswordPageview({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.controller,
  });

  final String icon;
  final String title;
  final String subTitle;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageHelper(
            icon,
            height: Sizer.height(140),
          ),
          const YBox(24),
          Text(
            title,
            style: AppTypography.text32.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(8),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTypography.text14.copyWith(
              color: AppColors.text7D,
            ),
          ),
          const YBox(36),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
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
              const YBox(26),
              CustomTextField(
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
              const YBox(30),
              CustomBtn.solid(
                onTap: () {
                  //  Navigator.pushNamed(context, const ConfirmationScreen());
                },
                text: "Continue",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
