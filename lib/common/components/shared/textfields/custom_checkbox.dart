import 'package:soto_ecommerce/common/common.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    this.onTap,
    this.isSelected = false,
  });

  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? Sizer.width(28) : Sizer.width(26),
        height: isSelected ? Sizer.height(28) : Sizer.height(26),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryOrange
              : AppColors.primaryOrange.withOpacity(0.2),
          borderRadius: BorderRadius.circular(Sizer.radius(8)),
        ),
        child: isSelected ? svgHelper(AppSvgs.check) : const SizedBox(),
      ),
    );
  }
}
