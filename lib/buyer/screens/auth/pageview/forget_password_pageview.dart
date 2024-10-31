import 'package:soto_ecommerce/common/common.dart';

class ForgetPasswordPageview extends StatefulWidget {
  const ForgetPasswordPageview({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.controller,
  });

  final String icon;
  final String title;
  final String subTitle;
  final PageController controller;

  @override
  State<ForgetPasswordPageview> createState() => _ForgetPasswordPageviewState();
}

class _ForgetPasswordPageviewState extends State<ForgetPasswordPageview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVM>(builder: (context, vm, _) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        child: ListView(
          shrinkWrap: true,
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
                  controller: vm.emailC,
                  hintText: 'Email /Phone number',
                  keyboardType: KeyboardType.email,
                  errorText: vm.emailC.text.isNotEmpty && !vm.isValidEmail
                      ? 'Please enter a valid email'
                      : null,
                  onChanged: (val) => vm.emailIsValid(),
                ),
                const YBox(30),
                CustomBtn.solid(
                  online: vm.isValidEmail,
                  onTap: () {
                    vm.changePassword().then((value) {
                      if (value.success) {
                        widget.controller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);

                        FlushBarToast.fLSnackBar(
                            snackBarType: SnackBarType.success,
                            message: value.message ?? 'Operation successful');
                      } else {
                        FlushBarToast.fLSnackBar(
                            message: value.message ?? "Something went wrong");
                      }
                    });
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
}
