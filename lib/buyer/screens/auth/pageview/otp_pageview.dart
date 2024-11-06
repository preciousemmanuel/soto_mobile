import 'package:pinput/pinput.dart';
import 'package:soto_ecommerce/common/common.dart';

class OtpPageview extends StatefulWidget {
  const OtpPageview({
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
  State<OtpPageview> createState() => _OtpPageviewState();
}

class _OtpPageviewState extends State<OtpPageview> {
  FocusNode pinFocusNode = FocusNode();

  @override
  void initState() {
    KeyboardOverlay.addRemoveFocusNode(context, pinFocusNode);
    super.initState();
  }

  @override
  void dispose() {
    pinFocusNode.dispose();

    super.dispose();
  }

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
                Pinput(
                  defaultPinTheme: PinInputTheme.defaultPinTheme(),
                  followingPinTheme: PinInputTheme.followPinTheme(),
                  length: 4,
                  controller: vm.otpC,
                  focusNode: pinFocusNode,
                  showCursor: true,
                  obscureText: true,
                  obscuringWidget: Padding(
                    padding: EdgeInsets.only(
                      top: Sizer.height(16),
                    ),
                    child: Text("*",
                        style: AppTypography.text48.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  onChanged: (value) => vm.reBuildUI(),
                  onCompleted: (pin) {
                    printty("Completed");
                  },
                ),
                const YBox(30),
                CustomBtn.solid(
                  online: vm.otpC.text.length == 4,
                  onTap: () {
                    widget.controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);

                    // vm.validateOtp().then((value) {
                    //   if (value.success) {
                    //     widget.controller.nextPage(
                    //         duration: const Duration(seconds: 1),
                    //         curve: Curves.ease);

                    //     FlushBarToast.fLSnackBar(
                    //         snackBarType: SnackBarType.success,
                    //         message: value.message ?? 'Operation successful');
                    //   } else {
                    //     FlushBarToast.fLSnackBar(
                    //         message: value.message ?? "Something went wrong");
                    //   }
                    // });
                  },
                  text: "Continue",
                ),
                const YBox(100),
              ],
            ),
          ],
        ),
      );
    });
  }
}
