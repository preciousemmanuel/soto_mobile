import 'package:pinput/pinput.dart';
import 'package:soto_ecommerce/buyer/buyer.dart';

class PinInputTheme {
  static defaultPinTheme({double? borderRadius, Color? bgColor}) {
    return PinTheme(
      width: 56.w,
      height: 70.w,
      margin: EdgeInsets.only(right: 8.w),
      textStyle: TextStyle(
          fontSize: 20.sp,
          color: AppColors.text12,
          fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.grayF7,
        border: Border.all(
          color: AppColors.grayF5,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      ),
    );
  }

  static errorPinTheme() {
    return defaultPinTheme().copyDecorationWith(
      border: Border.all(width: 1, color: AppColors.red),
    );
  }

  static followPinTheme({double? borderRadius}) {
    return defaultPinTheme().copyDecorationWith(
      border: Border.all(width: Sizer.width(1), color: AppColors.grayF5),
      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      color: AppColors.grayF7,
    );
  }

  static focusFillPinTheme() {
    return defaultPinTheme().copyDecorationWith(
        border: Border.all(width: 0, color: AppColors.gray500),
        color: AppColors.primaryOrange.withOpacity(0.1));
  }

  static changePinTheme() {
    return defaultPinTheme().copyDecorationWith(
      border: Border.all(width: 0, color: AppColors.primaryOrange),
      color: AppColors.primaryOrange,
    );
  }
}
