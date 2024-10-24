import 'package:soto_ecommerce/buyer/buyer.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            const YBox(10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: const CustomHeader(
                title: 'Checkout',
              ),
            ),
            const YBox(24),
            const CheckoutShippingContact(
              title: 'Shipping Address',
              subText:
                  '39 Ada George Road by Wimp Junction, off GRA Phase 4, Port Harcourt',
            ),
            const YBox(20),
            const CheckoutShippingContact(
              title: 'Contact Information',
              subText: '+234 803900000',
              subText2: 'preciousruchi@gmail.com',
            ),
            ListView.separated(
              padding: EdgeInsets.only(
                top: Sizer.height(20),
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(
                      color: AppColors.whiteF7,
                      thickness: 2,
                    ),
                    const ShoppingCartCard(),
                    if (i == 2)
                      const Divider(
                        color: AppColors.whiteF7,
                        thickness: 2,
                      ),
                  ],
                );
              },
              separatorBuilder: (ctx, i) => const YBox(6),
              itemCount: 3,
            ),
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
              total: 'N500,000',
              btnText: 'Pay',
              btnOntap: () {
                Navigator.pushNamed(context, RoutePath.checkoutPaymentScreen);
              },
            ),
            const YBox(50),
          ],
        ),
      ),
    );
  }
}
