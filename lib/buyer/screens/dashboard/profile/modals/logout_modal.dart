import 'package:soto_ecommerce/common/common.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({
    super.key,
    this.onConfirm,
  });

  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Do you want to Logout?',
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
                  text: 'No, Cancel',
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
                  text: 'Yes, Logout',
                ),
              ),
            ],
          ),
          const YBox(20),
        ],
      ),
    );
  }
}
