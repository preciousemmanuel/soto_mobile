import 'package:soto_ecommerce/common/common.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizer.height(height ?? 30),
      width: Sizer.width(width ?? 30),
      padding: EdgeInsets.all(Sizer.radius(2)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Sizer.radius(100)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizer.radius(100)),
        child: imageHelper(
          AppImages.avatar,
        ),
      ),
    );
  }
}
