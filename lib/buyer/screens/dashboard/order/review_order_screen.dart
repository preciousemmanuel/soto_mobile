import 'package:soto_ecommerce/common/common.dart';

class ReviewOrderScreen extends StatefulWidget {
  const ReviewOrderScreen({super.key});

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  List<CustomOrderRes> customOrders = [];
  List<CustomOrderRes> selectedCustomOrders = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  _init() async {
    context.read<CustomOrderVm>().getCustomOrderFromStorage().then((v) {
      if (v.isNotEmpty) {
        customOrders = v;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomOrderVm>(builder: (_, vm, __) {
      return BusyOverlay(
        show: vm.isBusy,
        child: Scaffold(
          backgroundColor: AppColors.bgWhite,
          appBar: const CustomHeader(
            title: 'Review Order',
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            child: Column(
              children: [
                const YBox(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Added',
                      style: AppTypography.text14.copyWith(
                        color: AppColors.gray8D,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedCustomOrders.addAll(customOrders);
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizer.width(10),
                          vertical: Sizer.height(4),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.iconC4.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(Sizer.radius(8)),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.tick_square,
                              size: Sizer.radius(18),
                              color: AppColors.text20,
                            ),
                            const XBox(4),
                            Text(
                              'Select All',
                              style: AppTypography.text10.copyWith(
                                color: AppColors.text20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const YBox(16),
                Expanded(
                  child: Builder(builder: (context) {
                    if (customOrders.isEmpty) {
                      return const EmptyListState(
                        text: 'No order found',
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        bottom: Sizer.height(100),
                      ),
                      itemBuilder: (_, i) {
                        final item = customOrders[i];
                        return InkWell(
                          onTap: () {
                            selectedCustomOrders.contains(item)
                                ? selectedCustomOrders.remove(item)
                                : selectedCustomOrders.add(item);

                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectedCustomOrders.contains(item)
                                    ? AppColors.black
                                    : AppColors.baseF9,
                                borderRadius:
                                    BorderRadius.circular(Sizer.radius(8)),
                                border: Border.all(
                                  color: AppColors.gray8D,
                                )),
                            child: ReviewCustomOrderTable(
                              titleColor: selectedCustomOrders.contains(item)
                                  ? AppColors.white
                                  : null,
                              color: item.color ?? '',
                              size: item.size ?? '',
                              qty: item.quantity.toString(),
                              priceRange:
                                  '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(item.minPrice.toString())} - ${AppUtils.nairaSymbol}${AppUtils.formatAmountString(item.maxPrice.toString())}',
                              productBrand: 'Product Brand',
                              productName: item.productName ?? '',
                              type: item.type ?? '',
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const YBox(16),
                      itemCount: customOrders.length,
                    );
                  }),
                ),
                CustomBtn.solid(
                  height: Sizer.height(50),
                  onTap: _createCustomOrder,
                  text: "Submit",
                ),
                const YBox(40),
              ],
            ),
          ),
        ),
      );
    });
  }

  _createCustomOrder() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final ref = context.read<CustomOrderVm>();
    ApiResponse response = await ref.createCustomOrder(
      selectedCustomOrders,
    );

    handleApiResponse(
        response: response,
        onSuccess: () {
          ref.clearCustomOrderFromStorage();
          Navigator.pop(context);
        });
  }
}
