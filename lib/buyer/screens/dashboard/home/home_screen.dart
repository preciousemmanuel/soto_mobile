import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/common/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
    super.initState();
  }

  _init() {
    context.read<ProductVM>()
      ..getCategories()
      ..getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YBox(20),
              const HomeNotificationHeader(),
              const YBox(26),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizer.width(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: CustomTextField(
                        hintText: 'I’m looking for...',
                        showfillColor: false,
                        borderColor: AppColors.grayDE,
                        prefixIcon: Icon(
                          Iconsax.search_normal_1,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        showSuffixIcon: true,
                        isReadOnly: true,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutePath.allProductsScreen,
                              arguments: AllProductArgs(isSearch: true));
                        },
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(8),
                          child: svgHelper(AppSvgs.filter),
                        ),
                        // controller: vm.passwordC,
                        onChanged: (val) {},
                        onSubmitted: (p0) {},
                      ),
                    ),
                    const XBox(12),
                    Expanded(
                      flex: 3,
                      child: CustomBtn.withChild(
                        borderRadius: BorderRadius.circular(14),
                        online: true,
                        height: 44,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.edit_2,
                              size: Sizer.height(20),
                              color: AppColors.white,
                            ),
                            const XBox(8),
                            Text(
                              'Custom',
                              style: AppTypography.text12.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutePath.createOrderScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const YBox(20),
              const Homeheader(
                headerName: 'Categories',
              ),
              const YBox(12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Consumer<ProductVM>(builder: (context, ref, _) {
                  if (ref.isBusy) {
                    return Row(
                      children: List.generate(
                        4,
                        (i) {
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              margin: EdgeInsets.only(
                                right: Sizer.width(8),
                                left: i == 0 ? Sizer.width(20) : 0,
                              ),
                              child: Skeleton.replace(
                                replacement: Bone(
                                  width: Sizer.width(125),
                                  height: Sizer.height(56),
                                  uniRadius: 10,
                                ),
                                child: const SizedBox(),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Row(
                    children: [
                      ...List.generate(
                        ref.productCategories.length,
                        (i) => ClipRRect(
                          borderRadius: BorderRadius.circular(Sizer.radius(8)),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: Sizer.width(12),
                              right: Sizer.width(12),
                              // top: Sizer.height(18),
                            ),
                            margin: EdgeInsets.only(
                              right: Sizer.width(8),
                              left: i == 0 ? Sizer.width(20) : 0,
                            ),
                            width: Sizer.width(125),
                            height: Sizer.height(56),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Sizer.radius(8)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: ref.productCategories[i].image == null
                                      ? const AssetImage(AppImages.noImage)
                                      : NetworkImage(
                                          ref.productCategories[i].image ?? '',
                                        )),
                            ),
                            child: Center(
                              child: Text(
                                ref.productCategories[i].name ?? '',
                                style: AppTypography.text12.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
              const YBox(26),
              SizedBox(
                height: Sizer.height(160),
                child: Swiper(
                  autoplay: true,
                  autoplayDisableOnInteraction: true,
                  autoplayDelay: 5000,
                  duration: 1000,
                  itemBuilder: (BuildContext context, int i) {
                    return Skeletonizer(
                      enabled: context.watch<ProductVM>().isBusy,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Sizer.width(20),
                          right: Sizer.width(20),
                        ),
                        decoration: BoxDecoration(
                          // color: AppColors.gray400,
                          borderRadius: BorderRadius.circular(Sizer.radius(8)),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.banner),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                  onIndexChanged: (index) {},
                ),
              ),
              const YBox(20),
              Homeheader(
                headerName: 'Popular',
                sellAllBtn: () {
                  Navigator.pushNamed(context, RoutePath.allProductsScreen);
                },
              ),
              const YBox(12),
              Consumer<ProductVM>(
                builder: (context, vm, _) {
                  if (vm.isBusy) {
                    return GridView.custom(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        left: Sizer.width(20),
                      ),
                      gridDelegate: SliverStairedGridDelegate(
                        crossAxisSpacing: Sizer.width(20),
                        mainAxisSpacing: Sizer.width(20),
                        pattern: [
                          const StairedGridTile(0.5, 0.74),
                          const StairedGridTile(0.5, 0.74),
                        ],
                      ),
                      childrenDelegate:
                          SliverChildBuilderDelegate((context, index) {
                        return const Skeletonizer(
                          enabled: true,
                          child: RelatedProductCard(
                            productName: 'Gucci Product',
                            productId: '2777378388ddbdbd',
                            unitPrice: '1000',
                            productImage:
                                'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                            onTap: null,
                          ),
                        );
                      }, childCount: 6),
                    );
                  }
                  return GridView.custom(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: Sizer.width(20),
                    ),
                    gridDelegate: SliverStairedGridDelegate(
                      crossAxisSpacing: Sizer.width(20),
                      mainAxisSpacing: Sizer.width(20),
                      pattern: [
                        const StairedGridTile(0.5, 0.74),
                        const StairedGridTile(0.5, 0.74),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (vm.isBusy) {
                          return const Skeletonizer(
                            enabled: true,
                            child: RelatedProductCard(
                              productName: 'Gucci Product',
                              productId: '2777378388ddbdbd',
                              unitPrice: '1000',
                              productImage:
                                  'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                              onTap: null,
                            ),
                          );
                        }
                        return RelatedProductCard(
                          productName:
                              vm.allProductList[index].productName ?? '',
                          productId: vm.allProductList[index].id ?? '',
                          unitPrice: '${vm.allProductList[index].unitPrice}',
                          productImage:
                              (vm.allProductList[index].images?.isNotEmpty ??
                                      false)
                                  ? vm.allProductList[index].images?.first ?? ''
                                  : '',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutePath.productDetailScreen,
                              arguments: ProductArgs(
                                productId: vm.allProductList[index].id ?? '',
                              ),
                            );
                          },
                        );
                      },
                      childCount: vm.allProductList.length,
                    ),
                  );
                },
              ),
              const YBox(30),
              const BestSellerWidget(),
              const YBox(100),
            ],
          ),
        ),
      ),
    );
  }
}
