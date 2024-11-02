import 'package:soto_ecommerce/common/common.dart';

class RelatedProductCard extends StatelessWidget {
  const RelatedProductCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.unitPrice,
    this.salesPrice,
    this.onTap,
  });

  final String productName;
  final String productImage;
  final String productId;
  final String unitPrice;
  final String? salesPrice;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                    imageUrl: productImage,
                    fadeInDuration: const Duration(milliseconds: 50),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: Sizer.height(160),
                  ),
                ),
                const YBox(8),
                Text(
                  productName,
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
                    if (salesPrice != null)
                      TextSpan(
                        text: salesPrice ?? '',
                        style: AppTypography.text12.copyWith(
                            color: AppColors.textAA,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.lineThrough),
                      ),
                    TextSpan(
                      text:
                          ' ${AppUtils.nairaSymbol}${AppUtils.formatAmountString(unitPrice)}',
                      style: AppTypography.text14.copyWith(
                        color: salesPrice != null
                            ? AppColors.primaryOrange
                            : AppColors.text12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
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
                    ref.addToWishList(productId).then((value) {
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
                    child: Icon(
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
