// ignore_for_file: use_build_context_synchronously

import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class ProductArgs {
  final String productId;
  ProductArgs({required this.productId});
}

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.args,
  });

  final ProductArgs args;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Product? _singleProduct;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  _init() {
    context
        .read<ProductVM>()
        .fetchSingleProduct(productId: widget.args.productId)
        .then((value) {
      if (value.success) {
        _singleProduct = value.data;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (context, vm, _) {
      // printty("singleProduct images ${vm.singleProduct?.images}");
      return BusyOverlay(
        show: vm.isBusy,
        child: Scaffold(
          backgroundColor: AppColors.bgWhite,
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: Sizer.height(340),
                    width: Sizer.screenWidth,
                    child: MyCachedNetworkImage(
                      imageUrl: (_singleProduct?.images?.isNotEmpty ?? false)
                          ? (_singleProduct?.images?.first ?? '')
                          : '',
                      fadeInDuration: const Duration(milliseconds: 50),
                      // fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: Sizer.height(160),
                    ),
                  ),
                  Positioned(
                    top: Sizer.height(60),
                    left: Sizer.width(20),
                    child: const ArrowBackBtn(
                      svgPath: AppSvgs.arrowLeft,
                      color: AppColors.primaryOrange,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: Sizer.height(26),
                        // width: Sizer.screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.bgWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizer.width(24)),
                            topRight: Radius.circular(Sizer.width(24)),
                          ),
                        ),
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizer.width(20),
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Sizer.width(24)),
                    topRight: Radius.circular(Sizer.width(24)),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _singleProduct?.productName ?? '',
                                style: AppTypography.text16.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text3E,
                                ),
                              ),
                              const YBox(4),
                              Text(
                                ' N${AppUtils.formatAmountString(_singleProduct?.unitPrice.toString() ?? '')}',
                                style: AppTypography.text24.copyWith(
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Consumer<OrderVM>(
                          builder: (context, orderVM, _) {
                            return Row(
                              children: [
                                AddSubtractBtn(
                                  icon: Iconsax.minus,
                                  onTap: () {
                                    if (orderVM.productQty > 1) {
                                      orderVM.setProductQty(
                                          orderVM.productQty - 1);
                                    }
                                  },
                                ),
                                const XBox(16),
                                Text(
                                  '${orderVM.productQty}',
                                  style: AppTypography.text12,
                                ),
                                const XBox(16),
                                AddSubtractBtn(
                                  icon: Iconsax.add,
                                  onTap: () {
                                    orderVM
                                        .setProductQty(orderVM.productQty + 1);
                                  },
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                    const YBox(20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizer.width(16),
                        vertical: Sizer.height(16),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grayF1,
                        borderRadius: BorderRadius.circular(Sizer.radius(8)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ...List.generate(
                                      5,
                                      (i) => CustomRating(
                                        isActive: i < 4,
                                      ),
                                    ),
                                    const XBox(8),
                                    Text(
                                      '4.8',
                                      style: AppTypography.text12.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const YBox(4),
                                Row(
                                  children: [
                                    Text(
                                      '53 Reviews',
                                      style: AppTypography.text12.copyWith(
                                        color: AppColors.textAA,
                                      ),
                                    ),
                                    const XBox(4),
                                    Icon(
                                      Icons.chevron_right,
                                      color: AppColors.textAA,
                                      size: Sizer.height(16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Sizer.height(30),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const CustomAvatar(),
                                ...List.generate(
                                  4,
                                  (index) => Positioned(
                                    left: -15 * (index + 1),
                                    child: const CustomAvatar(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const YBox(26),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You may the like ',
                        style: AppTypography.text16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const YBox(20),
                    GridView.count(
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
                            productImage:
                                (vm.allProductList[i].images?.isNotEmpty ??
                                        false)
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
                    const YBox(200),
                  ],
                ),
              )
            ],
          ),
          bottomSheet: Container(
            padding: EdgeInsets.only(
              left: Sizer.width(20),
              right: Sizer.width(20),
              bottom: Sizer.height(30),
              top: Sizer.height(10),
            ),
            // height: Sizer.height(92),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(
                  color: AppColors.grayDE,
                  width: 2,
                ),
              ),
            ),
            child: Consumer<OrderVM>(
              builder: (context, orderVM, _) {
                return CustomBtn.solid(
                  text: "Add to Cart",
                  isLoading: orderVM.isBusy,
                  height: 50,
                  borderRadius: BorderRadius.circular(Sizer.radius(50)),
                  onTap: () {
                    if (context.read<AuthUserVM>().authUser == null) {
                      return ModalWrapper.showCustomDialog(
                        context,
                        child: const SignupAlertModal(),
                      );
                    }

                    orderVM.addproductToCart(items: [
                      ProductCart(
                        productId: _singleProduct?.id ?? '',
                        qty: orderVM.productQty,
                      )
                    ]).then((value) {
                      if (value.success) {
                        printty('addproductToCart Message: ${value.message}');
                        context.read<AuthUserVM>().getUserProfile();
                        Navigator.pushNamed(
                          context,
                          RoutePath.dashboardNavScreen,
                          arguments: DashArg(index: 2),
                        );
                        FlushBarToast.fLSnackBar(
                            snackBarType: SnackBarType.success,
                            message: value.message ?? 'Product added to cart');
                      } else {
                        FlushBarToast.fLSnackBar(
                            message: value.message ?? "Something went wrong");
                      }
                    });
                  },
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
