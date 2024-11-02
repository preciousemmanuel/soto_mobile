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
          body: SafeArea(
            bottom: false,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
                vertical: Sizer.height(10),
              ),
              child: Column(
                children: [
                  const YBox(10),
                  CustomHeader(
                    title: 'Wishlist',
                    backBtn: () {},
                  ),
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
                    child: ListView.separated(
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
                            if (i == 4) const Divider(color: AppColors.whiteF7),
                          ],
                        );
                      },
                      separatorBuilder: (ctx, i) => const YBox(6),
                      itemCount: vm.wishListProduct.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
