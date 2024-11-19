import 'package:soto_ecommerce/common/common.dart';

class ReviewsDescTab extends StatelessWidget {
  const ReviewsDescTab({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(24),
          vertical: Sizer.height(8),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryOrange.withOpacity(0.1)
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(
            Sizer.radius(8),
          ),
        ),
        child: Text(
          text,
          style: AppTypography.text14.copyWith(
              color: isSelected ? AppColors.primaryOrange : AppColors.textAA,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400),
        ),
      ),
    );
  }
}
