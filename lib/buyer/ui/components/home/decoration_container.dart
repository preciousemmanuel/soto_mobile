import 'package:soto_ecommerce/buyer/core/core.dart';

class DecorationContainer extends StatelessWidget {
  const DecorationContainer({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.onTap,
  });

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: Sizer.width(10),
              vertical: Sizer.height(13),
            ),
        decoration: BoxDecoration(
          color: color ?? AppColors.orangeEF.withOpacity(0.5),
          borderRadius: BorderRadiusDirectional.circular(
            Sizer.radius(14),
          ),
        ),
        child: child,
      ),
    );
  }
}
