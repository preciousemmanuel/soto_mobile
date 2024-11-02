import 'package:soto_ecommerce/common/common.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.white,
      radius: Sizer.height(15),
      child: imageHelper(
        AppImages.avatar,
      ),
    );
  }
}
