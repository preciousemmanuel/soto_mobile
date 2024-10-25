import 'package:soto_ecommerce/common/common.dart';

class MyProfileAreaCard extends StatelessWidget {
  const MyProfileAreaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(13),
        vertical: Sizer.height(15),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange.withOpacity(0.1),
        borderRadius: BorderRadiusDirectional.circular(
          Sizer.radius(14),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAvatar(),
          const XBox(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Precious Ruchi',
                  style: AppTypography.text20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'preciousruchi001@gmail.com',
                  style: AppTypography.text12.copyWith(
                    color: AppColors.text7D,
                  ),
                ),
                const YBox(10),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizer.width(10),
                    vertical: Sizer.height(4),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.green98.withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.circular(
                      Sizer.radius(4),
                    ),
                  ),
                  child: Text(
                    'Verified',
                    style: AppTypography.text10.copyWith(
                      color: AppColors.green59,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutePath.editMyProfileScreen);
            },
            child: Icon(
              Iconsax.edit_2,
              size: Sizer.height(24),
              color: AppColors.primaryOrange,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.width,
    this.height,
    this.avatar,
  });

  final double? width;
  final double? height;
  final dynamic avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizer.width(width ?? 40),
      height: Sizer.height(height ?? 40),
      decoration: BoxDecoration(
        color: AppColors.orange5E.withOpacity(0.96),
        borderRadius: BorderRadiusDirectional.circular(Sizer.radius(100)),
        border: Border.all(color: AppColors.primaryOrange),
      ),
      child: Center(
        child: avatar ??
            Text(
              'PR',
              style: AppTypography.text20.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );
  }
}
