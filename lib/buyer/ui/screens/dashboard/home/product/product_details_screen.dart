import 'package:soto_ecommerce/buyer/buyer.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Sizer.screenHeight,
                      width: Sizer.screenWidth,
                    ),
                    imageHelper(
                      AppImages.product,
                      height: Sizer.height(340),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: Sizer.height(60),
                      left: Sizer.width(20),
                      child: const ArrowBackBtn(
                        svgPath: AppSvgs.arrowLeft,
                        color: AppColors.primaryOrange,
                      ),
                    ),
                    Positioned.fill(
                      top: Sizer.height(310),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizer.width(20),
                          vertical: Sizer.height(28),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.bgWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizer.width(24)),
                            topRight: Radius.circular(Sizer.width(24)),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Wooden chair',
                                        style: AppTypography.text16.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.text3E,
                                        ),
                                      ),
                                      const YBox(4),
                                      Text(
                                        'N4,000',
                                        style: AppTypography.text24.copyWith(
                                          color: AppColors.primaryOrange,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    AddSubtractBtn(
                                      icon: Iconsax.minus,
                                      onTap: () {},
                                    ),
                                    const XBox(16),
                                    Text(
                                      '1',
                                      style: AppTypography.text12,
                                    ),
                                    const XBox(16),
                                    AddSubtractBtn(
                                      icon: Iconsax.add,
                                      onTap: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const YBox(20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizer.width(16),
                                vertical: Sizer.height(16),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.grayF1,
                                borderRadius:
                                    BorderRadius.circular(Sizer.radius(8)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ...List.generate(
                                              5,
                                              (i) => CustomRating(
                                                isActive: i < 4,
                                              ),
                                            ),
                                            const XBox(8),
                                            Text(
                                              '4.8',
                                              style:
                                                  AppTypography.text12.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const YBox(4),
                                        Row(
                                          children: [
                                            Text(
                                              '53 Reviews',
                                              style:
                                                  AppTypography.text12.copyWith(
                                                color: AppColors.textAA,
                                              ),
                                            ),
                                            const XBox(4),
                                            Icon(
                                              Icons.chevron_right,
                                              color: AppColors.textAA,
                                              size: Sizer.height(16),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Sizer.height(30),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        const CustomAvatar(),
                                        ...List.generate(
                                          4,
                                          (index) => Positioned(
                                            left: -15 * (index + 1),
                                            child: const CustomAvatar(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const YBox(26),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'You may the like ',
                                style: AppTypography.text16.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const YBox(20),
                            Container(
                              // color: Colors.blue,
                              child: GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                crossAxisSpacing: Sizer.width(20),
                                mainAxisSpacing: Sizer.width(20),
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                childAspectRatio: 0.74,
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    const RelatedProductCard(),
                                ],
                              ),
                            ),
                            const YBox(100),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.white,
      radius: Sizer.height(15),
      child: imageHelper(
        AppImages.avatar,
      ),
    );
  }
}

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: Sizer.width(4),
      ),
      child: svgHelper(
        isActive ? AppSvgs.starActive : AppSvgs.starInactive,
        height: Sizer.height(16),
      ),
    );
  }
}
