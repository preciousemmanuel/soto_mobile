import 'package:soto_ecommerce/common/common.dart';

class ProductsYouMayLike extends StatelessWidget {
  const ProductsYouMayLike({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (context, vm, _) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizer.width(20)),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: Sizer.width(20),
          mainAxisSpacing: Sizer.width(20),
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          childAspectRatio: 0.75,
          children: [
            for (int i = 0; i < 4; i++)
              RelatedProductCard(
                productName: vm.allProductList[i].productName ?? '',
                productId: vm.allProductList[i].id ?? '',
                unitPrice: '${vm.allProductList[i].unitPrice}',
                productImage: (vm.allProductList[i].images?.isNotEmpty ?? false)
                    ? vm.allProductList[i].images?.first ?? ''
                    : '',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.productDetailScreen,
                    arguments: ProductArgs(
                      productId: vm.allProductList[i].id ?? '',
                    ),
                  );
                },
              ),
          ],
        ),
      );
    });
  }
}
