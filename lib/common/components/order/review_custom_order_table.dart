import 'package:soto_ecommerce/common/common.dart';

class ReviewCustomOrderTable extends StatelessWidget {
  const ReviewCustomOrderTable({
    super.key,
    required this.productName,
    required this.productBrand,
    required this.type,
    required this.size,
    required this.color,
    required this.qty,
    required this.priceRange,
    this.titleColor,
    this.valueColor,
  });

  final String productName;
  final String productBrand;
  final String type;
  final String size;
  final String color;
  final String qty;
  final String priceRange;
  final Color? titleColor;
  final Color? valueColor;

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
                flex: 8,
                child: ColumnValue(
                  title: 'Product name',
                  value: productName,
                  titleColor: titleColor,
                  valueColor: valueColor,
                ),
              ),
              Expanded(
                flex: 8,
                child: ColumnValue(
                  title: 'Product Brand',
                  value: productBrand,
                  titleColor: titleColor,
                  valueColor: valueColor,
                ),
              ),
              Expanded(
                flex: 4,
                child: ColumnValue(
                  title: 'Type',
                  value: type,
                  titleColor: titleColor,
                  valueColor: valueColor,
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
                  title: 'Size',
                  value: size,
                  titleColor: titleColor,
                  valueColor: valueColor,
                ),
              ),
              Expanded(
                flex: 6,
                child: ColumnValue(
                  title: 'Color',
                  value: color,
                  titleColor: titleColor,
                  valueColor: valueColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: ColumnValue(
                  title: 'Qty',
                  value: qty,
                  titleColor: titleColor,
                  valueColor: valueColor,
                ),
              ),
            ],
          ),
          const YBox(10),
          Row(
            children: [
              ColumnValue(
                title: 'Price Range',
                value: priceRange,
                titleColor: titleColor,
                valueColor: valueColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
