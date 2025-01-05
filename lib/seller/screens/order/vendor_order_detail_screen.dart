// ignore_for_file: prefer_is_empty

import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class VendorOrderDetailScreen extends StatefulWidget {
  const VendorOrderDetailScreen({
    super.key,
    required this.args,
  });

  final OrderDetailArg args;

  @override
  State<VendorOrderDetailScreen> createState() =>
      _VendorOrderDetailScreenState();
}

class _VendorOrderDetailScreenState extends State<VendorOrderDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    printty('init state ${widget.args.vendorOrder}');
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: CustomHeader(
        title: 'Vendor Order Details',
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
        child: ListView(
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
                    widget.args.vendorOrder?.status ?? "Pending",
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
                        "#${widget.args.vendorOrder?.trackingId ?? "123456"}",
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
                        AppUtils.formatDateTime(
                            (widget.args.vendorOrder?.createdAt ??
                                    DateTime.now())
                                .toLocal()
                                .toString()),
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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                final items = widget.args.vendorOrder?.items?[i];
                return OrderDetailsTile(
                  onTap: () {},
                  productAmt: (items?.unitPrice ?? 0).toString(),
                  productImage:
                      (items?.images == null || items?.images?.length == 0)
                          ? ""
                          : items?.images?.first ?? "",
                  productName: items?.productName ?? "",
                  productQty: (items?.quantity ?? 0).toString(),
                );
              },
              separatorBuilder: (_, __) => const Divider(
                color: AppColors.whiteF7,
              ),
              itemCount: widget.args.vendorOrder?.items?.length ?? 0,
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
                  "${AppUtils.nairaSymbol}${AppUtils.formatAmountString(
                    (widget.args.vendorOrder?.grandTotal ?? 0).toString(),
                  )}",
                  style: GoogleFonts.roboto(
                    color: AppColors.primaryOrange,
                    fontSize: Sizer.height(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
