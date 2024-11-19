import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class RelatedProductCard extends StatefulWidget {
  const RelatedProductCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.unitPrice,
    this.salesPrice,
    this.favLoading = false,
    this.onTap,
  });

  final String productName;
  final String productImage;
  final String productId;
  final String unitPrice;
  final String? salesPrice;
  final bool favLoading;
  final Function()? onTap;

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
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(8),
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
                    height: Sizer.height(160),
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
                    if (widget.salesPrice != null)
                      TextSpan(
                        text: widget.salesPrice ?? '',
                        style: AppTypography.text12.copyWith(
                            color: AppColors.textAA,
                            fontFamily: '',
                            decoration: TextDecoration.lineThrough),
                      ),
                    TextSpan(
                      text:
                          ' ${AppUtils.nairaSymbol}${AppUtils.formatAmountString(widget.unitPrice)}',
                      style: GoogleFonts.roboto(
                        color: widget.salesPrice != null
                            ? AppColors.primaryOrange
                            : AppColors.text12,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizer.text(14),
                      ),
                    ),
                  ],
                ))
              ],
            ),
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
