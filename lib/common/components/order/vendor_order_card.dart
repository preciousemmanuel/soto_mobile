import 'package:soto_ecommerce/common/common.dart';

class VendorOrderCard extends StatelessWidget {
  const VendorOrderCard({
    super.key,
    required this.orderCode,
    required this.orderLength,
    required this.orderTime,
    this.orderStatus,
    this.onTap,
  });

  final String orderCode;
  final String orderLength;
  final String orderTime;
  final String? orderStatus;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizer.height(6),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID  #$orderCode',
                    style: AppTypography.text16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.text20,
                    ),
                  ),
                  const YBox(2),
                  Text(
                    orderTime,
                    style: AppTypography.text14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.text97,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '$orderLength items',
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text97,
                  ),
                ),
                const XBox(6),
                Icon(
                  Iconsax.arrow_right_3,
                  size: Sizer.height(26),
                  color: AppColors.primaryOrange,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
