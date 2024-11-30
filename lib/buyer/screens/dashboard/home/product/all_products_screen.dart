import 'package:skeletonizer/skeletonizer.dart';
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
          title: 'Products',
        ),
        body: Column(
          children: [
            const YBox(10),
            if (widget.args?.isSearch == true)
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
                      childAspectRatio: 0.74,
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

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    super.key,
    this.count = 10,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
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
        for (int i = 0; i < count; i++)
          const Skeletonizer(
            enabled: true,
            child: RelatedProductCard(
              productName: 'Gucci Product',
              productId: '2777378388ddbdbd',
              unitPrice: '1000',
              productImage:
                  'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
              onTap: null,
            ),
          ),
      ],
    );
  }
}
