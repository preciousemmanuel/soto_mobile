import 'package:soto_ecommerce/common/common.dart';

class ModalWrapper {
  const ModalWrapper._();
  static Future<T?> bottomSheet<T>({
    required BuildContext context,
    required Widget widget,
    isScrollControlled = true,
    bool? canDismiss,
    double? topRadius,
    Color? color,
  }) {
    return showModalBottomSheet<T>(
      backgroundColor: color ?? Colors.transparent,
      isScrollControlled: true,
      isDismissible: canDismiss ?? true,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRadius ?? 16),
          topRight: Radius.circular(topRadius ?? 16),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          width: Sizer.screenWidth,
          child: widget,
        );
      },
    );
  }

  static void showCustomDialog(
    BuildContext context, {
    required Widget child,
    bool? canDismiss,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: canDismiss ?? true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w), child: child),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
