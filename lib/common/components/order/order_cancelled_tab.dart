import 'package:soto_ecommerce/common/common.dart';

class OrderCancelledTab extends StatefulWidget {
  const OrderCancelledTab({
    super.key,
    required this.vm,
  });

  final OrderVM vm;

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
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(color: AppColors.whiteF7),
              OrderCard(
                orderId: widget.vm.activeOrders[i].id ?? '',
                qty: '${widget.vm.activeOrders[i].items?.first.quantity ?? 0}',
                trackingCode: widget.vm.activeOrders[i].trackingId ?? '',
                productName:
                    widget.vm.activeOrders[i].items?.first.productName ?? '',
                productImage:
                    widget.vm.activeOrders[i].items?.first.images?.first ?? '',
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
