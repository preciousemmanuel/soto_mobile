import 'package:soto_ecommerce/buyer/buyer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          child: Column(
            children: [
              const YBox(20),
              Row(
                children: [
                  Text(
                    'Profile',
                    style: AppTypography.text24.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(12),
                      vertical: Sizer.height(8),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadiusDirectional.circular(
                        Sizer.radius(14),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.routing_2,
                          color: AppColors.white,
                          size: Sizer.radius(16),
                        ),
                        const XBox(4),
                        Text(
                          'Switch to vendor',
                          style: AppTypography.text12.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const YBox(20),
              Container(
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
                    Container(
                      padding: EdgeInsets.all(
                        Sizer.radius(5),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.orange5E.withOpacity(0.96),
                        borderRadius:
                            BorderRadiusDirectional.circular(Sizer.radius(50)),
                        border: Border.all(color: AppColors.primaryOrange),
                      ),
                      child: Text(
                        'PR',
                        style: AppTypography.text20.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
                    Icon(
                      Iconsax.edit_2,
                      size: Sizer.height(24),
                      color: AppColors.primaryOrange,
                    ),
                  ],
                ),
              ),
              const YBox(16),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Security',
                  style: AppTypography.text16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const YBox(10),
              DecorationContainer(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizer.width(10),
                  vertical: Sizer.height(28),
                ),
                child: Column(
                  children: [
                    ProfileListTile(
                      title: 'Change Password',
                      trailicon: Iconsax.lock,
                      onTap: () {},
                    ),
                    const YBox(20),
                    ProfileListTile(
                      title: 'Change Address',
                      trailicon: Iconsax.location,
                      onTap: () {},
                    ),
                    const YBox(20),
                    ProfileListTile(
                      title: 'Enable biometric',
                      trailicon: Iconsax.finger_cricle,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const YBox(16),
              DecorationContainer(
                onTap: () {},
                child: const ProfileListTile(
                  title: 'Payment Methods',
                  trailicon: Iconsax.card_add,
                ),
              ),
              const YBox(10),
              DecorationContainer(
                onTap: () {},
                child: const ProfileListTile(
                  title: 'Feedback',
                  trailicon: Iconsax.sms_edit,
                ),
              ),
              const YBox(10),
              DecorationContainer(
                onTap: () {
                  RouterNav.push(context, const HelpCenterScreen());
                },
                child: const ProfileListTile(
                  title: 'Help Center',
                  trailicon: AppSvgs.chatHelp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
