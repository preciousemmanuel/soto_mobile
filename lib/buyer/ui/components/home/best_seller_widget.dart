import 'package:soto_ecommerce/buyer/core/core.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Best Sellers',
                style: AppTypography.text20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'We appreciate commitment',
                style: AppTypography.text12.copyWith(
                  color: AppColors.textAA,
                ),
              ),
            ],
          ),
        ),
        const YBox(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
            3,
            (i) => BestSellerSliderCard(
              margin: EdgeInsets.only(
                  left: Sizer.width(20), right: i == 2 ? Sizer.width(30) : 0),
              onTap: () {},
            ),
          )),
        )
      ],
    );
  }
}

class BestSellerSliderCard extends StatelessWidget {
  const BestSellerSliderCard({
    super.key,
    this.margin,
    this.onTap,
  });

  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        child: Stack(
          children: [
            Container(
              height: Sizer.height(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizer.radius(8)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizer.radius(8)),
                child: imageHelper(
                  AppImages.bestSeller,
                ),
              ),
            ),
            Positioned(
              top: 14,
              left: 14,
              child: Text(
                'Lighting',
                style: AppTypography.text14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
