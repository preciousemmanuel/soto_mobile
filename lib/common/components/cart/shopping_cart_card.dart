import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class ShoppingCartCard extends StatelessWidget {
  const ShoppingCartCard({
    super.key,
    this.cartItem,
  });

  final ProductCart? cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizer.height(84),
      // color: AppColors.red,
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.height(20),
      ),
      margin: EdgeInsets.symmetric(
        vertical: Sizer.height(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Sizer.width(84),
            width: Sizer.width(84),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizer.width(8)),
              child: MyCachedNetworkImage(
                imageUrl: cartItem?.productImage ?? '',
                fadeInDuration: const Duration(milliseconds: 50),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          const XBox(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem?.productName ?? '',
                  style: AppTypography.text12,
                ),
                const YBox(4),
                Text(
                  'Qty: ${cartItem?.qty ?? 0}',
                  style: AppTypography.text12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textAA,
                  ),
                ),
                const Spacer(),
                Consumer<OrderVM>(builder: (context, ref, _) {
                  return Row(
                    children: [
                      AddSubtractBtn(
                        icon: Iconsax.minus,
                        onTap: () {
                          ref.decreaseCartQty(cartItem?.productId ?? '');
                        },
                      ),
                      const XBox(16),
                      Text(
                        '${cartItem?.qty ?? 0}',
                        style: AppTypography.text12,
                      ),
                      const XBox(16),
                      AddSubtractBtn(
                        icon: Iconsax.add,
                        onTap: () {
                          ref.increaseCartQty(cartItem?.productId ?? '');
                        },
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
          const XBox(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<OrderVM>()
                      .removeProductFromCart(cartItem?.productId ?? '')
                      .then((_) {
                    FlushBarToast.fLSnackBar(
                        snackBarType: SnackBarType.success,
                        message: ' Item removed from cart');
                  });
                },
                child: Icon(
                  Iconsax.close_circle,
                  color: AppColors.text57,
                  size: Sizer.radius(24),
                ),
              ),
              Text(
                '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(cartItem?.unitPrice.toString() ?? '0.00')}',
                style: GoogleFonts.roboto(
                  fontSize: Sizer.text(16),
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
