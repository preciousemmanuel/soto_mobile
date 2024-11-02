import 'package:soto_ecommerce/common/common.dart';

class CustomPaymentListTile extends StatelessWidget {
  const CustomPaymentListTile({
    super.key,
    required this.leftText,
    required this.rightText,
    this.leftStyle,
    this.rightStyle,
  });

  final String leftText;
  final String rightText;
  final TextStyle? leftStyle;
  final TextStyle? rightStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.height(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: leftStyle ??
                AppTypography.text16.copyWith(
                  color: AppColors.text28,
                ),
          ),
          Text(
            rightText,
            style: rightStyle ??
                AppTypography.text16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.text28,
                ),
          ),
        ],
      ),
    );
  }
}
