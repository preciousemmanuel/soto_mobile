import 'package:soto_ecommerce/common/common.dart';

class Homeheader extends StatelessWidget {
  const Homeheader({
    super.key,
    required this.headerName,
    this.addPadding = true,
    this.headerFontSize,
    this.sellAllBtn,
  });

  final String headerName;
  final bool addPadding;
  final double? headerFontSize;
  final VoidCallback? sellAllBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: addPadding
          ? EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            )
          : EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Text(
              headerName,
              style: AppTypography.text20.copyWith(
                fontSize: headerFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (sellAllBtn != null)
            InkWell(
              onTap: sellAllBtn,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See all',
                    style: AppTypography.text12.copyWith(
                      color: AppColors.primaryOrange,
                    ),
                  ),
                  const XBox(4),
                  Icon(
                    Iconsax.arrow_right_1,
                    color: AppColors.primaryOrange,
                    size: Sizer.height(20),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
