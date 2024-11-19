import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/common/common.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    super.key,
    this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizer.height(90),
      // color: AppColors.red,
      // padding: EdgeInsets.symmetric(
      //   vertical: Sizer.height(8),
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Sizer.width(90),
            width: Sizer.width(90),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Sizer.width(8)),
                  child: MyCachedNetworkImage(
                    imageUrl:
                        '${product?.images?.isNotEmpty ?? false ? product?.images?.first : ''}',
                    fadeInDuration: const Duration(milliseconds: 50),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: Sizer.height(160),
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: EdgeInsets.all(Sizer.radius(2)),
                    decoration: BoxDecoration(
                      color: AppColors.bgWhite.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(Sizer.width(30)),
                    ),
                    child: Icon(
                      Iconsax.heart5,
                      color: AppColors.primaryOrange,
                      size: Sizer.radius(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const XBox(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.productName ?? '',
                  style: AppTypography.text12,
                ),
                const YBox(4),
                Row(
                  children: [
                    Skeleton.replace(
                      replacement: const Bone.circle(
                        size: 14,
                      ),
                      child: svgHelper(
                        AppSvgs.star,
                      ),
                    ),
                    const XBox(5),
                    Text(
                      '4,9',
                      style: AppTypography.text12.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.text97,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: Sizer.width(80),
                  height: Sizer.width(26),
                  decoration: BoxDecoration(
                    color: AppColors.whiteF7,
                    borderRadius: BorderRadius.circular(Sizer.width(5)),
                  ),
                  child: Center(
                    child: Text(
                      'In stock',
                      style: AppTypography.text10.copyWith(
                        color: AppColors.green7E,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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
                  ModalWrapper.showCustomDialog(
                    context,
                    child: ConfirmModal(
                      message: 'Are you sure you want to remove this item?',
                      onConfirm: () {},
                    ),
                  );
                },
                child: Icon(
                  Iconsax.trash,
                  color: AppColors.text57,
                  size: Sizer.radius(24),
                ),
              ),
              Text(
                ' ${AppUtils.nairaSymbol}${AppUtils.formatAmountString('${product?.unitPrice ?? 0.0}')}',
                style: AppTypography.text14.copyWith(
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
