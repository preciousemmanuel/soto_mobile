import 'package:soto_ecommerce/common/common.dart';

class OnboardScreenTwo extends StatelessWidget {
  const OnboardScreenTwo({super.key});

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
            image: AssetImage(AppImages.obBg1),
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
                AppImages.ob2,
                height: Sizer.height(360),
              ),
              const YBox(12),
              Text(
                'Buy anything \nfrom the comfort \nof your home',
                style: AppTypography.text36.copyWith(
                  color: AppColors.text40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const YBox(35),
              CustomBtn.solid(
                height: 54,
                width: Sizer.width(165),
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.dashboardNavScreen);
                },
                text: "Get Started",
              ),
              const YBox(70),
            ],
          ),
        ),
      ),
    );
  }
}
