import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({
    super.key,
    this.args,
  });

  final VendorProductArgs? args;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameC = TextEditingController();
  TextEditingController productDescC = TextEditingController();
  TextEditingController unitpriceC = TextEditingController();
  TextEditingController productQtyC = TextEditingController();
  TextEditingController disCountPriceC = TextEditingController();
  TextEditingController heightC = TextEditingController();
  TextEditingController widthC = TextEditingController();
  TextEditingController weightC = TextEditingController();
  List productImages = [];

  // FocusNode
  FocusNode productNameFocus = FocusNode();
  FocusNode productDescFocus = FocusNode();
  FocusNode unitpriceFocus = FocusNode();
  FocusNode productQtyFocus = FocusNode();
  FocusNode disCountPriceFocus = FocusNode();
  FocusNode heightFocus = FocusNode();
  FocusNode widthFocus = FocusNode();
  FocusNode weightFocus = FocusNode();

  bool isExpanded = false;
  bool inStock = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductVM>().getCategories();
      if (widget.args?.isEdit == true) {
        _iniitialise();
      }
    });
  }

  _iniitialise() {
    final vm = context.read<VendorProductVM>();

    productNameC.text = widget.args?.product?.productName ?? '';
    productDescC.text = widget.args?.product?.description ?? '';
    unitpriceC.text = (widget.args?.product?.unitPrice ?? 0).toString();
    productQtyC.text = (widget.args?.product?.productQuantity ?? 0).toString();
    // disCountPriceC.text = (widget.args?.product?.discountPrice ?? 0).toString();
    heightC.text = (widget.args?.product?.height ?? 0).toString();
    widthC.text = (widget.args?.product?.width ?? 0).toString();
    weightC.text = (widget.args?.product?.weight ?? 0).toString();
    inStock = widget.args?.product?.inStock ?? false;
    productImages = widget.args?.product?.images ?? [];
    vm.setSelectCategory(widget.args?.product?.category ?? ProductCategory());
  }

  @override
  void dispose() {
    productNameC.dispose();
    productDescC.dispose();
    unitpriceC.dispose();
    productQtyC.dispose();
    disCountPriceC.dispose();
    heightC.dispose();
    widthC.dispose();
    weightC.dispose();

    productNameFocus.dispose();
    productDescFocus.dispose();
    unitpriceFocus.dispose();
    productQtyFocus.dispose();
    disCountPriceFocus.dispose();
    heightFocus.dispose();
    widthFocus.dispose();
    weightFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VendorProductVM>(
      builder: (context, vm, _) {
        return BusyOverlay(
          show: vm.isBusy,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: CustomHeader(
              title: '${widget.args?.isEdit ?? false ? 'Edit' : 'Add'} Product',
              titleStyle: AppTypography.text18.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.text12,
              ),
              backBtn: () {
                vm.clearData();
                Navigator.pop(context);
              },
            ),
            body: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: ListView(
                children: [
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Product Name",
                    showLabelHeader: true,
                    hintText: 'Product Name',
                    controller: productNameC,
                    onChanged: (val) => vm.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Describe the Product",
                    showLabelHeader: true,
                    maxLines: 3,
                    controller: productDescC,
                    onChanged: (val) => vm.reBuildUI(),
                  ),
                  const YBox(16),
                  Text(
                    'Product Category',
                    style: TextStyle(
                      color: AppColors.text5C,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const YBox(6),
                  Consumer<ProductVM>(builder: (context, catRef, _) {
                    return SelectCategoryField(
                      bgColor: AppColors.transparent,
                      borderColor: AppColors.grayE0,
                      text: vm.selectedCategory == null
                          ? 'Select Category'
                          : vm.selectedCategory?.name ?? '',
                      isExpanded: isExpanded,
                      isLoading: vm.isBusy,
                      hasBeenSelected: vm.selectedCategory != null,
                      onSelect: () {
                        isExpanded = !isExpanded;
                        vm.reBuildUI();
                      },
                      children: List.generate(
                        catRef.productCategories.length,
                        (i) {
                          return InkWell(
                            onTap: () {
                              vm.setSelectCategory(catRef.productCategories[i]);
                              isExpanded = false;
                              vm.reBuildUI();
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                top: Sizer.height(i == 0 ? 30 : 14),
                                bottom: Sizer.height(
                                    i == catRef.productCategories.length - 1
                                        ? 0
                                        : 14),
                              ),
                              child: Text(
                                catRef.productCategories[i].name ?? '',
                                style: AppTypography.text14.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.text57,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  const YBox(16),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(12),
                      vertical: Sizer.height(30),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.grayE0,
                      ),
                      borderRadius: BorderRadius.circular(Sizer.height(14)),
                    ),
                    child: Builder(builder: (context) {
                      if (vm.busy(pickImageState)) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ));
                      }

                      if (vm.productImages.isNotEmpty) {
                        return Center(
                          child: Wrap(
                            spacing: Sizer.width(15),
                            runSpacing: Sizer.height(10),
                            children: List.generate(
                              vm.productImages.length,
                              (i) => Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.grayE0),
                                      borderRadius: BorderRadius.circular(
                                          Sizer.height(8)),
                                    ),
                                    height: Sizer.height(80),
                                    width: Sizer.width(80),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Sizer.height(8)),
                                      child: Image.file(
                                        vm.productImages[i],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -8,
                                    right: -8,
                                    child: InkWell(
                                      onTap: () {
                                        vm.removeImage(i);
                                      },
                                      child: const Icon(
                                        Iconsax.close_circle,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      if (productImages.isNotEmpty) {
                        return Center(
                          child: Wrap(
                            spacing: Sizer.width(15),
                            runSpacing: Sizer.height(10),
                            children: List.generate(
                              productImages.length,
                              (i) => Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.grayE0),
                                      borderRadius: BorderRadius.circular(
                                          Sizer.height(8)),
                                    ),
                                    height: Sizer.height(80),
                                    width: Sizer.width(80),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Sizer.height(8)),
                                      child: MyCachedNetworkImage(
                                        imageUrl: productImages[i],
                                        fadeInDuration:
                                            const Duration(milliseconds: 50),
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -8,
                                    right: -8,
                                    child: InkWell(
                                      onTap: () {
                                        productImages.removeAt(i);
                                      },
                                      child: const Icon(
                                        Iconsax.close_circle,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      return InkWell(
                        onTap: () => vm.pickImage().then((v) {
                          if (!v.success) {
                            FlushBarToast.fLSnackBar(
                                message: v.message ?? "Something went wrong");
                          }
                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(Sizer.radius(8)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.grayE0,
                                ),
                                borderRadius:
                                    BorderRadius.circular(Sizer.height(8)),
                              ),
                              child: Icon(
                                Iconsax.gallery_add,
                                color: AppColors.text97,
                                size: Sizer.height(30),
                              ),
                            ),
                            const YBox(4),
                            Text(
                              'Upload Product Image',
                              style: AppTypography.text14.copyWith(
                                color: AppColors.text1A,
                              ),
                            ),
                            Text(
                              'image should be less than 2mb',
                              style: AppTypography.text12.copyWith(
                                color: AppColors.black66,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Unit Price (N)",
                    showLabelHeader: true,
                    hintText: 'Unit Price (N)',
                    controller: unitpriceC,
                    onChanged: (val) => vm.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Product Qty",
                    showLabelHeader: true,
                    hintText: 'Product Qty',
                    controller: productQtyC,
                    onChanged: (val) => vm.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Discount Price (Optional)",
                    showLabelHeader: true,
                    hintText: 'Discount Price (Optional)',
                    controller: disCountPriceC,
                    onChanged: (val) => vm.reBuildUI(),
                  ),
                  const YBox(20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          fillColor: AppColors.transparent,
                          borderColor: AppColors.grayE0,
                          hintText: 'Height',
                          controller: heightC,
                          keyboardType: KeyboardType.decimal,
                          onChanged: (val) => vm.reBuildUI(),
                        ),
                      ),
                      const XBox(20),
                      Expanded(
                        child: CustomTextField(
                          fillColor: AppColors.transparent,
                          borderColor: AppColors.grayE0,
                          hintText: 'Width',
                          controller: widthC,
                          keyboardType: KeyboardType.decimal,
                          onChanged: (val) => vm.reBuildUI(),
                        ),
                      ),
                    ],
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    hintText: 'Product Weight',
                    controller: weightC,
                    onChanged: (val) {},
                    keyboardType: KeyboardType.decimal,
                  ),
                  const YBox(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mark Product in stock',
                        style: AppTypography.text14.copyWith(
                          color: AppColors.text57,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomSwitch(
                        value: inStock,
                        onChanged: (val) {
                          inStock = val;
                          vm.reBuildUI();
                        },
                      )
                    ],
                  ),
                  const YBox(30),
                  CustomBtn.solid(
                    online: btnIsValid,
                    onTap: () {
                      _addProduct();
                    },
                    text: "Add Product",
                  ),
                  const YBox(50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool get btnIsValid {
    return productNameC.text.isNotEmpty &&
        productDescC.text.isNotEmpty &&
        // _selectedCategory != null &&
        unitpriceC.text.isNotEmpty &&
        productQtyC.text.isNotEmpty;
  }

  _addProduct() async {
    final vm = context.read<VendorProductVM>();
    ApiResponse apiResponse = await vm.addNewproduct(
      isInstock: inStock,
      productNameC: productNameC.text.trim(),
      productDescC: productDescC.text.trim(),
      unitpriceC: unitpriceC.text.trim(),
      productQtyC: productQtyC.text.trim(),
      disCountPriceC: disCountPriceC.text.trim(),
      heightC: heightC.text.trim(),
      widthC: widthC.text.trim(),
      weightC: weightC.text.trim(),
      productId: widget.args?.product?.id ?? '',
      isEditing: widget.args?.isEdit ?? false,
      existingImages: productImages,
    );

    handleApiResponse(
        response: apiResponse,
        onSuccess: () {
          clearFields();
          vm.clearData();
          vm.getProductsByVendor();
          if (widget.args?.isEdit ?? false) {
            Navigator.pushNamed(
              context,
              RoutePath.vendorProductDetailsScreen,
              arguments: ProductArgs(
                productId: widget.args?.product?.id ?? '',
              ),
            );
          } else {
            _pop();
          }
        });
  }

  clearFields() {
    productNameC.clear();
    productDescC.clear();
    unitpriceC.clear();
    productQtyC.clear();
    disCountPriceC.clear();
    heightC.clear();
    widthC.clear();
    weightC.clear();
  }

  _pop() {
    Navigator.pop(context);
  }
}
