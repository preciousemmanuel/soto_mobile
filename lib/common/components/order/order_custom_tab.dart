import 'package:soto_ecommerce/common/common.dart';

class OrderCustomTab extends StatefulWidget {
  const OrderCustomTab({
    super.key,
    required this.vm,
  });

  final OrderVM vm;

  @override
  State<OrderCustomTab> createState() => _OrderCustomTabState();
}

class _OrderCustomTabState extends State<OrderCustomTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.vm.fetchBuyerOrders(
        status: OrderStatusType.custom.name.toUpperCase(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.vm.isBusy) {
      return const SizerLoader(height: 500);
    }
    if (widget.vm.activeOrders.isEmpty) {
      return const EmptyListState(
        height: 500,
        text: 'No order yet',
      );
    }
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: Sizer.height(20),
          left: Sizer.width(20),
          right: Sizer.width(20),
          bottom: Sizer.height(60),
        ),
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          final ao = widget.vm.activeOrders[i];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(color: AppColors.whiteF7),
              VendorOrderCard(
                orderCode: ao.trackingId ?? '',
                orderLength: '${ao.items?.length ?? 0}',
                orderTime: AppUtils.formatDateTime(
                    (ao.updatedAt ?? DateTime.now()).toLocal().toString()),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.orderDetailScreen,
                    arguments: OrderDetailArg(
                      orderId: ao.id ?? '',
                      isVendor: true,
                      buyerOrder: ao,
                    ),
                  );
                },
              ),
              // OrderCard(
              //   orderId: widget.vm.activeOrders[i].id ?? '',
              //   qty: '${widget.vm.activeOrders[i].items?.first.quantity ?? 0}',
              //   trackingCode: widget.vm.activeOrders[i].trackingId ?? '',
              //   productName:
              //       widget.vm.activeOrders[i].items?.first.productName ?? '',
              //   productImage:
              //       widget.vm.activeOrders[i].items?.first.images?.first ?? '',
              // ),
              if (i == 4) const Divider(color: AppColors.whiteF7),
            ],
          );
        },
        separatorBuilder: (ctx, i) => const YBox(6),
        itemCount: widget.vm.activeOrders.length,
      ),
    );
  }
}
