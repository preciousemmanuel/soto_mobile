import 'package:soto_ecommerce/buyer/screens/dashboard/home/product/product_details_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(builder: (context, vm, _) {
      return SizedBox(
        width: Sizer.screenWidth,
        height: Sizer.screenHeight,
        child: BusyOverlay(
          show: vm.isBusy || context.watch<AuthUserVM>().isBusy,
          child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            appBar: CustomHeader(
              title: 'Shopping Cart',
              backBtn: () {},
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<AuthUserVM>().getUserProfile();
              },
              child: ListView(
                children: [
                  Consumer<AuthUserVM>(
                    builder: (context, authVM, _) {
                      if (authVM.cart?.items == null ||
                          authVM.cart?.items?.isEmpty == true) {
                        return const EmptyListState(
                          text: 'Cart is empty, add some products',
                        );
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.separated(
                            padding: EdgeInsets.only(
                              top: Sizer.height(20),
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, i) {
                              final cartItem = authVM.cart?.items?[i];
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Divider(
                                    color: AppColors.whiteF7,
                                    thickness: 2,
                                  ),
                                  ShoppingCartCard(
                                    cartItem: cartItem,
                                  ),
                                  if (i ==
                                      (authVM.cart?.items?.length ?? 0 - 1))
                                    const Divider(
                                      color: AppColors.whiteF7,
                                      thickness: 2,
                                    ),
                                ],
                              );
                            },
                            separatorBuilder: (ctx, i) => const YBox(6),
                            itemCount: authVM.cart?.items?.length ?? 0,
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
                          Consumer<ProductVM>(builder: (context, productVM, _) {
                            final relatedProducts =
                                productVM.allProductList.take(2).toList();
                            return GridView.count(
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
                                for (int i = 0; i < relatedProducts.length; i++)
                                  RelatedProductCard(
                                    productName:
                                        relatedProducts[i].productName ?? '',
                                    productId: relatedProducts[i].id ?? '',
                                    unitPrice:
                                        '${relatedProducts[i].unitPrice}',
                                    productImage: (relatedProducts[i]
                                                .images
                                                ?.isNotEmpty ??
                                            false)
                                        ? relatedProducts[i].images?.first ?? ''
                                        : '',
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutePath.productDetailScreen,
                                        arguments: ProductArgs(
                                          productId:
                                              relatedProducts[i].id ?? '',
                                        ),
                                      );
                                    },
                                  ),
                              ],
                            );
                          }),
                          const YBox(48),
                          CartAmountTotal(
                            total:
                                '${AppUtils.nairaSymbol}${AppUtils.formatAmountString('${authVM.cart?.totalAmount ?? 0.0}')}',
                            btnText: 'Proceed to checkout',
                            btnOntap: () {
                              Navigator.pushNamed(
                                  context, RoutePath.checkoutScreen);
                            },
                          ),
                          const YBox(100),
                        ],
                      );
                    },
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
