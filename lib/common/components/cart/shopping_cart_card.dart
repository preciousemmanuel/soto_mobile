import 'package:soto_ecommerce/common/common.dart';

class ShoppingCartCard extends StatelessWidget {
  const ShoppingCartCard({
    super.key,
    this.cartItem,
  });

  final Item? cartItem;

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
                imageUrl:
                    '${cartItem?.images?.isNotEmpty ?? false ? cartItem?.images?.first : ''}',
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
                  'Qty: ${cartItem?.quantity}',
                  style: AppTypography.text12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textAA,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    AddSubtractBtn(
                      icon: Iconsax.minus,
                      onTap: () {},
                    ),
                    const XBox(16),
                    Text(
                      '1',
                      style: AppTypography.text12,
                    ),
                    const XBox(16),
                    AddSubtractBtn(
                      icon: Iconsax.add,
                      onTap: () {},
                    ),
                  ],
                )
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
                      .then((val) {
                    if (val.success) {
                      if (context.mounted) {
                        context.read<AuthUserVM>().getUserProfile();
                      }

                      FlushBarToast.fLSnackBar(
                          snackBarType: SnackBarType.success,
                          message: val.message ?? '');
                    }
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
                style: AppTypography.text16.copyWith(
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
