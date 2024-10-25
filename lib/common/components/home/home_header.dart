import 'package:soto_ecommerce/common/common.dart';

class Homeheader extends StatelessWidget {
  const Homeheader({
    super.key,
    required this.headerName,
    this.sellAllBtn,
  });

  final String headerName;
  final VoidCallback? sellAllBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: Row(
        children: [
          Text(
            headerName,
            style: AppTypography.text20.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
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
