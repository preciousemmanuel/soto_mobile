import 'package:soto_ecommerce/common/common.dart';

class ProductReviewStat extends StatelessWidget {
  const ProductReviewStat({
    super.key,
    this.rating,
    required this.reviewCount,
  });

  final int? rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(16),
        vertical: Sizer.height(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.grayF1,
        borderRadius: BorderRadius.circular(Sizer.radius(8)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (i) => CustomRating(
                        isActive: i < (rating ?? 0).toInt(),
                      ),
                    ),
                    const XBox(8),
                    Text(
                      (rating ?? 0).toString(),
                      style: AppTypography.text12.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const YBox(4),
                Row(
                  children: [
                    Text(
                      '$reviewCount Reviews',
                      style: AppTypography.text12.copyWith(
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
                  (rating ?? 0).toInt(),
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
    );
  }
}
