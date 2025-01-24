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
          childAspectRatio: 0.64,
          children: [
            for (int i = 0; i < 4; i++)
              RelatedProductCard(
                outOfStock: vm.allProductList[i].inStock == false,
                productName: vm.allProductList[i].productName ?? '',
                productId: vm.allProductList[i].id ?? '',
                unitPrice: '${vm.allProductList[i].unitPrice}',
                discountPrice: '${vm.allProductList[i].discountPrice ?? ''}',
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
                onAddToCartTap: () {
                  final orderVm = context.read<OrderVM>();

                  if (vm.allProductList[i].inStock == false) {
                    FlushBarToast.fLSnackBar(
                      snackBarType: SnackBarType.success,
                      message: 'Product is out of stock',
                    );
                    return;
                  }
                  orderVm
                      .addproductToCart(
                    product: ProductCart(
                      productId: vm.allProductList[i].id ?? '',
                      productName: vm.allProductList[i].productName ?? '',
                      productImage: vm.allProductList[i].images?.first ?? '',
                      unitPrice:
                          (vm.allProductList[i].unitPrice ?? 0).toDouble(),
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
        ),
      );
    });
  }
}
