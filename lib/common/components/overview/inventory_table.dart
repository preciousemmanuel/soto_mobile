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
                child: ColumnValue(
                  title: 'Delivered To',
                  value: deliveredTo,
                ),
              ),
              Expanded(
                flex: 8,
                child: ColumnValue(
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
                child: ColumnValue(
                  title: 'Date',
                  value: date,
                ),
              ),
              Expanded(
                flex: 4,
                child: ColumnValue(
                  title: 'Unit Price',
                  value: unitPrce,
                ),
              ),
              Expanded(
                flex: 3,
                child: ColumnValue(
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
