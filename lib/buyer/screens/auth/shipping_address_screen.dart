import 'package:soto_ecommerce/common/common.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  TextEditingController addressC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController stateC = TextEditingController();

  FocusNode addressN = FocusNode();
  FocusNode cityN = FocusNode();
  FocusNode stateN = FocusNode();

  unFocuaAll() {
    addressN.unfocus();
    cityN.unfocus();
    stateN.unfocus();
  }

  @override
  void dispose() {
    cityC.dispose();
    stateC.dispose();
    addressC.dispose();

    cityN.dispose();
    stateN.dispose();
    addressN.dispose();

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
            child: ListView(
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
                // const YBox(20),
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
                  focusNode: addressN,
                  controller: addressC,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Enter your address',
                  errorText: addressC.text.trim().isNotEmpty &&
                          !(addressC.text.trim().length > 7)
                      ? "Address must be more than 7 characters"
                      : null,
                  onChanged: (val) => setState(() {}),
                ),
                const YBox(10),
                CustomTextField(
                  focusNode: cityN,
                  controller: cityC,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Enter your City',
                  errorText: cityC.text.trim().isNotEmpty &&
                          cityC.text.trim().length < 2
                      ? "City is required"
                      : null,
                  onChanged: (val) => setState(() {}),
                ),
                const YBox(10),
                CustomTextField(
                  focusNode: stateN,
                  controller: stateC,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Enter your State',
                  errorText: stateC.text.trim().isNotEmpty &&
                          stateC.text.trim().length < 2
                      ? "State is required"
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
    unFocuaAll();
    final vm = context.read<SignupVM>();
    vm
        .updateShippingAddress(
      address: addressC.text.trim(),
      city: cityC.text.trim(),
      state: stateC.text.trim(),
    )
        .then((value) {
      handleApiResponse(
          response: value,
          onSuccess: () {
            gotorDashboard();
          });
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
