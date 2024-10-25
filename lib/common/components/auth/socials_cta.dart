import 'package:soto_ecommerce/common/common.dart';

class SocialsCTA extends StatelessWidget {
  const SocialsCTA({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final String icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(10),
          vertical: Sizer.height(16),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizer.radius(14)),
          color: AppColors.grayF7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgHelper(icon),
            const XBox(6),
            Text(
              text,
              style: AppTypography.text16.copyWith(
                color: AppColors.text70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
