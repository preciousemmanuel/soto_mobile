import 'package:soto_ecommerce/common/common.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  OverviewCategoryType categoryType = OverviewCategoryType.overview;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizer.screenWidth,
      height: Sizer.screenHeight,
      child: BusyOverlay(
        show: false,
        child: Scaffold(
          backgroundColor: AppColors.bgWhite,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const YBox(20),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizer.width(20),
                  ),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: Sizer.height(50),
                            width: Sizer.width(50),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Sizer.width(32)),
                              child: imageHelper(AppImages.avatar),
                            ),
                          ),
                          const XBox(8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ClassyXly',
                                style: AppTypography.text16.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Make sales today',
                                style: AppTypography.text12.copyWith(
                                  color: AppColors.black66,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutePath.addProductScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizer.width(10),
                                vertical: Sizer.height(7),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(
                                  Sizer.radius(100),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.note_2,
                                    color: AppColors.white,
                                    size: Sizer.width(14),
                                  ),
                                  const XBox(2),
                                  Text(
                                    'Add Product',
                                    style: AppTypography.text10.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const XBox(10),
                          NotificationIocnWidget(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutePath.notificationScreen);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const YBox(24),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizer.width(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      OverviewCategoryType.values.length,
                      (i) => StatusWidget(
                          text: OverviewCategoryType.values[i].name,
                          isSelected:
                              categoryType == OverviewCategoryType.values[i],
                          textStyle: AppTypography.text14.copyWith(
                            color:
                                (categoryType == OverviewCategoryType.values[i])
                                    ? AppColors.white
                                    : AppColors.text57,
                            fontWeight: FontWeight.w500,
                          ),
                          onTap: () {
                            categoryType = OverviewCategoryType.values[i];
                            setState(() {});
                          }),
                    ),
                  ),
                ),
                if (categoryType == OverviewCategoryType.overview)
                  const OverviewTab(),
                if (categoryType == OverviewCategoryType.inventory)
                  const InventoryTab(),
                if (categoryType == OverviewCategoryType.transactions)
                  const TransactionsTab(),
              ],
            ),
          ),
          floatingActionButton: categoryType == OverviewCategoryType.overview
              ? InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutePath.addProductScreen);
                  },
                  child: Container(
                    height: Sizer.height(60),
                    width: Sizer.width(60),
                    decoration: BoxDecoration(
                        gradient: AppColors.fabGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ]),
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: Sizer.radius(30),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
