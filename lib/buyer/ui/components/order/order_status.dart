import 'package:soto_ecommerce/buyer/core/core.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    super.key,
    required this.category,
    this.isSelected = false,
    this.onTap,
    this.margin,
  });

  final String category;
  final bool isSelected;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(16),
          vertical: Sizer.height(6),
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryOrange : AppColors.grayF9,
          borderRadius: BorderRadius.circular(
            Sizer.radius(100),
          ),
        ),
        child: Text(
          category,
          style: AppTypography.text12.copyWith(
            color: isSelected ? AppColors.white : AppColors.text57,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
