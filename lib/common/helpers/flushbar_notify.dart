import 'package:another_flushbar/flushbar.dart';
import 'package:soto_ecommerce/common/common.dart';

class FlushBarToast {
  static fLSnackBar({
    required String message,
    Color? textColor,
    int? duration,
    FlushbarPosition? position,
    SnackBarType snackBarType = SnackBarType.warning,
    String? actionText,
    Function()? onActionTap,
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
            child: Row(
              children: [
                Text(
                  message,
                  // overflow: TextOverflow.ellipsis,
                  // maxLines: 2,
                  style: AppTypography.text14.copyWith(
                    color: AppColors.text7D,
                  ),
                ),
                if (onActionTap != null) const Spacer(),
                if (onActionTap != null)
                  InkWell(
                    onTap: onActionTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizer.width(8),
                        vertical: Sizer.height(2),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange,
                        borderRadius: BorderRadius.circular(Sizer.radius(4)),
                      ),
                      child: Text(
                        actionText ?? 'OK',
                        style: AppTypography.text12.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
              ],
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
    bgColor: AppColors.opacityRed100,
    iconColor: AppColors.red,
    icon: Iconsax.information5,
  );

  static const SnackBarType success = SnackBarType(
    bgColor: AppColors.opacityGreen200,
    iconColor: AppColors.green59,
    icon: Icons.check_circle,
  );
}
