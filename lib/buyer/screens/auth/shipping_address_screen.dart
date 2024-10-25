import 'package:soto_ecommerce/common/common.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        height: Sizer.screenHeight,
        width: Sizer.screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.obBg2),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YBox(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ArrowBackBtn(
                    svgPath: AppSvgs.arrowLeft,
                    color: AppColors.primaryOrange,
                  ),
                ],
              ),
              const Spacer(),
              imageHelper(
                AppImages.ob4,
                height: Sizer.height(373),
              ),
              const YBox(12),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: AppTypography.text20.copyWith(
                      color: AppColors.text40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Enter your shipping address',
                    style: AppTypography.text14.copyWith(
                      color: AppColors.text70,
                    ),
                  ),
                ],
              ),
              const YBox(29),
              CustomTextField(
                fillColor: AppColors.orangeEA.withOpacity(0.5),
                hintText: 'Enter your address',
                onChanged: (val) {},
              ),
              const YBox(35),
              CustomBtn.solid(
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.dashboardNavScreen);
                },
                text: "Continue",
              ),
              const YBox(50),
            ],
          ),
        ),
      ),
    );
  }
}
