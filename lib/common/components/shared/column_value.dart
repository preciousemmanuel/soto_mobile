import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class ColumnValue extends StatelessWidget {
  const ColumnValue({
    super.key,
    required this.title,
    required this.value,
    this.titleColor,
    this.valueColor,
  });

  final String title;
  final String value;
  final Color? titleColor;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.text14.copyWith(
            color: titleColor ?? AppColors.text060,
            fontWeight: FontWeight.w500,
          ),
        ),
        const YBox(4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            fontSize: Sizer.text(12),
            color: valueColor ?? AppColors.gray8D,
          ),
        ),
      ],
    );
  }
}
