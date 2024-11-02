import 'package:soto_ecommerce/common/common.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderVM>().fetchMyOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(builder: (context, vm, _) {
      return SizedBox(
        width: Sizer.screenWidth,
        height: Sizer.screenHeight,
        child: BusyOverlay(
          child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const YBox(20),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(20),
                    ),
                    child: CustomHeader(
                      title: 'My Orders',
                      backBtn: () {},
                    ),
                  ),
                  const YBox(40),
                  Row(
                    children: [
                      ...List.generate(
                        OrderStatusType.values.length,
                        (i) => StatusWidget(
                          margin: EdgeInsets.only(
                            left: i == 0 ? 20 : 0,
                            right: 10,
                          ),
                          text: OrderStatusType.values[i].name,
                          isSelected: i == currentIndex,
                          onTap: () {
                            currentIndex = i;
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                  const YBox(10),
                  Expanded(
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
                            const OrderCard(),
                            if (i == 4) const Divider(color: AppColors.whiteF7),
                          ],
                        );
                      },
                      separatorBuilder: (ctx, i) => const YBox(6),
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
