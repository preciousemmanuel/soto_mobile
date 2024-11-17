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
  TextEditingController searchC = TextEditingController();
  FocusNode searchF = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.args?.isSearch == true) {
        searchF.requestFocus();
      }
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
    return Scaffold(
      backgroundColor: AppColors.bgFF,
      appBar: const CustomHeader(
        title: 'Products',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const YBox(30),
          if (widget.args?.isSearch == true)
            Padding(
              padding: EdgeInsets.only(
                left: Sizer.width(20),
                right: Sizer.width(20),
                bottom: Sizer.width(20),
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
                onSubmitted: (p0) {},
              ),
            ),
          Consumer<ProductVM>(builder: (context, ref, _) {
            if (ref.isBusy) {
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
                  for (int i = 0; i < 10; i++)
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
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              children: [
                for (int i = 0; i < ref.allProductList.length; i++)
                  RelatedProductCard(
                    productName: ref.allProductList[i].productName ?? '',
                    productId: ref.allProductList[i].id ?? '',
                    unitPrice: '${ref.allProductList[i].unitPrice}',
                    productImage:
                        (ref.allProductList[i].images?.isNotEmpty ?? false)
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
        ],
      ),
    );
  }
}
