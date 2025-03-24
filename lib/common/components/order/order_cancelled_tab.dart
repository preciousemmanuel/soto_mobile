import 'package:soto_ecommerce/common/common.dart';

class OrderCancelledTab extends StatefulWidget {
  const OrderCancelledTab({
    super.key,
    required this.vm,
    this.status,
  });

  final OrderVM vm;
  final String? status;

  @override
  State<OrderCancelledTab> createState() => _OrderCancelledTabState();
}

class _OrderCancelledTabState extends State<OrderCancelledTab> {
  @override
  void initState() {
    super.initState();
    printty('init state');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.vm.fetchBuyerOrders(
        status: OrderStatusType.cancelled.name.toUpperCase(),
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
              // VendorOrderCard(
              //   orderCode: ao.trackingId ?? '',
              //   orderLength: '${ao.items?.length ?? 0}',
              //   orderTime: AppUtils.formatDateTime(
              //       (ao.updatedAt ?? DateTime.now()).toLocal().toString()),
              //   onTap: () {
              //     Navigator.pushNamed(
              //       context,
              //       RoutePath.orderDetailScreen,
              //       arguments: OrderDetailArg(
              //         orderId: ao.id ?? '',
              //         isVendor: true,
              //         buyerOrder: ao,
              //       ),
              //     );
              //   },
              // ),

              OrderCard(
                status: widget.status,
                orderId: ao.id ?? '',
                qty: '${ao.items?.length ?? 0}',
                trackingCode: ao.trackingId ?? '',
                productName: ao.items?.first.productName ?? '',
                orderTime: AppUtils.formatDateTime(
                    (ao.updatedAt ?? DateTime.now()).toLocal().toString()),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.orderDetailScreen,
                    arguments: OrderDetailArg(
                      orderId: ao.id ?? '',
                      buyerOrder: ao,
                    ),
                  );
                },
              ),
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
