// ignore_for_file: use_build_context_synchronously

import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class ResetPasswordPageview extends StatefulWidget {
  const ResetPasswordPageview({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.controller,
    this.type,
  });

  final String icon;
  final String title;
  final String subTitle;
  final PageController controller;
  final PasswordType? type;

  @override
  State<ResetPasswordPageview> createState() => _ResetPasswordPageviewState();
}

class _ResetPasswordPageviewState extends State<ResetPasswordPageview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVM>(builder: (context, vm, _) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        child: ListView(
          children: [
            imageHelper(
              widget.icon,
              height: Sizer.height(140),
            ),
            const YBox(24),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppTypography.text32.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const YBox(8),
            Text(
              widget.subTitle,
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
                  controller: vm.passwordC,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Iconsax.lock_1,
                    color: AppColors.iconC4,
                    size: Sizer.height(20),
                  ),
                  isPassword: true,
                  onChanged: (val) => vm.reBuildUI(),
                  onSubmitted: (p0) {},
                ),
                const YBox(26),
                CustomTextField(
                  controller: vm.passwordConfirmC,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Confirm Password',
                  errorText: vm.passwordC.text.isNotEmpty &&
                          vm.passwordConfirmC.text.isNotEmpty &&
                          !vm.passwordIsValid
                      ? 'Passwords do not match'
                      : null,
                  prefixIcon: Icon(
                    Iconsax.lock_1,
                    color: AppColors.iconC4,
                    size: Sizer.height(20),
                  ),
                  isPassword: true,
                  onChanged: (val) => vm.reBuildUI(),
                  onSubmitted: (p0) {},
                ),
                const YBox(30),
                CustomBtn.solid(
                  online: vm.passwordIsValid,
                  onTap: () {
                    _changePassword();
                  },
                  text: "Continue",
                ),
              ],
            ),
            const YBox(100),
          ],
        ),
      );
    });
  }

  void _changePassword() {
    final vm = context.read<PasswordVM>();
    vm.changePassword().then((value) {
      if (value.success) {
        vm.clearData();
        FlushBarToast.fLSnackBar(
          snackBarType: SnackBarType.success,
          message: value.message ?? 'Password changed successfully',
        );
        Navigator.pushReplacementNamed(context, RoutePath.confirmationScreen,
            arguments: ConfirmationScreenArgs(
              msg: value.message ?? 'Password changed \nsuccessfully',
              onTap: widget.type == PasswordType.forgotPassword
                  ? () {
                      pop();
                      pop();
                    }
                  : null,
            ));
      } else {
        FlushBarToast.fLSnackBar(
          message: value.message ?? "Something went wrong",
        );
      }
    });
  }

  void pop() {
    Navigator.pop(NavKey.appNavigatorKey.currentContext!);
  }
}
