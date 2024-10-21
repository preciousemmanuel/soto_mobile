import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: Sizer.screenWidth,
          height: Sizer.screenHeight,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
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
              const MyProfileAreaCard(),
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
                      onTap: () {
                        RouterNav.push(
                            context,
                            const ForgotPasswordScreen(
                              isChangePassword: true,
                            ));
                      },
                    ),
                    const YBox(20),
                    ProfileListTile(
                      title: 'Change Address',
                      trailicon: Iconsax.location,
                      onTap: () {
                        ModalWrapper.bottomSheet(
                          context: context,
                          widget: const ShippingAddressModal(),
                        );
                      },
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
                onTap: () {
                  ModalWrapper.bottomSheet(
                    context: context,
                    widget: const FeedbacksModal(),
                  );
                },
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
              const YBox(10),
              DecorationContainer(
                onTap: () {
                  ModalWrapper.showCustomDialog(
                    context,
                    child: const LogoutModal(),
                  );
                },
                child: const ProfileListTile(
                  title: 'Logout',
                  trailicon: Iconsax.logout,
                  textColor: AppColors.red49,
                ),
              ),
              const YBox(100),
            ],
          ),
        ),
      ),
    );
  }
}
