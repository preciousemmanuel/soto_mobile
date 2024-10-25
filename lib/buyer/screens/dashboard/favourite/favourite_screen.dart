import 'package:soto_ecommerce/common/common.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        const WishlistCard(),
                        if (i == 4) const Divider(color: AppColors.whiteF7),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, i) => const YBox(6),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
