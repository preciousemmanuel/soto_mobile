import 'package:soto_ecommerce/common/common.dart';

class ShippingAddressModal extends StatefulWidget {
  const ShippingAddressModal({super.key});

  @override
  State<ShippingAddressModal> createState() => _ShippingAddressModalState();
}

class _ShippingAddressModalState extends State<ShippingAddressModal> {
  TextEditingController countryC = TextEditingController(text: 'Nigeria');
  TextEditingController addressC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController postalCodeC = TextEditingController();
  TextEditingController stateC = TextEditingController();

  @override
  void dispose() {
    countryC.dispose();
    addressC.dispose();
    cityC.dispose();
    postalCodeC.dispose();
    stateC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(builder: (context, ref, _) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Sizer.radius(20)),
            topRight: Radius.circular(Sizer.radius(20)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
                vertical: Sizer.height(10),
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteF7,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizer.radius(20)),
                  topRight: Radius.circular(Sizer.radius(20)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Shipping Address",
                    style: AppTypography.text20.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const YBox(16),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(30),
              ),
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Country',
                        style: AppTypography.text14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const YBox(2),
                      Row(
                        children: [
                          Text(
                            'Nigeria',
                            style: AppTypography.text20.copyWith(
                              color: AppColors.textAF,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.textAF,
                          ),
                        ],
                      )
                    ],
                  ),
                  const YBox(16),
                  CustomTextField(
                    controller: addressC,
                    labelText: 'Address',
                    showLabelHeader: true,
                    hintText: 'Enter your address',
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    controller: cityC,
                    labelText: 'Town / City',
                    showLabelHeader: true,
                    hintText: 'Port Harcourt',
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    controller: stateC,
                    labelText: 'State',
                    showLabelHeader: true,
                    hintText: 'Rivers State',
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    controller: postalCodeC,
                    labelText: 'Postcode',
                    showLabelHeader: true,
                    hintText: '00000',
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(30),
                  CustomBtn.solid(
                    online: btnIsEnabled,
                    isLoading: ref.isBusy,
                    onTap: () {
                      saveChanges();
                    },
                    height: 50,
                    borderRadius: BorderRadius.circular(Sizer.radius(100)),
                    text: "Save Changes",
                  ),
                ],
              ),
            ),
            const YBox(40),
          ],
        ),
      );
    });
  }

  bool get btnIsEnabled {
    return countryC.text.isNotEmpty &&
        addressC.text.isNotEmpty &&
        cityC.text.isNotEmpty &&
        postalCodeC.text.isNotEmpty &&
        stateC.text.isNotEmpty;
  }

  void saveChanges() async {
    final vm = context.read<AuthUserVM>();
    ApiResponse apiResponse = await vm.userUpdateShippingAddress(
      address: addressC.text.trim(),
      city: cityC.text.trim(),
      state: stateC.text.trim(),
      country: countryC.text.trim(),
      postalCode: postalCodeC.text.trim(),
    );
    if (apiResponse.success) {
      vm.getUserProfile();
      pop();

      FlushBarToast.fLSnackBar(
        snackBarType: SnackBarType.success,
        message: apiResponse.message ?? "Shipping address updated",
      );
    } else {
      FlushBarToast.fLSnackBar(
        message: apiResponse.message ?? "Something went wrong",
      );
    }
  }

  void pop() {
    Navigator.pop(context);
  }
}
