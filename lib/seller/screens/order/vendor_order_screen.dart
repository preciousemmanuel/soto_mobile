import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class VendorOrderScreen extends StatefulWidget {
  const VendorOrderScreen({super.key});

  @override
  State<VendorOrderScreen> createState() => _VendorOrderScreenState();
}

class _VendorOrderScreenState extends State<VendorOrderScreen> {
  OrderStatusType orderStatusType = OrderStatusType.pending;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<VendorOrderVm>()
          .fetchBuyerOrders(status: OrderStatusType.pending.name.toUpperCase());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VendorOrderVm>(
      builder: (context, vm, _) {
        return SizedBox(
          width: Sizer.screenWidth,
          height: Sizer.screenHeight,
          child: BusyOverlay(
            child: Scaffold(
              backgroundColor: AppColors.bgWhite,
              appBar: const CustomHeader(
                title: 'My Orders',
                showBackBtn: false,
              ),
              body: Column(
                children: [
                  const YBox(40),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          OrderStatusType.values.length,
                          (i) => StatusWidget(
                            margin: EdgeInsets.only(
                              left: i == 0 ? 20 : 0,
                              right: 10,
                            ),
                            text: OrderStatusType.values[i].name,
                            isSelected:
                                orderStatusType == OrderStatusType.values[i],
                            onTap: () {
                              orderStatusType = OrderStatusType.values[i];
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const YBox(10),
                  if (orderStatusType == OrderStatusType.pending)
                    VendorOrderPendingTab(vm: vm),
                  if (orderStatusType == OrderStatusType.booked)
                    VendorOrderBookedTab(vm: vm),
                  if (orderStatusType == OrderStatusType.delivered)
                    VendorOrderDeliveredTab(vm: vm),
                  if (orderStatusType == OrderStatusType.cancelled)
                    VendorOrderCancelledTab(vm: vm),
                  if (orderStatusType == OrderStatusType.failed)
                    VendorOrderFailedTab(vm: vm),
                  if (orderStatusType == OrderStatusType.returned)
                    VendorOrderReturnedTab(vm: vm),
                  if (orderStatusType == OrderStatusType.custom)
                    VendorOrderCustomTab(vm: vm),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
