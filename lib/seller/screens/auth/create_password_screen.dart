import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  FocusNode passwordF = FocusNode();
  FocusNode confirmPasswordF = FocusNode();

  @override
  void dispose() {
    passwordF.dispose();
    confirmPasswordF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateBusinessVM>(builder: (context, vm, _) {
      return BusyOverlay(
        show: vm.busy(CreateBusinessVM.businessSignupState),
        child: Scaffold(
          backgroundColor: AppColors.bgFF,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const YBox(20),
                  const BackIcon(),
                  const YBox(10),
                  imageHelper(
                    AppImages.lock,
                    height: Sizer.height(100),
                  ),
                  const YBox(24),
                  Text(
                    "Create Password",
                    textAlign: TextAlign.center,
                    style: AppTypography.text32.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const YBox(8),
                  Text(
                    "Well done! Now you can create password to continue",
                    textAlign: TextAlign.center,
                    style: AppTypography.text14.copyWith(
                      color: AppColors.text7D,
                    ),
                  ),
                  const YBox(36),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        focusNode: passwordF,
                        fillColor: AppColors.orangeEA.withOpacity(0.5),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Iconsax.lock_1,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        controller: vm.businessPasswordC,
                        isPassword: true,
                        onChanged: (val) => vm.reBuildUI(),
                        onSubmitted: (p0) {},
                      ),
                      const YBox(26),
                      CustomTextField(
                        focusNode: confirmPasswordF,
                        fillColor: AppColors.orangeEA.withOpacity(0.5),
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(
                          Iconsax.lock_1,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        controller: vm.businessPasswordConfirmC,
                        isPassword: true,
                        errorText: vm.businessPasswordConfirmC.text
                                    .trim()
                                    .isNotEmpty &&
                                vm.businessPasswordC.text.trim() !=
                                    vm.businessPasswordConfirmC.text.trim()
                            ? "Password does not match"
                            : null,
                        onChanged: (val) => vm.reBuildUI(),
                        onSubmitted: (p0) {},
                      ),
                      const YBox(30),
                      CustomBtn.solid(
                        online: vm.passwordIsBtnValid,
                        onTap: () {
                          _createBusinessAccount();
                        },
                        text: "Continue",
                      ),
                      const YBox(100)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _createBusinessAccount() {
    FocusManager.instance.primaryFocus?.unfocus();
    final vm = context.read<CreateBusinessVM>();
    vm.createBusinessAccount().then((value) {
      if (value.success) {
        vm.clearData();
        gotoVendorOtpScreen();
        FlushBarToast.fLSnackBar(
            snackBarType: SnackBarType.success,
            message: 'Account created successfully');
      } else {
        FlushBarToast.fLSnackBar(
            message: value.message ?? "Something went wrong");
      }
    });
  }

  void gotoVendorOtpScreen() {
    Navigator.pushReplacementNamed(
      context,
      RoutePath.vendorOtpScreen,
    );
  }
}
