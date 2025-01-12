import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/common/common.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: const CustomHeader(
        title: 'Checkout',
      ),
      body: ListView(
        children: [
          const YBox(24),
          Consumer<AuthUserVM>(builder: (context, authVM, _) {
            return Column(
              children: [
                CheckoutShippingContact(
                  onTap: () {
                    ModalWrapper.bottomSheet(
                      context: context,
                      widget: const ShippingAddressModal(),
                    );
                  },
                  title: 'Shipping Address',
                  subText:
                      '${authVM.authUser?.shippingAddress?.fullAddress}, ${authVM.authUser?.shippingAddress?.country}',
                ),
                const YBox(20),
                CheckoutShippingContact(
                  title: 'Contact Information',
                  subText: authVM.authUser?.phoneNumber ?? '',
                  subText2: authVM.authUser?.email ?? '',
                ),
                ListView.separated(
                  padding: EdgeInsets.only(
                    top: Sizer.height(20),
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    final cartItems = context.watch<OrderVM>().cartItems;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(
                          color: AppColors.whiteF7,
                          thickness: 2,
                        ),
                        ShoppingCartCard(
                          cartItem: cartItems[i],
                        ),
                        if (i == (cartItems.length - 1))
                          const Divider(
                            color: AppColors.whiteF7,
                            thickness: 2,
                          ),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, i) => const YBox(6),
                  itemCount: context.watch<OrderVM>().cartItems.length,
                ),
              ],
            );
          }),
          const YBox(20),
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: Sizer.width(20),
          //   ),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Shipping Options',
          //         style: AppTypography.text20.copyWith(
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       const YBox(10),
          //       const ShippingOptionTile(
          //         duration: '4-7 days',
          //         price: 'Free',
          //         title: 'Standard',
          //         isSelected: true,
          //       ),
          //       const YBox(12),
          //       const ShippingOptionTile(
          //         duration: '1-2 days',
          //         price: 'N2,000',
          //         title: 'Express',
          //         isSelected: false,
          //         bg: AppColors.baseF9,
          //       ),
          //     ],
          //   ),
          // ),

          const YBox(200),
        ],
      ),
      bottomSheet: Consumer<OrderVM>(builder: (ctx, orderVm, _) {
        return Container(
          padding: EdgeInsets.only(
            bottom: Sizer.height(20),
            top: Sizer.height(10),
          ),
          color: AppColors.bgWhite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Skeletonizer(
                enabled: orderVm.isBusy,
                child: CustomPaymentListTile(
                  leftText: 'Shipping',
                  rightText:
                      '${AppUtils.nairaSymbol}${AppUtils.formatAmountString((orderVm.shippingCostAgility?.shippingCost ?? 0).toString())}',
                  rightStyle: GoogleFonts.roboto(
                    fontSize: Sizer.text(16),
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryOrange,
                  ),
                ),
              ),
              CartAmountTotal(
                total:
                    '${AppUtils.nairaSymbol}${AppUtils.formatAmountString('${orderVm.cartTotalAmount}')}',
                btnText: 'Pay',
                btnOntap: () {
                  // TODO: check this out later
                  // Navigator.pushNamed(context, RoutePath.checkoutPaymentScreen);
                  Navigator.pushNamed(context, RoutePath.confirmPaymentScreen);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
