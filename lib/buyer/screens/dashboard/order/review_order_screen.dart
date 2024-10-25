import 'package:soto_ecommerce/common/common.dart';

class ReviewOrderScreen extends StatefulWidget {
  const ReviewOrderScreen({super.key});

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          child: Column(
            children: [
              const YBox(20),
              const CustomHeader(
                title: 'Review Order',
              ),
              const YBox(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Added',
                    style: AppTypography.text14.copyWith(
                      color: AppColors.gray8D,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(10),
                      vertical: Sizer.height(4),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.iconC4.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Sizer.radius(8)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.tick_square,
                          size: Sizer.radius(18),
                          color: AppColors.text20,
                        ),
                        const XBox(4),
                        Text(
                          'Select All',
                          style: AppTypography.text10.copyWith(
                            color: AppColors.text20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomBtn.solid(
                height: Sizer.height(50),
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.addOrderScreen);
                },
                text: "Submit",
              ),
              const YBox(50),
            ],
          ),
        ),
      ),
    );
  }
}
