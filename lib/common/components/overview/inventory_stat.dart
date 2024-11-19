import 'package:soto_ecommerce/common/common.dart';

class InventoryStat extends StatelessWidget {
  const InventoryStat({
    super.key,
    required this.name,
    required this.quantity,
  });

  final String name;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(8),
        vertical: Sizer.height(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Sizer.radius(4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTypography.text12),
          const YBox(4),
          Text(
            quantity,
            style: AppTypography.text12.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
