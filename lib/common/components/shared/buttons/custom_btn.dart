import 'package:soto_ecommerce/common/common.dart';

class CustomBtn {
  static Widget solid({
    required Function()? onTap,
    bool online = true,
    bool isOutline = false,
    required String text,
    bool isLoading = false,
    BorderRadiusGeometry? borderRadius,
    double? width,
    double? height,
    Color? offlineColor,
    Color? onlineColor,
    Color? outlineColor,
    Color? textColor,
    TextStyle? textStyle,
  }) {
    return IgnorePointer(
      ignoring: !online || isLoading,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width ?? Sizer.screenWidth,
          height: Sizer.height(height ?? 60),
          decoration: (online && !isLoading)
              ? BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(14),
                  color: isOutline
                      ? AppColors.transparent
                      : onlineColor ?? AppColors.primaryOrange,
                  border: isOutline
                      ? Border.all(
                          color: outlineColor ?? AppColors.primaryOrange)
                      : null,
                )
              : BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(14),
                  color: offlineColor ?? AppColors.baseGray,
                ),
          child: Center(
            child: isLoading
                ? const FittedBox(
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  )
                : Text(
                    text,
                    style: textStyle ??
                        AppTypography.text16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: online
                              ? textColor ?? AppColors.white
                              : AppColors.gray500,
                        ),
                  ),
          ),
        ),
      ),
    );
  }

  static Widget withChild({
    required Function()? onTap,
    bool online = true,
    bool isOutline = false,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Color? offlineColor,
    Color? onlineColor,
    Color? outlineColor,
    required Widget child,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width ?? Sizer.screenWidth,
          height: Sizer.height(height ?? 60),
          decoration: online
              ? BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(14),
                  color: isOutline
                      ? AppColors.transparent
                      : onlineColor ?? AppColors.primaryOrange,
                  border: isOutline
                      ? Border.all(
                          color: outlineColor ?? AppColors.primaryOrange)
                      : null,
                )
              : BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(14),
                  color: offlineColor ?? AppColors.baseGray,
                ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
