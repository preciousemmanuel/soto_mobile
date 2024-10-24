import 'package:soto_ecommerce/buyer/core/core.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    this.color,
    this.titleWeight,
    this.backBtn,
  });

  final String title;
  final Color? color;
  final VoidCallback? backBtn;
  final FontWeight? titleWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const BackIcon(icon: AppSvgs.arrowLeft),
        InkWell(
          onTap: backBtn ?? () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: svgHelper(
              AppSvgs.arrowLeft,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            right: Sizer.width(20),
          ),
          child: Text(
            title,
            style: AppTypography.text24.copyWith(
              fontWeight: titleWeight ?? FontWeight.w600,
              color: color ?? AppColors.text12,
            ),
          ),
        ),
        Container(),
      ],
    );
  }
}
