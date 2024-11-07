import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool isExpanded = false;
  bool inStock = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductVM>().getCategories();
    });
  }

  @override
  void dispose() {
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
            body: SafeArea(
              bottom: false,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizer.width(20),
                ),
                child: ListView(
                  children: [
                    const YBox(16),
                    CustomHeader(
                      title: 'Add Product',
                      titleStyle: AppTypography.text18.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.text12,
                      ),
                      backBtn: () {
                        vm.clearData();
                        Navigator.pop(context);
                      },
                    ),
                    const YBox(16),
                    CustomTextField(
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.grayE0,
                      labelText: "Product Name",
                      showLabelHeader: true,
                      hintText: 'Product Name',
                      controller: vm.productNameC,
                      onChanged: (val) => vm.reBuildUI(),
                    ),
                    const YBox(16),
                    CustomTextField(
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.grayE0,
                      labelText: "Describe the Product",
                      showLabelHeader: true,
                      maxLines: 3,
                      controller: vm.productDescC,
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
                                vm.selectCategory(catRef.productCategories[i]);
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
                      controller: vm.unitpriceC,
                      onChanged: (val) => vm.reBuildUI(),
                    ),
                    const YBox(16),
                    CustomTextField(
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.grayE0,
                      labelText: "Product Qty",
                      showLabelHeader: true,
                      hintText: 'Product Qty',
                      controller: vm.productQtyC,
                      onChanged: (val) => vm.reBuildUI(),
                    ),
                    const YBox(16),
                    CustomTextField(
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.grayE0,
                      labelText: "Discount Price (Optional)",
                      showLabelHeader: true,
                      hintText: 'Discount Price (Optional)',
                      controller: vm.disCountPriceC,
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
                            controller: vm.heightC,
                            onChanged: (val) => vm.reBuildUI(),
                          ),
                        ),
                        const XBox(20),
                        Expanded(
                          child: CustomTextField(
                            fillColor: AppColors.transparent,
                            borderColor: AppColors.grayE0,
                            hintText: 'Width',
                            controller: vm.widthC,
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
                        controller: vm.weightC,
                        onChanged: (val) {}),
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
                      online: vm.btnIsValid,
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
          ),
        );
      },
    );
  }

  _addProduct() async {
    final vm = context.read<VendorProductVM>();
    ApiResponse apiResponse = await vm.addNewproduct(isInstock: inStock);
    if (apiResponse.success) {
      vm.clearData();
      _pop();
      FlushBarToast.fLSnackBar(
          snackBarType: SnackBarType.success,
          message: apiResponse.message ?? "Product added successfully");
    } else {
      FlushBarToast.fLSnackBar(
          message: apiResponse.message ?? "Something went wrong");
    }
  }

  _pop() {
    Navigator.pop(context);
  }
}
