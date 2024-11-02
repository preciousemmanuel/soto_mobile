import 'package:soto_ecommerce/common/common.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal({
    super.key,
    required this.message,
    this.cancelText,
    this.confirmText,
    this.onConfirm,
  });

  final String message;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(
          left: Sizer.width(30),
          right: Sizer.width(30),
          top: Sizer.height(20),
          bottom: Sizer.height(20),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // 'Do you want to Logout?',
              message,
              textAlign: TextAlign.center,
              style: AppTypography.text18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const YBox(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomBtn.solid(
                    height: 50,
                    onlineColor: AppColors.grayF2,
                    // textColor: AppColors.text57,
                    borderRadius: BorderRadius.circular(30),
                    textStyle: AppTypography.text14.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.text57),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: cancelText ?? 'No, Cancel',
                  ),
                ),
                const XBox(16),
                Expanded(
                  child: CustomBtn.solid(
                    height: 50,
                    onlineColor: AppColors.red49,
                    borderRadius: BorderRadius.circular(30),
                    onTap: onConfirm,
                    textStyle: AppTypography.text14.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.white),
                    text: confirmText ?? 'Yes, Confirm',
                  ),
                ),
              ],
            ),
            const YBox(20),
          ],
        ),
      ),
    );
  }
}
