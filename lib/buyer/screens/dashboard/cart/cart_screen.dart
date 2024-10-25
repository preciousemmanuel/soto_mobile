import 'package:soto_ecommerce/common/common.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              child: CustomHeader(
                title: 'Shopping Cart',
                backBtn: () {},
              ),
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
            const YBox(26),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: Text(
                'You may the like ',
                style: AppTypography.text16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const YBox(20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: Sizer.width(20),
              mainAxisSpacing: Sizer.width(20),
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.74,
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              children: [
                for (int i = 0; i < 2; i++) const RelatedProductCard(),
              ],
            ),
            const YBox(48),
            CartAmountTotal(
              total: 'N1,000,000',
              btnText: 'Proceed to checkout',
              btnOntap: () {
                Navigator.pushNamed(context, RoutePath.checkoutScreen);
              },
            ),
            const YBox(100),
          ],
        ),
      ),
    );
  }
}
