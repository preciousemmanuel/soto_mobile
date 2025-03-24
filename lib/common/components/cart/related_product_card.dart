import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class RelatedProductCard extends StatefulWidget {
  const RelatedProductCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.unitPrice,
    this.favLoading = false,
    this.showAddToCartBtn = false,
    this.outOfStock = false,
    this.percentDiscount,
    this.discountPrice,
    this.onAddToCartTap,
    this.onTap,
  });

  final String productName;
  final String productImage;
  final String productId;
  final String unitPrice;
  final bool favLoading;
  final bool showAddToCartBtn;
  final bool outOfStock;
  final String? percentDiscount;
  final String? discountPrice;
  final Function()? onTap;
  final Function()? onAddToCartTap;

  @override
  State<RelatedProductCard> createState() => _RelatedProductCardState();
}

class _RelatedProductCardState extends State<RelatedProductCard> {
  String currentProductId = "";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: Sizer.width(8),
          right: Sizer.width(8),
          bottom: Sizer.height(8),
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Sizer.radius(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 5),
              )
            ]),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Sizer.radius(8)),
                  child: MyCachedNetworkImage(
                    imageUrl: widget.productImage,
                    fadeInDuration: const Duration(milliseconds: 50),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: Sizer.height(150),
                  ),
                ),
                const YBox(8),
                Text(
                  widget.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.text12.copyWith(
                    color: AppColors.textAA,
                  ),
                ),
                const YBox(4),
                RichText(
                    text: TextSpan(
                  children: [
                    if (widget.discountPrice != null &&
                        widget.discountPrice != '')
                      TextSpan(
                        text: widget.discountPrice ?? '',
                        style: AppTypography.text12.copyWith(
                            color: AppColors.textAA,
                            fontFamily: '',
                            decoration: TextDecoration.lineThrough),
                      ),
                    if (widget.discountPrice != null &&
                        widget.discountPrice != '')
                      const TextSpan(
                        text: ' ',
                      ),
                    TextSpan(
                      text:
                          ' ${AppUtils.nairaSymbol}${AppUtils.formatAmountString(widget.unitPrice)}',
                      style: GoogleFonts.roboto(
                        color: widget.discountPrice != null &&
                                widget.discountPrice != ''
                            ? AppColors.primaryOrange
                            : AppColors.text12,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizer.text(14),
                      ),
                    ),
                  ],
                )),
                const Spacer(),
                CustomBtn.solid(
                  // online:
                  isOutline: true,
                  textColor: AppColors.primaryOrange,
                  height: Sizer.height(40),
                  onTap: widget.onAddToCartTap,
                  text: "Add to cart",
                ),
              ],
            ),
            (widget.outOfStock ||
                    (widget.percentDiscount != null &&
                        widget.percentDiscount != ''))
                ? Positioned(
                    left: -10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizer.width(8),
                          vertical: Sizer.height(4)),
                      decoration: BoxDecoration(
                        color: widget.outOfStock
                            ? AppColors.orange5E
                            : AppColors.primaryOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Sizer.radius(8)),
                          topRight: Radius.circular(Sizer.radius(8)),
                        ),
                      ),
                      child: Text(
                        'Out of stock',
                        style: AppTypography.text12.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Positioned(
              right: 8,
              top: 10,
              child: Consumer<WishlistVM>(builder: (context, ref, _) {
                return InkWell(
                  onTap: () {
                    currentProductId = widget.productId;

                    ref.addToWishList(widget.productId).then((value) {
                      if (value.success) {
                        FlushBarToast.fLSnackBar(
                            snackBarType: SnackBarType.success,
                            message:
                                value.message ?? 'Product added to wish list');
                        ref.getWishList();
                      }
                    });
                  },
                  child: Container(
                    height: Sizer.height(30),
                    width: Sizer.width(30),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(Sizer.radius(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 5),
                          )
                        ]),
                    child: ref.isBusy && currentProductId == widget.productId
                        ? Padding(
                            padding: EdgeInsets.all(Sizer.radius(3)),
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primaryOrange,
                            ),
                          )
                        : Icon(
                            Iconsax.heart,
                            // color: AppColors.primaryOrange,
                            size: Sizer.radius(16),
                          ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
