import 'package:soto_ecommerce/core/core.dart';

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
                    style: AppTypography.text16.copyWith(
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
    required bool online,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    double? width,
    Color? offlineColor,
    Color? onlineColor,
    required Widget child,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width ?? Sizer.screenWidth,
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: Sizer.height(14),
                horizontal: Sizer.width(10),
              ),
          decoration: online
              ? BoxDecoration(
                  borderRadius: borderRadius,
                  color: onlineColor ?? AppColors.primaryOrange,
                )
              : BoxDecoration(
                  borderRadius: borderRadius,
                  color: offlineColor ?? AppColors.baseGray,
                ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
