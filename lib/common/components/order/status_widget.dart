import 'package:soto_ecommerce/common/common.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.text,
    this.isSelected = false,
    this.textStyle,
    this.onTap,
    this.margin,
  });

  final String text;
  final bool isSelected;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

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
          text,
          style: textStyle ??
              AppTypography.text12.copyWith(
                color: isSelected ? AppColors.white : AppColors.text57,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
