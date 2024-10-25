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
                  textColor: AppColors.text57,
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: 'No, Cancel',
                ),
              ),
              const XBox(20),
              Expanded(
                child: CustomBtn.solid(
                  height: 50,
                  onlineColor: AppColors.red49,
                  borderRadius: BorderRadius.circular(30),
                  onTap: onConfirm,
                  text: 'Yes, Logout',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
