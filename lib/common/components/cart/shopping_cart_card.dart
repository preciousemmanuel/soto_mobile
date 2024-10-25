import 'package:soto_ecommerce/common/common.dart';

class ShoppingCartCard extends StatelessWidget {
  const ShoppingCartCard({
    super.key,
  });

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
              child: imageHelper(
                AppImages.product,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const XBox(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wooden chair',
                  style: AppTypography.text12,
                ),
                const YBox(4),
                Text(
                  'Qty: 1',
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
              Icon(
                Iconsax.close_circle,
                color: AppColors.text57,
                size: Sizer.radius(24),
              ),
              Text(
                'N150.00',
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

class AddSubtractBtn extends StatelessWidget {
  const AddSubtractBtn({
    super.key,
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizer.radius(6)),
            border: Border.all(
              color: AppColors.primaryOrange,
              width: 1.5,
            )),
        child: Icon(
          icon,
          size: Sizer.radius(20),
          color: AppColors.primaryOrange,
        ),
      ),
    );
  }
}
