import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class OrderDetailsTile extends StatelessWidget {
  const OrderDetailsTile({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productAmt,
    this.productQty,
    this.onTap,
  });

  final String productName;
  final String productImage;
  final String productAmt;
  final String? productQty;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: Sizer.height(4),
            ),
            height: Sizer.height(60),
            width: Sizer.width(60),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizer.radius(8)),
              child: MyCachedNetworkImage(
                imageUrl: productImage,
                fadeInDuration: const Duration(milliseconds: 50),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          const XBox(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.text14.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const YBox(4),
              Text(
                '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(
                  (productAmt).toString(),
                )}',
                style: GoogleFonts.roboto(
                  fontSize: Sizer.text(12),
                  color: AppColors.black66,
                ),
              ),
              const YBox(4),
              Text(
                'Qty: $productQty',
                style: AppTypography.text10.copyWith(
                  color: AppColors.text57,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
