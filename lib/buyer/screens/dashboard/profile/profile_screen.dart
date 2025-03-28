// ignore_for_file: use_build_context_synchronously

import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isVendor = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await StorageService.getBoolItem(StorageKey.vendorUser) != null) {
        _isVendor = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(
      builder: (context, vm, _) {
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
                      InkWell(
                        onTap: () {
                          ModalWrapper.showCustomDialog(
                            context,
                            child: ConfirmModal(
                              message: _isVendor
                                  ? 'Are you sure to switch to user?'
                                  : 'Are you sure to switch to vendor?',
                              onConfirm: () {
                                _isVendor
                                    ? vm.removeVendorUser()
                                    : vm.setVendorUser();
                                context.read<LoginVM>().logout(
                                    switchToVendor: _isVendor ? false : true);
                                context.read<AuthUserVM>().clearData();
                              },
                            ),
                          );
                        },
                        child: Container(
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
                                _isVendor
                                    ? 'Switch to user'
                                    : 'Switch to vendor',
                                style: AppTypography.text12.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
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
                          leadicon: Iconsax.lock,
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutePath.changeOrForgotPasswordScreen,
                                arguments: const PasswordScreenArgs(
                                  type: PasswordType.changePassword,
                                ));
                          },
                        ),
                        const YBox(20),
                        ProfileListTile(
                          title: 'Change Address',
                          leadicon: Iconsax.location,
                          onTap: () {
                            ModalWrapper.bottomSheet(
                              context: context,
                              widget: const ShippingAddressModal(),
                            );
                          },
                        ),
                        // ProfileListTile(
                        //   title: 'Enable biometric',
                        //   leadicon: Iconsax.finger_cricle,
                        //   trailWidget: CustomSwitch(
                        //     value: _enableBiometric,
                        //     onChanged: (val) {
                        //       _enableBiometric = val;
                        //       vm.reBuildUI();
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const YBox(16),
                  // DecorationContainer(
                  //   onTap: () {
                  //     Navigator.pushNamed(
                  //         context, RoutePath.paymentMethodScreen);
                  //   },
                  //   child: const ProfileListTile(
                  //     title: 'Payment Methods',
                  //     leadicon: Iconsax.card_add,
                  //   ),
                  // ),
                  // const YBox(10),
                  DecorationContainer(
                    onTap: () {
                      ModalWrapper.bottomSheet(
                        context: context,
                        widget: const FeedbacksModal(),
                      );
                    },
                    child: const ProfileListTile(
                      title: 'Feedback',
                      leadicon: Iconsax.sms_edit,
                    ),
                  ),
                  const YBox(10),
                  DecorationContainer(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePath.helpCenterScreen);
                    },
                    child: const ProfileListTile(
                      title: 'Help Center',
                      leadicon: AppSvgs.chatHelp,
                    ),
                  ),
                  const YBox(10),
                  DecorationContainer(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutePath.customWebviewScreen,
                          arguments: WebViewArg(
                            webURL: AppUtils.termsAndConditions,
                          ));
                    },
                    child: const ProfileListTile(
                      title: 'Terms & Conditions',
                      leadicon: AppSvgs.note,
                    ),
                  ),
                  const YBox(10),
                  DecorationContainer(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePath.customWebviewScreen,
                        arguments: WebViewArg(
                          webURL: AppUtils.policy,
                        ),
                      );
                    },
                    child: const ProfileListTile(
                      title: 'Privacy Policie',
                      leadicon: AppSvgs.warning,
                    ),
                  ),
                  const YBox(10),
                  DecorationContainer(
                    onTap: () {
                      ModalWrapper.showCustomDialog(
                        context,
                        child: ConfirmModal(
                          message: 'Do you want to Logout?',
                          confirmText: 'Yes Logout',
                          onConfirm: () {
                            if (vm.isVendor) {
                              context
                                  .read<LoginVM>()
                                  .logout(switchToVendor: true)
                                  .then(
                                (v) {
                                  context.read<AuthUserVM>().clearData();
                                },
                              );
                            } else {
                              vm.removeVendorUser();
                              context.read<LoginVM>().logout().then(
                                (v) {
                                  context.read<AuthUserVM>().clearData();
                                },
                              );
                            }
                          },
                        ),
                      );
                    },
                    child: const ProfileListTile(
                      title: 'Logout',
                      leadicon: Iconsax.logout,
                      textColor: AppColors.red49,
                    ),
                  ),
                  const YBox(100),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
