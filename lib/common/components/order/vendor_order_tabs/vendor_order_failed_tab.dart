import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class VendorOrderFailedTab extends StatefulWidget {
  const VendorOrderFailedTab({
    super.key,
    required this.vm,
  });

  final VendorOrderVm vm;

  @override
  State<VendorOrderFailedTab> createState() => _VendorOrderFailedTabState();
}

class _VendorOrderFailedTabState extends State<VendorOrderFailedTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.vm.fetchBuyerOrders(
        status: OrderStatusType.failed.name.toUpperCase(),
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
                qty: '${widget.vm.activeOrders[i].quantity ?? 0}',
                trackingCode: '5636XDS',
                productName:
                    widget.vm.activeOrders[i].productId?.productName ?? '',
                productImage:
                    widget.vm.activeOrders[i].productId?.images?.first ?? '',
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
