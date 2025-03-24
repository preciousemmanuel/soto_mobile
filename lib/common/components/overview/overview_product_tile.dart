import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class OverviewProductTile extends StatelessWidget {
  const OverviewProductTile({
    super.key,
    this.product,
    this.onTap,
  });

  final Product? product;
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
                imageUrl:
                    '${product?.images?.isNotEmpty ?? false ? product?.images?.first : ''}',
                fadeInDuration: const Duration(milliseconds: 50),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          const XBox(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.productName ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.text12.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const YBox(4),
                Text(
                  '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(
                    (product?.rawPrice ?? 0).toString(),
                  )}',
                  style: GoogleFonts.roboto(
                    fontSize: Sizer.text(12),
                    color: AppColors.black66,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Qty: ${product?.productQuantity ?? 0}',
                style: AppTypography.text10.copyWith(
                  color: AppColors.text57,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(10),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizer.width(10),
                  vertical: Sizer.height(2),
                ),
                decoration: BoxDecoration(
                  color: AppColors.orangeE3,
                  borderRadius: BorderRadius.circular(Sizer.radius(4)),
                ),
                child: Text(
                  product?.status ?? '',
                  style: AppTypography.text10.copyWith(
                    color: AppColors.primaryOrange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
