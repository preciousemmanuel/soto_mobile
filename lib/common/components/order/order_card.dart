import 'package:soto_ecommerce/common/common.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderId,
    required this.productName,
    required this.productImage,
    required this.trackingCode,
    required this.qty,
  });

  final String orderId;
  final String productName;
  final String productImage;
  final String trackingCode;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizer.height(90),
      // color: AppColors.red,
      margin: EdgeInsets.symmetric(
        vertical: Sizer.height(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Sizer.width(90),
            width: Sizer.width(90),
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(4),
              vertical: Sizer.height(4),
            ),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Sizer.width(8)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizer.width(8)),
              child: MyCachedNetworkImage(
                imageUrl: productImage,
                fadeInDuration: const Duration(milliseconds: 50),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          const XBox(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order #$trackingCode',
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text20,
                  ),
                ),
                const YBox(2),
                Text(
                  'Standard Delivery',
                  style: AppTypography.text12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text97,
                  ),
                ),
                const Spacer(),
                Text(
                  'Packed',
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const XBox(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              OrderCTA(
                title: '$qty items',
                textColor: AppColors.text70,
              ),
              OrderCTA(
                title: 'Track',
                color: AppColors.primaryOrange,
                vPad: 6,
                hPad: 24,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.trackMyOrderScreen,
                    arguments: OrderDetailArg(orderId: orderId),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderCTA extends StatelessWidget {
  const OrderCTA({
    super.key,
    required this.title,
    this.vPad,
    this.hPad,
    this.color,
    this.textColor,
    this.onTap,
  });

  final String title;
  final double? vPad;
  final double? hPad;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(hPad ?? 10),
          vertical: Sizer.height(vPad ?? 2),
        ),
        decoration: BoxDecoration(
          color: color ?? AppColors.whiteF7,
          borderRadius: BorderRadius.circular(Sizer.width(5)),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTypography.text12.copyWith(
              color: textColor ?? AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
