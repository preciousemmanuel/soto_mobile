import 'package:soto_ecommerce/buyer/core/core.dart';

class SwipeIndicator extends StatelessWidget {
  final bool isActive;
  final Color activeColor;

  const SwipeIndicator({
    super.key,
    required this.isActive,
    this.activeColor = AppColors.primaryOrange,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 4.h,
      width: 34.w,
      decoration: BoxDecoration(
        color:
            isActive ? activeColor : AppColors.primaryOrange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(Sizer.radius(6)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
