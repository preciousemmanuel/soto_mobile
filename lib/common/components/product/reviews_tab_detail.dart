import 'package:soto_ecommerce/common/common.dart';

class ReviewsTabDetail extends StatelessWidget {
  const ReviewsTabDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: const Column(
        children: [
          ReviewsCard(),
          YBox(16),
          ReviewsCard(),
        ],
      ),
    );
  }
}

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomAvatar(
              height: 46,
              width: 46,
            ),
            const XBox(20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: AppTypography.text16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                const YBox(4),
                Row(
                  children: List.generate(
                    5,
                    (i) => CustomRating(
                      isActive: i < 4,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        const YBox(10),
        Text(
          "I recently purchased the Avery Sofa and Armchair from E&M Furnitures, and I couldn't be happier! The quality of the materials and craftsmanship is top-notch and the delivery team was professional, ensuring everything was perfectly assembled.",
          style: AppTypography.text12.copyWith(
            color: AppColors.text57,
          ),
        ),
      ],
    );
  }
}
