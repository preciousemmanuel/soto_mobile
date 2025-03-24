import 'package:soto_ecommerce/buyer/screens/dashboard/profile/modals/signup_alert_modal.dart';
import 'package:soto_ecommerce/common/common.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({
    super.key,
    this.args,
  });

  final AllProductArgs? args;

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final prodVm = context.read<ProductVM>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!prodVm.gettingMore && prodVm.hasMore && !prodVm.isBusy) {
          prodVm.getPaginatedProducts();
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductVM>().getProductList();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (ctx, ref, _) {
      return Scaffold(
        backgroundColor: AppColors.bgFF,
        appBar: const CustomHeader(
          title: 'Products',
        ),
        body: Column(
          children: [
            const YBox(10),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                controller: _scrollController,
                padding: EdgeInsets.only(
                  bottom: Sizer.height(200),
                ),
                children: [
                  Builder(builder: (context) {
                    if (ref.isBusy) {
                      return const ProductShimmer();
                    }

                    if (ref.allProductList.isEmpty) {
                      return const EmptyListState(
                        height: 500,
                        text: 'No products found',
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: Sizer.width(20),
                      mainAxisSpacing: Sizer.width(20),
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 0.62,
                      padding: EdgeInsets.only(
                        left: Sizer.width(20),
                        right: Sizer.width(20),
                      ),
                      children: [
                        for (int i = 0; i < ref.allProductList.length; i++)
                          RelatedProductCard(
                            productName:
                                ref.allProductList[i].productName ?? '',
                            productId: ref.allProductList[i].id ?? '',
                            unitPrice: '${ref.allProductList[i].unitPrice}',
                            discountPrice:
                                '${ref.allProductList[i].discountPrice ?? ''}',
                            productImage:
                                (ref.allProductList[i].images?.isNotEmpty ??
                                        false)
                                    ? ref.allProductList[i].images?.first ?? ''
                                    : '',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutePath.productDetailScreen,
                                arguments: ProductArgs(
                                  productId: ref.allProductList[i].id ?? '',
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
                                  productId: ref.allProductList[i].id ?? '',
                                  productName:
                                      ref.allProductList[i].productName ?? '',
                                  productImage:
                                      ref.allProductList[i].images?.first ?? '',
                                  unitPrice:
                                      (ref.allProductList[i].unitPrice ?? 0)
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
                  const YBox(20),
                  if (ref.busy(paginatedProductState))
                    const ProductShimmer(count: 4),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
