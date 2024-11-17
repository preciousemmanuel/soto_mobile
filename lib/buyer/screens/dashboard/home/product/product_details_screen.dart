// ignore_for_file: use_build_context_synchronously

import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

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
  ReviewsDescType _reviewsDescType = ReviewsDescType.description;

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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(20),
                    ),
                    child: Row(
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
                  ),
                  const YBox(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizer.width(20)),
                    child: const ProductReviewStat(),
                  ),
                  const YBox(16),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(20),
                      vertical: Sizer.height(8),
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grayDE,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReviewsDescTab(
                          text: 'Description',
                          isSelected:
                              _reviewsDescType == ReviewsDescType.description,
                          onTap: () {
                            _reviewsDescType = ReviewsDescType.description;
                            setState(() {});
                          },
                        ),
                        ReviewsDescTab(
                          text: 'Reviews',
                          isSelected:
                              _reviewsDescType == ReviewsDescType.review,
                          onTap: () {
                            _reviewsDescType = ReviewsDescType.review;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  const YBox(26),
                  _reviewsDescType == ReviewsDescType.description
                      ? const DescTabDetail()
                      : const ReviewsTabDetail(),
                  const YBox(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizer.width(20)),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You may the like ',
                        style: AppTypography.text16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const YBox(20),
                  const ProductsYouMayLike(),
                  const YBox(200),
                ],
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
                      handleApiResponse(
                        response: value,
                        onSuccess: () {
                          printty('addproductToCart Message: ${value.message}');
                          context.read<AuthUserVM>().getUserProfile();
                          Navigator.pushNamed(
                            context,
                            RoutePath.dashboardNavScreen,
                            arguments: DashArg(index: 2),
                          );
                        },
                      );
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
