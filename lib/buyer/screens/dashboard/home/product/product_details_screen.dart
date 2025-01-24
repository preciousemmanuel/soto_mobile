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
  final _pageController = PageController(initialPage: 0);

  ProductData? _singleProduct;
  ReviewsDescType _reviewsDescType = ReviewsDescType.description;

  int _productQty = 1;
  int _currentPageIndex = 0;

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
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (context, vm, _) {
      printty("singleProduct images $_singleProduct");
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
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _singleProduct?.product?.images?.length ?? 0,
                      onPageChanged: (v) {
                        _currentPageIndex = v;
                        setState(() {});
                      },
                      itemBuilder: (context, index) {
                        return MyCachedNetworkImage(
                          imageUrl:
                              _singleProduct?.product?.images?[index] ?? '',
                          fadeInDuration: const Duration(milliseconds: 50),
                          width: MediaQuery.of(context).size.width,
                          height: Sizer.height(160),
                        );
                      },
                    ),
                  ),
                  if ((_singleProduct?.product?.images?.length ?? 0) > 1)
                    Positioned(
                      bottom: 60,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _singleProduct?.product?.images?.length ?? 0,
                          (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: _currentPageIndex == index ? 30 : 10,
                              height: 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: Sizer.width(4)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _currentPageIndex == index
                                    ? AppColors.primaryOrange
                                    : AppColors.text60,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  Positioned(
                    top: Sizer.height(60),
                    left: Sizer.width(20),
                    child: GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const ArrowBackBtn(
                        svgPath: AppSvgs.arrowLeft,
                        color: AppColors.primaryOrange,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: Sizer.height(26),
                      decoration: BoxDecoration(
                        color: AppColors.bgWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Sizer.width(24)),
                          topRight: Radius.circular(Sizer.width(24)),
                        ),
                      ),
                    ),
                  ),
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
                                _singleProduct?.product?.productName ?? '',
                                style: AppTypography.text16.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text3E,
                                ),
                              ),
                              const YBox(4),
                              Text(
                                ' N${AppUtils.formatAmountString(_singleProduct?.product?.unitPrice.toString() ?? '')}',
                                style: AppTypography.text24.copyWith(
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            AddSubtractBtn(
                              icon: Iconsax.minus,
                              onTap: () {
                                if (_productQty > 1) {
                                  _productQty--;
                                }
                                setState(() {});
                              },
                            ),
                            const XBox(16),
                            Text(
                              '$_productQty',
                              style: AppTypography.text12,
                            ),
                            const XBox(16),
                            AddSubtractBtn(
                              icon: Iconsax.add,
                              onTap: () {
                                _productQty++;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const YBox(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizer.width(20)),
                    child: ProductReviewStat(
                      rating: _singleProduct?.product?.rating,
                      reviewCount: _singleProduct?.reviews?.length ?? 0,
                    ),
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
                      ? DescTabDetail(
                          desc: _singleProduct?.product?.description,
                        )
                      : ReviewsTabDetail(
                          reviews: _singleProduct?.reviews ?? []),
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

                    if (_singleProduct?.product?.inStock == false) {
                      FlushBarToast.fLSnackBar(
                        snackBarType: SnackBarType.success,
                        message: 'Product is out of stock',
                      );
                      return;
                    }

                    orderVM
                        .addproductToCart(
                      product: ProductCart(
                        productId: _singleProduct?.product?.id ?? '',
                        productName: _singleProduct?.product?.productName ?? '',
                        productImage:
                            _singleProduct?.product?.images?.first ?? '',
                        unitPrice: (_singleProduct?.product?.unitPrice ?? 0)
                            .toDouble(),
                        qty: _productQty,
                      ),
                    )
                        .then((_) {
                      orderVM.getCartFromStorage();

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
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
