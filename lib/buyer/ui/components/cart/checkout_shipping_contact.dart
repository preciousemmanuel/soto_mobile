import 'package:soto_ecommerce/buyer/buyer.dart';

class CheckoutShippingContact extends StatelessWidget {
  const CheckoutShippingContact({
    super.key,
    required this.title,
    required this.subText,
    this.subText2,
  });

  final String title;
  final String subText;
  final String? subText2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(16),
        vertical: Sizer.height(10),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      decoration: BoxDecoration(
        color: AppColors.baseF9,
        borderRadius: BorderRadius.circular(Sizer.radius(10)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.text60,
                  ),
                ),
                const YBox(4),
                Text(
                  subText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.text12.copyWith(
                    color: AppColors.text60,
                  ),
                ),
                if (subText2 != null && subText2!.isNotEmpty) const YBox(4),
                if (subText2 != null && subText2!.isNotEmpty)
                  Text(
                    subText2!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.text12.copyWith(
                      color: AppColors.text60,
                    ),
                  ),
              ],
            ),
          ),
          const XBox(40),
          Container(
            padding: EdgeInsets.all(
              Sizer.radius(8),
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.circular(
                Sizer.radius(100),
              ),
            ),
            child: const Icon(
              Icons.edit,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
