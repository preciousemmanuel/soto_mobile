import 'package:soto_ecommerce/common/common.dart';

class MyProfileAreaCard extends StatelessWidget {
  const MyProfileAreaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(builder: (context, vm, _) {
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
            ProfileAvatar(
              initials: getFullNamesInitails(vm.fullname, '').toUpperCase(),
            ),
            const XBox(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vm.fullname,
                    style: AppTypography.text20.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${vm.authUser?.email}',
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
                      color: vm.authUser?.isVerified == true
                          ? AppColors.green98.withOpacity(0.2)
                          : AppColors.red6C.withOpacity(0.1),
                      borderRadius: BorderRadiusDirectional.circular(
                        Sizer.radius(4),
                      ),
                    ),
                    child: Text(
                      vm.authUser?.isVerified == true
                          ? 'Verified'
                          : 'Not Verified',
                      style: AppTypography.text10.copyWith(
                        color: vm.authUser?.isVerified == true
                            ? AppColors.green59
                            : AppColors.red6C,
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
    });
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.width,
    this.height,
    required this.initials,
  });

  final double? width;
  final double? height;
  final dynamic initials;

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
        child: initials is String
            ? Text(
                initials,
                style: AppTypography.text20.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            : initials,
      ),
    );
  }
}
