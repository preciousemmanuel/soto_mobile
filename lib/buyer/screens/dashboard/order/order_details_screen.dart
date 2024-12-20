import 'package:soto_ecommerce/common/common.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
    required this.args,
  });

  final OrderDetailArg args;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  _init() async {
    // context.read<VendorOrderVm>().fetchOrderDetails(widget.args.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: CustomHeader(
        title: 'Order Details',
        titleWeight: FontWeight.w500,
        titleStyle: AppTypography.text16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.text12,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YBox(26),
            Row(
              children: [
                Text(
                  "Delivery Status",
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text72A,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizer.width(10),
                    vertical: Sizer.height(2),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.yellow00.withOpacity(0.25),
                      borderRadius: BorderRadiusDirectional.circular(
                        Sizer.width(4),
                      )),
                  child: Text(
                    "Pending",
                    style: AppTypography.text12.copyWith(
                      color: AppColors.yellow07,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const YBox(26),
            Text(
              "General info",
              style: AppTypography.text16.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.text72A,
              ),
            ),
            const YBox(16),
            Padding(
              padding: EdgeInsets.only(
                left: Sizer.width(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Order ID",
                        style: AppTypography.text14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.text060,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "#92287157",
                        style: AppTypography.text14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.dividerColor),
                  Row(
                    children: [
                      Text(
                        "Order date",
                        style: AppTypography.text14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.text060,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "18-12-2024, 04:20",
                        style: AppTypography.text14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const YBox(40),
            Text(
              "Product List",
              style: AppTypography.text16.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.text72A,
              ),
            ),
            const YBox(16),
            OverviewProductTile(
              onTap: () {},
              product: const Product(
                productName: "Product Name",
                unitPrice: 2000,
                productQuantity: 12,
              ),
            ),
            const YBox(6),
            const Divider(color: AppColors.dividerColor),
            const YBox(6),
            OverviewProductTile(
              onTap: () {},
              product: const Product(
                productName: "Product Name",
                unitPrice: 2000,
                productQuantity: 12,
              ),
            ),
            const YBox(30),
            Row(
              children: [
                Text(
                  "Payment Status",
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text72A,
                  ),
                ),
                const Spacer(),
                Container(
                  width: Sizer.width(80),
                  height: Sizer.height(30),
                  decoration: BoxDecoration(
                      color: AppColors.greenB59.withOpacity(0.25),
                      borderRadius: BorderRadiusDirectional.circular(
                        Sizer.width(4),
                      )),
                  child: Center(
                    child: Text(
                      "Paid",
                      style: AppTypography.text12.copyWith(
                        color: AppColors.greenB59,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const YBox(30),
            Row(
              children: [
                Text(
                  "Total Amount",
                  style: AppTypography.text14.copyWith(
                    color: AppColors.text72A,
                  ),
                ),
                const Spacer(),
                Text(
                  "N400,000",
                  style: AppTypography.text14.copyWith(
                    color: AppColors.primaryOrange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomBtn.solid(
              // online: vm.btnIsValid,
              onTap: () {
                Navigator.pushNamed(context, RoutePath.raiseDisputeScreen);
              },
              text: "Raise Dispute",
            ),
            const YBox(40),
          ],
        ),
      ),
    );
  }
}
