import 'package:soto_ecommerce/common/common.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  FocusNode addressNode = FocusNode();
  TextEditingController addressC = TextEditingController();

  @override
  void dispose() {
    addressNode.dispose();
    addressC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(
      show: context.watch<SignupVM>().isBusy,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          height: Sizer.screenHeight,
          width: Sizer.screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.obBg2),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YBox(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ArrowBackBtn(
                      svgPath: AppSvgs.arrowLeft,
                      color: AppColors.primaryOrange,
                      onTap: () {
                        gotorDashboard();
                      },
                    ),
                  ],
                ),
                const Spacer(),
                imageHelper(
                  AppImages.ob4,
                  height: Sizer.height(373),
                ),
                const YBox(12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: AppTypography.text20.copyWith(
                        color: AppColors.text40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Enter your shipping address',
                      style: AppTypography.text14.copyWith(
                        color: AppColors.text70,
                      ),
                    ),
                  ],
                ),
                const YBox(29),
                CustomTextField(
                  focusNode: addressNode,
                  controller: addressC,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Enter your address',
                  errorText: addressC.text.trim().isNotEmpty &&
                          !(addressC.text.trim().length > 7)
                      ? "Address must be more than 7 characters"
                      : null,
                  onChanged: (val) => setState(() {}),
                ),
                const YBox(35),
                CustomBtn.solid(
                  online: addressC.text.trim().length > 7,
                  onTap: () => updateAddress(),
                  text: "Continue",
                ),
                const YBox(50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateAddress() {
    final vm = context.read<SignupVM>();
    vm.updateShippingAddress(address: addressC.text.trim()).then((value) {
      if (value.success) {
        FlushBarToast.fLSnackBar(
            snackBarType: SnackBarType.success,
            message: value.message ?? 'Shipping address updated');

        gotorDashboard();
      } else {
        FlushBarToast.fLSnackBar(
            message: value.message ?? "Something went wrong");
      }
    });
  }

  void gotorDashboard() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutePath.dashboardNavScreen,
      (route) => false,
    );
  }
}
