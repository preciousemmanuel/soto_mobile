import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soto_ecommerce/core/core.dart';

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
        duration: const Duration(milliseconds: 500),
        width: isSelected ? 20.w : 18.w,
        height: isSelected ? 20.h : 18.h,
        // padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: isSelected
                ? null
                : Border.all(
                    color: AppColors.baseGray,
                    width: 2,
                  ),
            borderRadius: BorderRadius.circular(2.r)),
        child: Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryOrange : Colors.transparent,
              borderRadius: BorderRadius.circular(2.r)),
          child: const Icon(Icons.check, size: 20, color: AppColors.white),
        ),
      ),
    );
  }
}
