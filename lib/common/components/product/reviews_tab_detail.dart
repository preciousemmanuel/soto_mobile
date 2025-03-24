import 'package:soto_ecommerce/common/common.dart';

class ReviewsTabDetail extends StatelessWidget {
  const ReviewsTabDetail({
    super.key,
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: reviews.isEmpty
          ? const EmptyListState(height: 100, text: 'No reviews yet')
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (_, i) {
                return ReviewsCard(
                  name:
                      '${reviews[i].user?.firstName ?? ''} ${reviews[i].user?.lastName ?? ''}',
                  desc: reviews[i].comment ?? '',
                  ratingCount: reviews[i].rating ?? 0,
                );
              },
              separatorBuilder: (_, __) => const YBox(16),
              itemCount: reviews.length,
            ),
    );
  }
}

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({
    super.key,
    required this.name,
    required this.desc,
    required this.ratingCount,
  });

  final String name;
  final String desc;
  final int ratingCount;

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
                  name,
                  style: AppTypography.text16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                const YBox(4),
                Row(
                  children: List.generate(
                    ratingCount,
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
          desc,
          style: AppTypography.text12.copyWith(
            color: AppColors.text57,
          ),
        ),
      ],
    );
  }
}
