import 'package:soto_ecommerce/common/common.dart';

class ProductsCategoryScreen extends StatefulWidget {
  const ProductsCategoryScreen({
    super.key,
    required this.args,
  });

  final ProductCatArg args;

  @override
  State<ProductsCategoryScreen> createState() => _ProductsCategoryScreenState();
}

class _ProductsCategoryScreenState extends State<ProductsCategoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final prodVm = context.read<ProductVM>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!prodVm.gettingMore && prodVm.hasMore && !prodVm.isBusy) {
          prodVm.getPaginatedProducts(
            categoryId: widget.args.category.id,
          );
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductVM>().getProductList(
            categoryId: widget.args.category.id,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (ctx, ref, _) {
      return Scaffold(
        backgroundColor: AppColors.bgFF,
        appBar: CustomHeader(
          title: widget.args.category.name ?? '',
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                controller: _scrollController,
                padding: EdgeInsets.only(
                  top: Sizer.height(20),
                  bottom: Sizer.height(200),
                ),
                children: [
                  Container(
                    height: Sizer.height(100),
                    padding: EdgeInsets.only(
                      left: Sizer.width(20),
                      right: Sizer.width(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Sizer.radius(8)),
                      child: MyCachedNetworkImage(
                        imageUrl: widget.args.category.image ?? '',
                        fadeInDuration: const Duration(milliseconds: 50),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: Sizer.height(100),
                      ),
                    ),
                  ),
                  const YBox(20),
                  Builder(builder: (context) {
                    if (ref.isBusy) {
                      return const ProductShimmer();
                    }

                    if (ref.allProductList.isEmpty) {
                      return EmptyListState(
                        height: 500,
                        text:
                            'No products found for ${widget.args.category.name}',
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
