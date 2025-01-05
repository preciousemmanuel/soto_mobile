import 'package:soto_ecommerce/common/common.dart';

class OrderDeliveredTab extends StatefulWidget {
  const OrderDeliveredTab({
    super.key,
    required this.vm,
    this.status,
  });

  final OrderVM vm;
  final String? status;

  @override
  State<OrderDeliveredTab> createState() => _OrderDeliveredTabState();
}

class _OrderDeliveredTabState extends State<OrderDeliveredTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.vm.fetchBuyerOrders(
        status: OrderStatusType.delivered.name.toUpperCase(),
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
                    (ao.createdAt ?? DateTime.now()).toLocal().toString()),
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
              //   status: widget.status,
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
