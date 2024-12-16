import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/common/common.dart';

class OverViewStat extends StatelessWidget {
  const OverViewStat({
    super.key,
    required this.title,
    required this.subtitle,
    required this.cent,
    required this.amount,
    this.iconColor,
  });

  final String title;
  final String subtitle;
  final String cent;
  final String amount;
  final Color? iconColor;

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
              Skeleton.replace(
                replacement: const Bone.circle(
                  size: 25,
                ),
                child: svgHelper(
                  AppSvgs.activity,
                  color: iconColor,
                  width: Sizer.width(25),
                ),
              ),
              const XBox(8),
              Text(
                title,
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
                '${AppUtils.nairaSymbol}$amount',
                style: GoogleFonts.roboto(
                  fontSize: Sizer.text(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const XBox(4),
              Text(
                cent,
                style: AppTypography.text10.copyWith(
                  color: AppColors.greenB78,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            subtitle,
            style: AppTypography.text10.copyWith(
              color: AppColors.black66.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
