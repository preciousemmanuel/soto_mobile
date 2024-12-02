import 'package:pinput/pinput.dart';
import 'package:soto_ecommerce/common/common.dart';

class VendorOtpScreen extends StatefulWidget {
  const VendorOtpScreen({super.key});

  @override
  State<VendorOtpScreen> createState() => _VendorOtpScreenState();
}

class _VendorOtpScreenState extends State<VendorOtpScreen> {
  TextEditingController otpC = TextEditingController();
  FocusNode otpF = FocusNode();

  @override
  void dispose() {
    otpC.dispose();
    otpF.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVM>(builder: (context, vm, _) {
      return BusyOverlay(
        show: vm.isBusy,
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
                  BackIcon(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  const YBox(10),
                  imageHelper(
                    AppImages.mail,
                    height: Sizer.height(140),
                  ),
                  const YBox(24),
                  Text(
                    "Enter OTP",
                    textAlign: TextAlign.center,
                    style: AppTypography.text32.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const YBox(8),
                  Text(
                    "Enter the OTP code we just sent you on your registered Email/Phone number",
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
                        controller: otpC,
                        focusNode: otpF,
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
                        online: otpC.text.length == 4,
                        onTap: () {
                          validateOtp();
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

  validateOtp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final vm = context.read<PasswordVM>();
    final res = await vm.validateOtp(
      otpC.text.trim(),
      type: PasswordType.accountValidation,
    );
    handleApiResponse(
        response: res,
        onSuccess: () {
          gotoApprovalScreen();
        });
  }

  void gotoApprovalScreen() {
    Navigator.pushReplacementNamed(
      context,
      RoutePath.approvalScreen,
    );
  }
}
