import 'package:soto_ecommerce/common/common.dart';

class VendorProductActionsModal extends StatelessWidget {
  const VendorProductActionsModal({
    super.key,
    this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizer.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Sizer.width(12),
          ),
          topRight: Radius.circular(
            Sizer.width(12),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const YBox(20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "More Actions",
                  style: AppTypography.text16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: Sizer.radius(23),
                  ),
                )
              ],
            ),
          ),
          const YBox(30),
          const Divider(
            color: AppColors.whiteF7,
            thickness: 2,
          ),
          ActionListTile(
            icon: Iconsax.add_circle,
            text: "Create New Product",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutePath.addProductScreen);
            },
          ),
          const Divider(color: AppColors.whiteF7, thickness: 2),
          ActionListTile(
            icon: Iconsax.edit,
            text: "Edit Product",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(
                context,
                RoutePath.addProductScreen,
                arguments: VendorProductArgs(
                  isEdit: true,
                  product: product,
                ),
              );
            },
          ),
          const Divider(
            color: AppColors.whiteF7,
            thickness: 2,
          ),
          ActionListTile(
            icon: Iconsax.trash,
            text: "Delete Product",
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, RoutePath.addProductScreen);
            },
          ),
          const YBox(50)
        ],
      ),
    );
  }
}

class ActionListTile extends StatelessWidget {
  const ActionListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
          vertical: Sizer.height(12),
        ),
        child: Row(
          children: [
            Icon(icon),
            const XBox(14),
            Text(
              text,
              style: AppTypography.text16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
