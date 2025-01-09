// ignore_for_file: use_build_context_synchronously

import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final orderVM = context.read<OrderVM>();
      orderVM.getDeliveryAgilityPrice(
        items: orderVM.cartItems,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(
      builder: (context, orderVm, _) {
        return BusyOverlay(
          show: orderVm.isBusy,
          child: Scaffold(
            backgroundColor: AppColors.bgFB,
            appBar: const CustomHeader(
              title: 'Confirm Payment',
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                const YBox(30),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizer.width(20),
                  ),
                  child: Wrap(
                      spacing: 30,
                      runSpacing: 20,
                      children: orderVm.cartItems
                          .map((item) => ConfirmPaymentProduct(
                                image: item.productImage ?? '',
                                name: item.productName ?? '',
                                onTap: () {},
                              ))
                          .toList()),
                ),
                const YBox(10),
                const Divider(color: AppColors.dividerColor),
                CustomPaymentListTile(
                  leftText: 'Number of items',
                  rightText: '${orderVm.cartItems.length}',
                ),
                CustomPaymentListTile(
                  leftText: 'Total Amount',
                  rightText:
                      '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(orderVm.cartTotalAmount.toString())}',
                ),
                const CustomPaymentListTile(
                  leftText: 'Vats',
                  rightText: 'N200',
                ),
                CustomPaymentListTile(
                  leftText: 'Shipping',
                  rightText:
                      '${AppUtils.nairaSymbol}${AppUtils.formatAmountString((orderVm.shippingCostAgility?.shippingCost ?? 0).toString())}',
                  leftStyle: AppTypography.text16.copyWith(
                    color: AppColors.primaryOrange,
                  ),
                  rightStyle: GoogleFonts.roboto(
                    fontSize: Sizer.text(16),
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryOrange,
                  ),
                ),
                const Divider(color: AppColors.dividerColor),
                CustomPaymentListTile(
                  leftText: 'Total',
                  rightText:
                      '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(orderVm.cartTotalAmount.toString())}',
                  leftStyle: AppTypography.text20.copyWith(
                    color: AppColors.primaryOrange,
                  ),
                  rightStyle: GoogleFonts.roboto(
                    fontSize: Sizer.text(20),
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryOrange,
                  ),
                ),
                const Divider(color: AppColors.dividerColor),
                const YBox(10),
                Consumer<AuthUserVM>(builder: (context, authVM, _) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Details',
                          style: AppTypography.text20.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const YBox(10),
                        CustomColumnText(
                          upperText: 'Order Address',
                          lowerText: orderVm.shippingCostAgility?.agilityPayload
                                  ?.receiverAddress ??
                              '',
                        ),
                        const YBox(10),
                        CustomColumnText(
                          upperText: 'Recipient',
                          lowerText: authVM.fullname,
                        ),
                        // const YBox(10),
                        // const CustomColumnText(
                        //   upperText: 'Payment method',
                        //   lowerText: 'Mastercard ending in 3947',
                        // ),
                        const YBox(50),
                        Consumer<OrderVM>(builder: (context, orderVM, _) {
                          return CustomBtn.solid(
                            text: "Proceed",
                            isLoading: orderVM.isBusy,
                            height: 53,
                            borderRadius:
                                BorderRadius.circular(Sizer.radius(50)),
                            onTap: () => _createOrder(),
                          );
                        }),
                        const YBox(16),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Shipping and return policies',
                            textAlign: TextAlign.center,
                            style: AppTypography.text12.copyWith(
                              color: AppColors.orange71,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                const YBox(100),
              ],
            ),
          ),
        );
      },
    );
  }

  void _createOrder() async {
    final orderVM = context.read<OrderVM>();
    final authVM = context.read<AuthUserVM>();
    final currentCtx = NavKey.appNavigatorKey.currentContext!;
    try {
      final createOrderRes = await orderVM.createOder(
          items: orderVM.cartItems, address: authVM.shippingADD);

      if (createOrderRes.success) {
        final orderLinkRes = await orderVM.generatePaymentLink(
            amount: orderVM.cartTotalAmount,
            orderId: createOrderRes.data ?? '');
        print("orderLinkResCont $orderLinkRes");
        if (orderLinkRes.success) {
          Navigator.pushReplacementNamed(
            context,
            RoutePath.customWebviewScreen,
            arguments: WebViewArg(
              webURL: orderLinkRes.data ?? '',
              onBackPress: () {
                currentCtx.read<OrderVM>().clearCart();
                Navigator.pushNamedAndRemoveUntil(
                  currentCtx,
                  RoutePath.dashboardNavScreen,
                  (route) => false,
                  arguments: DashArg(index: 1),
                );
              },
            ),
          );
        }
      }
    } catch (e) {
      FlushBarToast.fLSnackBar(
        message: e.toString(),
      );
    }
    //     .then((val) {
    //   if (val.success) {
    //     orderVM
    //         .generatePaymentLink(
    //             amount: authVM.cart?.totalAmount ?? 0, orderId: val.data ?? '')
    //         .then((value) {
    //       if (value.success) {
    //         Navigator.pushNamed(
    //           context,
    //           RoutePath.customWebviewScreen,
    //           arguments: WebViewArg(
    //             webURL: value.data ?? '',
    //           ),
    //         );
    //       } else {
    //         FlushBarToast.fLSnackBar(
    //           message: value.message ?? "Something went wrong",
    //         );
    //       }
    //     });
    //   } else {
    //     FlushBarToast.fLSnackBar(
    //       message: val.message ?? "Something went wrong",
    //     );
    //   }
    // });
  }
}
