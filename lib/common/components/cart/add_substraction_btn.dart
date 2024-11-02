import 'package:soto_ecommerce/common/common.dart';

class AddSubtractBtn extends StatelessWidget {
  const AddSubtractBtn({
    super.key,
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizer.radius(6)),
            border: Border.all(
              color: AppColors.primaryOrange,
              width: 1.5,
            )),
        child: Icon(
          icon,
          size: Sizer.radius(20),
          color: AppColors.primaryOrange,
        ),
      ),
    );
  }
}
