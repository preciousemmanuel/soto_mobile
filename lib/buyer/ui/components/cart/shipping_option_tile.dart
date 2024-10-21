import 'package:soto_ecommerce/buyer/buyer.dart';

class ShippingOptionTile extends StatelessWidget {
  const ShippingOptionTile({
    super.key,
    required this.duration,
    required this.price,
    required this.title,
    this.isSelected = false,
    this.bg,
  });

  final String duration;
  final String price;
  final String title;
  final bool isSelected;
  final Color? bg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(12),
        vertical: Sizer.height(14),
      ),
      decoration: BoxDecoration(
        color: bg ?? AppColors.primaryOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Sizer.radius(10)),
      ),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCheckbox(
                onTap: () {},
                isSelected: isSelected,
              ),
              const XBox(10),
              Text(
                title,
                style: AppTypography.text14.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const XBox(20),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(8),
              vertical: Sizer.height(4),
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Sizer.radius(4)),
            ),
            child: Text(
              duration,
              style: AppTypography.text12.copyWith(
                color: AppColors.primaryOrange,
              ),
            ),
          ),
          const Spacer(),
          Text(
            price,
            style: AppTypography.text12.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
