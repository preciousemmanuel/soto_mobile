import 'package:soto_ecommerce/common/common.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Options',
                  style: AppTypography.text20.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const YBox(10),
                const ShippingOptionTile(
                  duration: '4-7 days',
                  price: 'Free',
                  title: 'Standard',
                  isSelected: true,
                ),
                const YBox(12),
                const ShippingOptionTile(
                  duration: '1-2 days',
                  price: 'N2,000',
                  title: 'Express',
                  isSelected: false,
                  bg: AppColors.baseF9,
                ),
              ],
            ),
          ),
          const YBox(24),
          CartAmountTotal(
            total:
                '${AppUtils.nairaSymbol}${AppUtils.formatAmountString('${context.watch<OrderVM>().cartTotalAmount}')}',
            btnText: 'Pay',
            btnOntap: () {
              // TODO: check this out later
              // Navigator.pushNamed(context, RoutePath.checkoutPaymentScreen);
              Navigator.pushNamed(context, RoutePath.confirmPaymentScreen);
            },
          ),
          const YBox(50),
        ],
      ),
    );
  }
}
