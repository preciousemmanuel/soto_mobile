import 'package:soto_ecommerce/buyer/screens/dashboard/profile/modals/signup_alert_modal.dart';
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
          show: vm.isBusy,
          child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            appBar: CustomHeader(
              title: 'Shopping Cart',
              showBackBtn: ModalRoute.of(context)!.canPop,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<AuthUserVM>().getUserProfile();
              },
              child: ListView(
                children: [
                  Builder(
                    builder: (context) {
                      if (vm.cartItems.isEmpty) {
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
                              final cartItem = vm.cartItems[i];
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
                                  if (i == (vm.cartItems.length - 1))
                                    const Divider(
                                      color: AppColors.whiteF7,
                                      thickness: 2,
                                    ),
                                ],
                              );
                            },
                            separatorBuilder: (ctx, i) => const YBox(6),
                            itemCount: vm.cartItems.length,
                          ),
                          const YBox(20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizer.width(20),
                            ),
                            child: CustomBtn.solid(
                              isOutline: true,
                              height: Sizer.height(50),
                              borderRadius: BorderRadius.circular(
                                Sizer.radius(100),
                              ),
                              text: "Continue Shopping",
                              textColor: AppColors.primaryOrange,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePath.allProductsScreen);
                              },
                            ),
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
                              childAspectRatio: 0.64,
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
                                    onAddToCartTap: () {
                                      final orderVm = context.read<OrderVM>();
                                      final userVm = context.read<AuthUserVM>();
                                      if (userVm.authUser == null) {
                                        return ModalWrapper.showCustomDialog(
                                          context,
                                          child: const SignupAlertModal(),
                                        );
                                      }

                                      orderVm
                                          .addproductToCart(
                                        product: ProductCart(
                                          productId:
                                              productVM.allProductList[i].id ??
                                                  '',
                                          productName: productVM
                                                  .allProductList[i]
                                                  .productName ??
                                              '',
                                          productImage: productVM
                                                  .allProductList[i]
                                                  .images
                                                  ?.first ??
                                              '',
                                          unitPrice: (productVM
                                                      .allProductList[i]
                                                      .unitPrice ??
                                                  0)
                                              .toDouble(),
                                          qty: 1,
                                        ),
                                      )
                                          .then((_) {
                                        orderVm.getCartFromStorage();

                                        FlushBarToast.fLSnackBar(
                                          snackBarType: SnackBarType.success,
                                          message: 'Product added to cart',
                                          actionText: 'Go to cart',
                                          onActionTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RoutePath.dashboardNavScreen,
                                              arguments: DashArg(index: 2),
                                            );
                                          },
                                        );
                                      });
                                    },
                                  ),
                              ],
                            );
                          }),
                          const YBox(60),
                          CartAmountTotal(
                            total:
                                '${AppUtils.nairaSymbol}${AppUtils.formatAmountString('${vm.cartTotalAmount}')}',
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
