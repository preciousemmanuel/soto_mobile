import 'package:soto_ecommerce/buyer/core/core.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.trailicon,
    this.onTap,
  });

  final String title;
  final dynamic trailicon;
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
            child: trailicon is String
                ? svgHelper(
                    trailicon,
                    height: Sizer.height(20),
                    color: AppColors.primaryOrange,
                  )
                : Icon(
                    trailicon,
                    color: AppColors.primaryOrange,
                  ),
          ),
          const XBox(10),
          Expanded(
            child: Text(
              title,
              style: AppTypography.text16.copyWith(
                color: AppColors.text57,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: Sizer.radius(10),
          ),
        ],
      ),
    );
  }
}
