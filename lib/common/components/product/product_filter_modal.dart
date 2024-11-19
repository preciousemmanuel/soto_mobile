import 'package:soto_ecommerce/common/common.dart';

class ProductFilterModal extends StatefulWidget {
  const ProductFilterModal({super.key});

  @override
  State<ProductFilterModal> createState() => _ProductFilterModalState();
}

class _ProductFilterModalState extends State<ProductFilterModal> {
  List<String> ratings = [
    '4.5 & Up Above',
    '4.0 & Up Above',
    '3.5 & Up Above',
    '3.0 & Up Above',
  ];
  List<String> selectedCategories = [];
  List<String> selectedRatings = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductVM>(builder: (ctx, vm, _) {
      return Container(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        isSelected: selectedCategories.contains(
                          vm.productCategories[v].name!,
                        ),
                        onTap: () {
                          if (selectedCategories.contains(
                            vm.productCategories[v].name!,
                          )) {
                            selectedCategories
                                .remove(vm.productCategories[v].name!);
                          } else {
                            selectedCategories
                                .add(vm.productCategories[v].name!);
                          }
                          setState(() {});
                        },
                      );
                    },
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
                        fillColor: AppColors.transparent,
                        borderColor: AppColors.base9A,
                        hintText: 'Min. Price',
                        showSuffixIcon: true,
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.iconC4,
                          size: Sizer.height(24),
                        ),
                        onChanged: (val) {},
                      ),
                    ),
                    const XBox(40),
                    Expanded(
                      child: CustomTextField(
                        fillColor: AppColors.transparent,
                        borderColor: AppColors.base9A,
                        hintText: 'Max. Price',
                        showSuffixIcon: true,
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.iconC4,
                          size: Sizer.height(24),
                        ),
                        onChanged: (val) {},
                      ),
                    ),
                  ],
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
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) => FilterCheckBox(
                    title: ratings[i],
                    isSelected: selectedRatings.contains(ratings[i]),
                    onTap: () {
                      if (selectedRatings.contains(ratings[i])) {
                        selectedRatings.remove(ratings[i]);
                      } else {
                        selectedRatings.add(ratings[i]);
                      }
                      setState(() {});
                    },
                  ),
                  separatorBuilder: (ctx, i) => const YBox(16),
                  itemCount: ratings.length,
                )
              ],
            ),
            const Spacer(),
            CustomBtn.solid(
              onTap: () {},
              height: 50,
              borderRadius: BorderRadius.circular(Sizer.radius(100)),
              text: "Apply filters",
            ),
            const YBox(40),
          ],
        ),
      );
    });
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
