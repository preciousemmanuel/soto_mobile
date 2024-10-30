import 'package:soto_ecommerce/common/common.dart';

class InventoryTab extends StatelessWidget {
  const InventoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        children: const [
          YBox(24),
          Row(
            children: [
              Expanded(
                child: InventoryStat(
                  name: 'Total Products',
                  quantity: '1,445 ',
                ),
              ),
              XBox(20),
              Expanded(
                child: InventoryStat(
                  name: 'Total Sold',
                  quantity: '1,445 ',
                ),
              ),
              XBox(20),
              Expanded(
                child: InventoryStat(
                  name: 'Total In stock',
                  quantity: '1,445 ',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

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
