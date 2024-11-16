import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/buyer/screens/dashboard/home/product/product_details_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductVM>().getProductList();
    });
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
          const YBox(40),
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
