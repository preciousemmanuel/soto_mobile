import 'package:another_flushbar/flushbar.dart';
import 'package:soto_ecommerce/common/common.dart';

class FlushBarToast {
  static fLSnackBar({
    required String message,
    Color? textColor,
    int? duration,
    FlushbarPosition? position,
    SnackBarType snackBarType = SnackBarType.warning,
  }) {
    return Flushbar<dynamic>(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(10),
        vertical: Sizer.width(10),
      ),
      messageText: Row(
        children: [
          Icon(
            snackBarType.icon,
            size: 30,
            color: snackBarType.iconColor,
          ),
          const XBox(10),
          Expanded(
            child: Text(
              message,
              // overflow: TextOverflow.ellipsis,
              // maxLines: 2,
              style: AppTypography.text14.copyWith(
                color: AppColors.text7D,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: snackBarType.bgColor,
      borderRadius: BorderRadius.circular(5.r),
      flushbarPosition: position ?? FlushbarPosition.TOP,
      margin: EdgeInsets.only(
        left: 12.h,
        bottom: 20.h,
        right: 12.w,
      ),
      duration: Duration(seconds: duration ?? 10),
    ).show(NavKey.appNavigatorKey.currentContext!);
  }
}

class SnackBarType {
  const SnackBarType({
    required this.bgColor,
    required this.iconColor,
    required this.icon,
  });
  final Color bgColor;
  final Color iconColor;
  final IconData icon;

  static const SnackBarType warning = SnackBarType(
    bgColor: AppColors.red,
    iconColor: AppColors.red,
    icon: Iconsax.information5,
  );

  // static const SnackBarType success = SnackBarType(
  //   bgColor: AppColors.opacityGreen200,
  //   iconColor: AppColors.textGreen,
  //   icon: Icons.check_circle,
  // );

  // static const SnackBarType kyc = SnackBarType(
  //   bgColor: AppColors.blue00,
  //   iconColor: AppColors.primaryBlue,
  //   icon: Icons.info,
  // );
}
