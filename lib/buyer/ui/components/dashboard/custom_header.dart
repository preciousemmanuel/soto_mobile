import 'package:soto_ecommerce/buyer/core/core.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    this.backBtn,
  });

  final String title;
  final VoidCallback? backBtn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const BackIcon(icon: AppSvgs.arrowLeft),
        InkWell(
          onTap: backBtn ?? () => RouterNav.pop(context),
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
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(),
      ],
    );
  }
}
