// ignore_for_file: use_build_context_synchronously

import 'package:soto_ecommerce/common/common.dart';

class ProductFilterModal extends StatefulWidget {
  const ProductFilterModal({super.key});

  @override
  State<ProductFilterModal> createState() => _ProductFilterModalState();
}

class _ProductFilterModalState extends State<ProductFilterModal> {
  TextEditingController minPriceC = TextEditingController();
  TextEditingController maxPriceC = TextEditingController();
  FocusNode minFocus = FocusNode();
  FocusNode maxFocus = FocusNode();
  // var ratings = [
  //   '4.5 & Up Above',
  //   '4.0 & Up Above',
  //   '3.5 & Up Above',
  //   '3.0 & Up Above',
  // ];
  ProductCategory? selectedCategory;
  int? selectedRating;
  // List<String> selectedCategories = [];
  // List<String> selectedRatings = [];

  @override
  void dispose() {
    minPriceC.dispose();
    maxPriceC.dispose();
    minFocus.dispose();
    maxFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (ctx, vm, _) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: Sizer.screenHeight * 0.8,
          padding: EdgeInsets.only(
            left: Sizer.width(20),
            right: Sizer.width(20),
            top: Sizer.height(10),
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Sizer.radius(20)),
              topRight: Radius.circular(Sizer.radius(20)),
            ),
          ),
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: Sizer.height(8),
                  width: Sizer.width(70),
                  decoration: BoxDecoration(
                    color: AppColors.grayD9,
                    borderRadius: BorderRadius.circular(Sizer.radius(20)),
                  ),
                ),
              ),
              const YBox(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filters',
                    style: AppTypography.text20.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // vm.clearFilters();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Clear',
                      style: AppTypography.text16.copyWith(
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const YBox(16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories:',
                    style: AppTypography.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const YBox(10),
                  Wrap(
                    spacing: Sizer.width(10),
                    runSpacing: Sizer.height(10),
                    children: List.generate(
                      vm.productCategories.length,
                      (v) {
                        return FilterCheckBox(
                          title: vm.productCategories[v].name ?? '',
                          isSelected:
                              selectedCategory == vm.productCategories[v],
                          onTap: () {
                            selectedCategory = vm.productCategories[v];
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const YBox(26),
              Text(
                'Price range:  ',
                style: AppTypography.text16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const YBox(10),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: minPriceC,
                      focusNode: minFocus,
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.base9A,
                      keyboardType: KeyboardType.decimal,
                      hintText: 'Min. Price',
                      // showSuffixIcon: true,
                      // suffixIcon: Icon(
                      //   Icons.keyboard_arrow_down,
                      //   color: AppColors.iconC4,
                      //   size: Sizer.height(24),
                      // ),
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(40),
                  Expanded(
                    child: CustomTextField(
                      controller: maxPriceC,
                      focusNode: maxFocus,
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.base9A,
                      keyboardType: KeyboardType.decimal,
                      hintText: 'Max. Price',
                      // showSuffixIcon: true,
                      // suffixIcon: Icon(
                      //   Icons.keyboard_arrow_down,
                      //   color: AppColors.iconC4,
                      //   size: Sizer.height(24),
                      // ),
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(26),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rating: ',
                    style: AppTypography.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const YBox(10),
                  FilterCheckBox(
                    title: '4.5 & Up Above',
                    isSelected: selectedRating == 5,
                    onTap: () {
                      selectedRating = 5;
                      setState(() {});
                    },
                  ),
                  const YBox(10),
                  FilterCheckBox(
                    title: '4.0 & Up Above',
                    isSelected: selectedRating == 4,
                    onTap: () {
                      selectedRating = 4;
                      setState(() {});
                    },
                  ),
                  const YBox(10),
                  FilterCheckBox(
                    title: '3.5 & Up Above',
                    isSelected: selectedRating == 3,
                    onTap: () {
                      selectedRating = 3;
                      setState(() {});
                    },
                  ),
                  const YBox(10),
                  FilterCheckBox(
                    title: '3.0 & Up Above',
                    isSelected: selectedRating == 2,
                    onTap: () {
                      selectedRating = 2;
                      setState(() {});
                    },
                  ),
                ],
              ),
              const YBox(80),
              CustomBtn.solid(
                online: enableBtn(),
                onTap: _applyFilters,
                height: 50,
                borderRadius: BorderRadius.circular(Sizer.radius(100)),
                text: "Apply filters",
              ),
              const YBox(200),
            ],
          ),
        ),
      );
    });
  }

  bool enableBtn() {
    return selectedCategory != null ||
        selectedRating != null ||
        (minPriceC.text.isNotEmpty && maxPriceC.text.isNotEmpty);
  }

  _applyFilters() {
    FocusManager.instance.primaryFocus?.unfocus();
    final ref = context.read<ProductVM>();
    ref.getProductList(
      priceLower: minPriceC.text.trim().isNotEmpty
          ? minPriceC.text.trim().replaceAllCommas()
          : null,
      priceUpper: maxPriceC.text.trim().isNotEmpty
          ? maxPriceC.text.trim().replaceAllCommas()
          : null,
      category: selectedCategory?.id,
      rating: selectedRating?.toString(),
    );

    Navigator.pop(context);
  }
}

class FilterCheckBox extends StatelessWidget {
  const FilterCheckBox({
    super.key,
    this.isSelected = false,
    required this.title,
    this.onTap,
  });

  final bool isSelected;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCheckbox(
          isSelected: isSelected,
          onTap: onTap,
        ),
        const XBox(10),
        Text(
          title,
          style: AppTypography.text14.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.text57,
          ),
        ),
      ],
    );
  }
}
