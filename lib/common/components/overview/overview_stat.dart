import 'package:soto_ecommerce/common/common.dart';

class OverViewStat extends StatelessWidget {
  const OverViewStat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(16),
        vertical: Sizer.height(12),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grayE8,
        ),
        borderRadius: BorderRadius.circular(
          Sizer.radius(6),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              svgHelper(
                AppSvgs.activity,
                width: Sizer.width(25),
              ),
              const XBox(8),
              Text(
                'Sold',
                style: AppTypography.text10.copyWith(
                  color: AppColors.primaryOrange.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const YBox(2),
          Row(
            children: [
              Text(
                'N51,858',
                style: AppTypography.text24.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const XBox(4),
              Text(
                '+55%',
                style: AppTypography.text10.copyWith(
                  color: AppColors.greenB78,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            'Amount to be Remitted',
            style: AppTypography.text10.copyWith(
              color: AppColors.black66.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
