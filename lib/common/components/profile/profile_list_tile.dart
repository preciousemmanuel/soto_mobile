import 'package:soto_ecommerce/common/common.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.leadicon,
    this.trailWidget,
    this.textColor,
    this.onTap,
  });

  final String title;
  final dynamic leadicon;
  final Color? textColor;
  final Widget? trailWidget;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(Sizer.radius(10)),
            decoration: BoxDecoration(
              color: AppColors.orangeE8,
              borderRadius: BorderRadiusDirectional.circular(Sizer.radius(50)),
            ),
            child: leadicon is String
                ? svgHelper(
                    leadicon,
                    height: Sizer.height(20),
                    color: AppColors.primaryOrange,
                  )
                : Icon(
                    leadicon,
                    color: textColor ?? AppColors.primaryOrange,
                  ),
          ),
          const XBox(10),
          Expanded(
            child: Text(
              title,
              style: AppTypography.text16.copyWith(
                color: textColor ?? AppColors.text57,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailWidget ??
              Icon(
                Icons.arrow_forward_ios,
                size: Sizer.radius(10),
              ),
        ],
      ),
    );
  }
}
