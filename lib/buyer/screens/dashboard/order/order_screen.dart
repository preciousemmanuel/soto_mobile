import 'package:soto_ecommerce/common/common.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderStatusType orderStatusType = OrderStatusType.booked;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<OrderVM>()
          .fetchBuyerOrders(status: OrderStatusType.booked.name.toUpperCase());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(
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
                          OrderStatusType.values.length - 1,
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
                  if (orderStatusType == OrderStatusType.booked)
                    OrderBookedTab(vm: vm, status: OrderStatusType.booked.name),
                  if (orderStatusType == OrderStatusType.pending)
                    OrderPendingTab(
                        vm: vm, status: OrderStatusType.pending.name),
                  if (orderStatusType == OrderStatusType.delivered)
                    OrderDeliveredTab(
                        vm: vm, status: OrderStatusType.delivered.name),
                  if (orderStatusType == OrderStatusType.cancelled)
                    OrderCancelledTab(
                        vm: vm, status: OrderStatusType.cancelled.name),
                  if (orderStatusType == OrderStatusType.failed)
                    OrderFailedTab(vm: vm, status: OrderStatusType.failed.name),
                  if (orderStatusType == OrderStatusType.returned)
                    OrderReturnedTab(
                        vm: vm, status: OrderStatusType.returned.name),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
