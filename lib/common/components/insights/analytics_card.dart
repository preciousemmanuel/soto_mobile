import 'package:soto_ecommerce/common/common.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({
    super.key,
    required this.name,
    required this.revenue,
    required this.percentage,
    this.bgColor,
    this.nameTextColor,
  });

  final String name;
  final String revenue;
  final String percentage;
  final Color? bgColor;
  final Color? nameTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(24),
        vertical: Sizer.height(20),
      ),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.greenF1,
        borderRadius: BorderRadius.circular(
          Sizer.radius(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            revenue,
            style: AppTypography.text36.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(10),
          Text(
            name,
            style: AppTypography.text14.copyWith(
              color: nameTextColor ?? AppColors.green23,
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(10),
          Text(
            percentage,
            style: AppTypography.text13.copyWith(
              color: AppColors.text20,
            ),
          ),
        ],
      ),
    );
  }
}
