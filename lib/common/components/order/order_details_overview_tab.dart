import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class OrderDetailsOverviewTab extends StatelessWidget {
  const OrderDetailsOverviewTab({
    super.key,
    required this.buyerOrder,
  });

  final OrderRes buyerOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YBox(30),
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
                  buyerOrder.status ?? "PENDING",
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
                      "#${buyerOrder.trackingId ?? ""}",
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
                          (buyerOrder.createdAt ?? DateTime.now())
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
              final items = buyerOrder.items?[i];
              return OrderDetailsTile(
                onTap: () {},
                productAmt: (items?.unitPrice ?? 0).toString(),
                productImage:
                    (items?.images == null || (items?.images ?? []).isEmpty)
                        ? ""
                        : items?.images?.first ?? "",
                productName: items?.productName ?? "",
                productQty: (items?.quantity ?? 0).toString(),
              );
            },
            separatorBuilder: (_, __) => const Divider(
              color: AppColors.whiteF7,
            ),
            itemCount: buyerOrder.items?.length ?? 0,
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
                    buyerOrder.paymentType ?? "PENDING",
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
                "${AppUtils.nairaSymbol}${AppUtils.formatAmountString(
                  (buyerOrder.grandTotal ?? 0).toString(),
                )}",
                style: GoogleFonts.roboto(
                  color: AppColors.primaryOrange,
                  fontSize: Sizer.height(14),
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
    );
  }
}
