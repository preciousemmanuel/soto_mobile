import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class VendorOrderBookedTab extends StatefulWidget {
  const VendorOrderBookedTab({
    super.key,
    required this.vm,
  });

  final VendorOrderVm vm;

  @override
  State<VendorOrderBookedTab> createState() => _VendorOrderBookedTabState();
}

class _VendorOrderBookedTabState extends State<VendorOrderBookedTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.vm.fetchVendorOrders(
        status: OrderStatusType.booked.name.toUpperCase(),
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
                    RoutePath.vendorOrderDetailScreen,
                    arguments: OrderDetailArg(
                      orderId: ao.id ?? '',
                      isVendor: true,
                      vendorOrder: ao,
                    ),
                  );
                },
              ),
              if (i == widget.vm.activeOrders.length - 1)
                const Divider(color: AppColors.whiteF7),
            ],
          );
        },
        separatorBuilder: (ctx, i) => const YBox(6),
        itemCount: widget.vm.activeOrders.length,
      ),
    );
  }
}
