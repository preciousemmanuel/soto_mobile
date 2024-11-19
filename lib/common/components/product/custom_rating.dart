import 'package:soto_ecommerce/common/common.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: Sizer.width(4),
      ),
      child: svgHelper(
        isActive ? AppSvgs.starActive : AppSvgs.starInactive,
        height: Sizer.height(16),
      ),
    );
  }
}
