import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/common/common.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WishlistVM>().getWishList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistVM>(
      builder: (context, vm, _) {
        printty('wishlist ${vm.wishListProduct}');
        return Scaffold(
          backgroundColor: AppColors.bgWhite,
          appBar: CustomHeader(
            title: 'Wishlist',
            backBtn: () {},
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
              vertical: Sizer.height(10),
            ),
            child: Column(
              children: [
                const YBox(10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recently Added',
                    style: AppTypography.text16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(builder: (context) {
                    if (vm.isBusy) {
                      return ListView.separated(
                        padding: EdgeInsets.only(
                          top: Sizer.height(20),
                        ),
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          return Skeletonizer(
                            enabled: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Divider(color: AppColors.whiteF7),
                                const WishlistCard(
                                    product: Product(
                                  productName: 'Gucci Product',
                                  id: '2777378388ddbdbd',
                                  unitPrice: 1200,
                                  images: [
                                    'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                                  ],
                                )),
                                if (i == 6)
                                  const Divider(color: AppColors.whiteF7),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (ctx, i) => const YBox(6),
                        itemCount: 6,
                      );
                    }
                    if (vm.wishListProduct.isEmpty) {
                      return const EmptyListState(
                        text: 'Your wishlist is empty',
                      );
                    }
                    return ListView.separated(
                      padding: EdgeInsets.only(
                        top: Sizer.height(20),
                      ),
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Divider(color: AppColors.whiteF7),
                            WishlistCard(
                              product: vm.wishListProduct[i].product,
                            ),
                            if (i == vm.wishListProduct.length - 1)
                              const Divider(color: AppColors.whiteF7),
                          ],
                        );
                      },
                      separatorBuilder: (ctx, i) => const YBox(6),
                      itemCount: vm.wishListProduct.length,
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
