import 'package:soto_ecommerce/common/common.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  bool orderAddedFortheFirstTime = false;
  bool showValidationError = false;

  ScrollController scrollController = ScrollController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();

  TextEditingController productNameC = TextEditingController();
  TextEditingController productBrandC = TextEditingController();
  TextEditingController productSizeC = TextEditingController();
  TextEditingController productColorC = TextEditingController();
  TextEditingController productTypeC = TextEditingController();
  TextEditingController productQuantityC = TextEditingController();
  TextEditingController productPriceC1 = TextEditingController();
  TextEditingController productPriceC2 = TextEditingController();
  TextEditingController productMessageC = TextEditingController();

  FocusNode emailF = FocusNode();
  FocusNode phoneF = FocusNode();
  FocusNode productNameF = FocusNode();
  FocusNode productBrandF = FocusNode();
  FocusNode productSizeF = FocusNode();
  FocusNode productColorF = FocusNode();
  FocusNode productTypeF = FocusNode();
  FocusNode productQuantityF = FocusNode();
  FocusNode productPriceF1 = FocusNode();
  FocusNode productPriceF2 = FocusNode();
  FocusNode productMessageF = FocusNode();

  clearFields() {
    productNameC.clear();
    productBrandC.clear();
    productSizeC.clear();
    productColorC.clear();
    productTypeC.clear();
    productQuantityC.clear();
    productPriceC1.clear();
    productPriceC2.clear();
    productMessageC.clear();
  }

  @override
  void dispose() {
    emailC.dispose();
    phoneC.dispose();
    productNameC.dispose();
    productBrandC.dispose();
    productSizeC.dispose();
    productColorC.dispose();
    productTypeC.dispose();
    productQuantityC.dispose();
    productPriceC1.dispose();
    productPriceC2.dispose();
    productMessageC.dispose();

    emailF.dispose();
    phoneF.dispose();
    productNameF.dispose();
    productBrandF.dispose();
    productSizeF.dispose();
    productColorF.dispose();
    productTypeF.dispose();
    productQuantityF.dispose();
    productPriceF1.dispose();
    productPriceF2.dispose();
    productMessageF.dispose();
    scrollController.dispose();
    super.dispose();
  }

  _srollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(
      show: context.watch<CustomOrderVm>().isBusy,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: CustomHeader(
          title: orderAddedFortheFirstTime ? '' : 'Create Order',
          color: AppColors.primaryOrange,
          backBtn: () {
            Navigator.pop(context);
            context.read<CustomOrderVm>().clearCustomOrderFromStorage();
          },
        ),
        body: SizedBox(
          width: Sizer.screenWidth,
          height: Sizer.screenHeight,
          child: ListView(
            shrinkWrap: true,
            controller: scrollController,
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            children: [
              const YBox(4),
              if (!orderAddedFortheFirstTime)
                Text(
                  'Kindly enter your order details',
                  textAlign: TextAlign.center,
                  style: AppTypography.text12.copyWith(
                    color: AppColors.text56,
                  ),
                ),
              if (orderAddedFortheFirstTime)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Order',
                      textAlign: TextAlign.center,
                      style: AppTypography.text20.copyWith(
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomBtn.solid(
                      height: Sizer.height(40),
                      width: Sizer.width(140),
                      onlineColor: AppColors.black,
                      textStyle: AppTypography.text14.copyWith(
                          fontWeight: FontWeight.w500, color: AppColors.white),
                      onTap: () {
                        emailC.clear();
                        phoneC.clear();
                        Navigator.pushNamed(
                            context, RoutePath.reviewOrderScreen);
                      },
                      text: "Review Orders",
                    ),
                  ],
                ),
              const YBox(24),
              CustomTextField(
                controller: productNameC,
                focusNode: productNameF,
                labelText: 'Product name',
                showLabelHeader: true,
                fillColor: AppColors.bgF5,
                hintText: 'Enter name',
                errorText: showValidationError && productNameC.text.isEmpty
                    ? 'Product name is required'
                    : null,
                onChanged: (val) => setState(() {}),
              ),
              const YBox(20),
              CustomTextField(
                controller: productBrandC,
                focusNode: productBrandF,
                labelText: 'Product Brand',
                showLabelHeader: true,
                fillColor: AppColors.bgF5,
                hintText: 'Enter brand name',
                errorText: showValidationError && productBrandC.text.isEmpty
                    ? 'Product brand is required'
                    : null,
                onChanged: (val) => setState(() {}),
              ),
              const YBox(20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: productQuantityC,
                      focusNode: productQuantityF,
                      keyboardType: KeyboardType.decimal,
                      labelText: 'Quantity',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter quantity',
                      errorText:
                          showValidationError && productQuantityC.text.isEmpty
                              ? 'Quantity is required'
                              : null,
                      onChanged: (val) => setState(() {}),
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      controller: productSizeC,
                      focusNode: productSizeF,
                      labelText: 'Size ',
                      optionalText: '(if applicable)',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter size',
                      onChanged: (val) => setState(() {}),
                    ),
                  ),
                ],
              ),
              const YBox(20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: productColorC,
                      focusNode: productColorF,
                      labelText: 'Color',
                      optionalText: '(if applicable)',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter color',
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      controller: productTypeC,
                      focusNode: productTypeF,
                      labelText: 'Type ',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter type',
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: productPriceC1,
                      focusNode: productPriceF1,
                      labelText: 'Price Range',
                      showLabelHeader: true,
                      keyboardType: KeyboardType.decimal,
                      fillColor: AppColors.bgF5,
                      hintText: 'Minimum',
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      controller: productPriceC2,
                      focusNode: productPriceF2,
                      fillColor: AppColors.bgF5,
                      keyboardType: KeyboardType.decimal,
                      hintText: 'Maximum',
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: emailC,
                      focusNode: emailF,
                      labelText: 'Email Address',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'example@gmail.com',
                      errorText: (emailC.text.isNotEmpty && !emailIsValid()) ||
                              (showValidationError && emailC.text.isEmpty)
                          ? 'Invalid email address'
                          : null,
                      onChanged: (val) => setState(() {}),
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      controller: phoneC,
                      focusNode: phoneF,
                      labelText: 'Phone Number',
                      showLabelHeader: true,
                      keyboardType: KeyboardType.number,
                      fillColor: AppColors.bgF5,
                      hintText: '0803xxxxxxxxx',
                      errorText: showValidationError && phoneC.text.isEmpty
                          ? 'Phone number is required '
                          : null,
                      onChanged: (val) => setState(() {}),
                    ),
                  ),
                ],
              ),
              const YBox(20),
              CustomTextField(
                controller: productMessageC,
                focusNode: productMessageF,
                labelText: 'Message',
                showLabelHeader: true,
                fillColor: AppColors.bgF5,
                hintText: 'Leave a note...',
                maxLines: 3,
                onChanged: (val) {},
              ),
              const YBox(200),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.only(
            left: Sizer.width(20),
            right: Sizer.width(20),
            bottom: Sizer.width(30),
            top: Sizer.width(10),
          ),
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomBtn.solid(
                  isOutline: true,
                  height: Sizer.height(50),
                  text: "Save & Add",
                  textColor: AppColors.primaryOrange,
                  onTap: () {
                    _srollToTop();
                    if (!activateBtn()) {
                      showValidationError = true;
                      setState(() {});
                      return;
                    }
                    _saveAndAddCustomOrder();
                  }),
              // Row(
              //   children: [
              //     Expanded(
              //       child: CustomBtn.solid(
              //         height: Sizer.height(50),
              //         onTap: () {
              //           _srollToTop();
              //           if (!activateBtn()) {
              //             showValidationError = true;
              //             setState(() {});
              //             return;
              //           }
              //           _createCustomOrder();
              //           // Navigator.pushNamed(context, RoutePath.addOrderScreen);
              //         },
              //         text: "Submit",
              //       ),
              //     ),
              //     const XBox(20),
              //     Expanded(
              //       child: CustomBtn.solid(
              //           isOutline: true,
              //           height: Sizer.height(50),
              //           text: "Save & Add",
              //           textColor: AppColors.primaryOrange,
              //           onTap: () {
              //             _srollToTop();
              //             if (!activateBtn()) {
              //               showValidationError = true;
              //               setState(() {});
              //               return;
              //             }
              //             _saveAndAddCustomOrder();
              //           }),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  // _createCustomOrder() async {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   final ref = context.read<CustomOrderVm>();
  //   ApiResponse response = await ref.createCustomOrder([
  //     CustomOrderRes(
  //       productName: productNameC.text.trim(),
  //       productBrand: productBrandC.text.trim(),
  //       size: productSizeC.text.trim(),
  //       color: productColorC.text.trim(),
  //       type: productTypeC.text.trim(),
  //       quantity:
  //           int.tryParse(productQuantityC.text.trim().replaceAllCommas()) ?? 1,
  //       minPrice: int.tryParse(productPriceC1.text.trim().replaceAllCommas()),
  //       maxPrice: int.tryParse(productPriceC2.text.trim().replaceAllCommas()),
  //       phoneNumber: phoneC.text.trim(),
  //       email: emailC.text.trim(),
  //       note: productMessageC.text.trim(),
  //     )
  //   ]);

  //   handleApiResponse(
  //       response: response,
  //       onSuccess: () {
  //         showValidationError = false;
  //         emailC.clear();
  //         phoneC.clear();
  //         clearFields();
  //       });
  // }

  _saveAndAddCustomOrder() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final ref = context.read<CustomOrderVm>();
    ApiResponse response = await ref.saveCustomOrderToStorage(CustomOrderRes(
      productName: productNameC.text.trim(),
      productBrand: productBrandC.text.trim(),
      size: productSizeC.text.trim(),
      color: productColorC.text.trim(),
      type: productTypeC.text.trim(),
      quantity:
          int.tryParse(productQuantityC.text.trim().replaceAllCommas()) ?? 1,
      minPrice: int.tryParse(productPriceC1.text.trim().replaceAllCommas()),
      maxPrice: int.tryParse(productPriceC2.text.trim().replaceAllCommas()),
      phoneNumber: phoneC.text.trim(),
      email: emailC.text.trim(),
      note: productMessageC.text.trim(),
    ));

    handleApiResponse(
        response: response,
        onSuccess: () {
          orderAddedFortheFirstTime = true;
          showValidationError = false;
          clearFields();
          setState(() {});
        });
  }

  bool activateBtn() {
    return productNameC.text.isNotEmpty &&
        productBrandC.text.isNotEmpty &&
        emailIsValid() &&
        phoneC.text.isNotEmpty;
  }

  bool emailIsValid() {
    return emailC.text.contains("@") &&
        emailC.text.contains(".") &&
        emailC.text.split('.').last.isNotEmpty;
  }
}
