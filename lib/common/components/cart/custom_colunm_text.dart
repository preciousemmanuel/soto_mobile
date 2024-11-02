import 'package:soto_ecommerce/common/common.dart';

class CustomColumnText extends StatelessWidget {
  const CustomColumnText({
    super.key,
    required this.upperText,
    required this.lowerText,
  });

  final String upperText;
  final String lowerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          upperText,
          style: AppTypography.text12.copyWith(
            color: AppColors.textE70,
            fontWeight: FontWeight.w500,
          ),
        ),
        const YBox(4),
        Text(
          lowerText,
          style: AppTypography.text14.copyWith(
            color: AppColors.text28,
          ),
        ),
      ],
    );
  }
}
