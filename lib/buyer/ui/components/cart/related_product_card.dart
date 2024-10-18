import 'package:soto_ecommerce/buyer/buyer.dart';

class RelatedProductCard extends StatelessWidget {
  const RelatedProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(8),
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizer.radius(8)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizer.radius(8)),
            child: imageHelper(
              AppImages.product2,
            ),
          ),
          const YBox(8),
          Text(
            'Deck Chair Twill',
            style: AppTypography.text12.copyWith(
              color: AppColors.textAA,
            ),
          ),
          const YBox(4),
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: 'N670,000',
                style: AppTypography.text12.copyWith(
                    color: AppColors.textAA,
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.lineThrough),
              ),
              TextSpan(
                text: ' N480,000',
                style: AppTypography.text14.copyWith(
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
