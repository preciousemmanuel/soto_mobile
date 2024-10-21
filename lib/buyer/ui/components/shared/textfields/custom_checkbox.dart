import 'package:soto_ecommerce/buyer/core/core.dart';

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
        width: isSelected ? Sizer.width(24) : Sizer.width(16),
        height: isSelected ? Sizer.height(24) : Sizer.height(16),
        decoration: BoxDecoration(
          // color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizer.radius(20)),
          border: isSelected
              ? null
              : Border.all(
                  color:
                      isSelected ? AppColors.primaryOrange : AppColors.grayCC,
                ),
        ),
        child: isSelected ? svgHelper(AppSvgs.check) : const SizedBox(),
      ),
    );
  }
}
