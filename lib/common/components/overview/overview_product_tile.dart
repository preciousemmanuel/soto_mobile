import 'package:soto_ecommerce/common/common.dart';

class OverviewProductTile extends StatelessWidget {
  const OverviewProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: Sizer.height(4),
          ),
          height: Sizer.height(60),
          width: Sizer.width(60),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizer.radius(8)),
            child: imageHelper(AppImages.product2),
          ),
        ),
        const XBox(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ladies Hand Bag',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.text12.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(4),
              Text(
                'N10,000',
                style: AppTypography.text12.copyWith(
                  color: AppColors.black66,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(10),
            vertical: Sizer.height(4),
          ),
          decoration: BoxDecoration(
            color: AppColors.orangeE3,
            borderRadius: BorderRadius.circular(Sizer.radius(4)),
          ),
          child: Text(
            'Qty: 34',
            style: AppTypography.text12.copyWith(
              color: AppColors.primaryOrange,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
