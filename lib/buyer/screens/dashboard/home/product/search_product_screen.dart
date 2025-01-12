import 'package:soto_ecommerce/buyer/screens/dashboard/profile/modals/signup_alert_modal.dart';
import 'package:soto_ecommerce/common/common.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({
    super.key,
    this.args,
  });

  final AllProductArgs? args;

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController searchC = TextEditingController();
  FocusNode searchF = FocusNode();

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
      // if (widget.args?.isSearch == true) {
      //   searchF.requestFocus();
      // }
      context.read<ProductVM>().getProductList();
    });
  }

  @override
  void dispose() {
    searchC.dispose();
    searchF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (ctx, ref, _) {
      return Scaffold(
        backgroundColor: AppColors.bgFF,
        appBar: const CustomHeader(
          title: 'Search',
        ),
        body: Column(
          children: [
            const YBox(10),
            Padding(
              padding: EdgeInsets.only(
                left: Sizer.width(20),
                right: Sizer.width(20),
                bottom: Sizer.width(20),
                top: Sizer.width(20),
              ),
              child: CustomTextField(
                focusNode: searchF,
                controller: searchC,
                hintText: 'I’m looking for...',
                showfillColor: false,
                borderColor: AppColors.grayDE,
                prefixIcon: Icon(
                  Iconsax.search_normal_1,
                  color: AppColors.iconC4,
                  size: Sizer.height(20),
                ),
                showSuffixIcon: true,

                suffixIcon: InkWell(
                  onTap: () {
                    ModalWrapper.bottomSheet(
                      context: context,
                      widget: const ProductFilterModal(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: svgHelper(AppSvgs.filter),
                  ),
                ),
                // controller: vm.passwordC,
                onChanged: (val) {},
                onSubmitted: (val) {
                  ref.getProductList(productName: val);
                },
              ),
            ),
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
                      childAspectRatio: 0.64,
                      padding: EdgeInsets.only(
                        left: Sizer.width(20),
                        right: Sizer.width(20),
                      ),
                      children: [
                        for (int i = 0; i < ref.allProductList.length; i++)
                          RelatedProductCard(
                            showAddToCartBtn: true,
                            productName:
                                ref.allProductList[i].productName ?? '',
                            productId: ref.allProductList[i].id ?? '',
                            unitPrice: '${ref.allProductList[i].unitPrice}',
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
