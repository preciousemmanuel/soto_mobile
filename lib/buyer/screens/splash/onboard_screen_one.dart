import 'package:soto_ecommerce/common/common.dart';

class OnboardScreenOne extends StatelessWidget {
  const OnboardScreenOne({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ArrowBackBtn(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePath.onboardScreenTwo);
                    },
                  ),
                ],
              ),
              const Spacer(),
              imageHelper(
                AppImages.ob1,
                height: Sizer.height(360),
              ),
              const YBox(12),
              Text(
                'Get Everything \nYou Need in \nOne Place',
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
                  Navigator.pushNamed(context, RoutePath.onboardScreenThree);
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
