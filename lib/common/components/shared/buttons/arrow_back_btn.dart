import 'package:soto_ecommerce/common/common.dart';

class ArrowBackBtn extends StatelessWidget {
  const ArrowBackBtn({
    super.key,
    this.svgPath,
    this.color,
    this.onTap,
  });

  final String? svgPath;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(10),
          vertical: Sizer.height(12),
        ),
        decoration: BoxDecoration(
          color: AppColors.bgWhite,
          borderRadius: BorderRadius.circular(Sizer.radius(40)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: svgHelper(svgPath ?? AppSvgs.arrowRight, color: color),
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
    this.icon,
    this.onTap,
  });

  final dynamic icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: Container(
        padding: EdgeInsets.all(Sizer.width(10)),
        alignment: Alignment.centerLeft,
        child: icon is String
            ? svgHelper(icon)
            : const Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
      ),
    );
  }
}
