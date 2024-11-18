import 'package:soto_ecommerce/common/common.dart';

class InventoryTable extends StatelessWidget {
  const InventoryTable({
    super.key,
    required this.date,
    required this.deliveredTo,
    required this.unitPrce,
    required this.qty,
    required this.productName,
  });

  final String date;
  final String deliveredTo;
  final String unitPrce;
  final String qty;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(10),
        vertical: Sizer.height(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: InventoryColumn(
                  title: 'Delivered To',
                  value: deliveredTo,
                ),
              ),
              Expanded(
                flex: 8,
                child: InventoryColumn(
                  title: 'Product Name',
                  value: date,
                ),
              ),
            ],
          ),
          const YBox(10),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: InventoryColumn(
                  title: 'Date',
                  value: date,
                ),
              ),
              Expanded(
                flex: 4,
                child: InventoryColumn(
                  title: 'Unit Price',
                  value: unitPrce,
                ),
              ),
              Expanded(
                flex: 3,
                child: InventoryColumn(
                  title: 'Qty',
                  value: qty,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InventoryColumn extends StatelessWidget {
  const InventoryColumn({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.text14.copyWith(
            color: AppColors.text060,
            fontWeight: FontWeight.w500,
          ),
        ),
        const YBox(4),
        Text(
          value,
          style: AppTypography.text12.copyWith(
            color: AppColors.gray8D,
          ),
        ),
      ],
    );
  }
}
