import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VendorDashboardVM>().getSalesAnalytics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VendorDashboardVM>(builder: (context, ref, _) {
      return SizedBox(
        width: Sizer.screenWidth,
        height: Sizer.screenHeight,
        child: BusyOverlay(
          show: ref.busy(salesAnalyticsState),
          child: Scaffold(
            body: SafeArea(
              bottom: false,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizer.width(20),
                ),
                child: ListView(
                  children: [
                    const YBox(20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sales Analytics',
                        style: AppTypography.text20.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const YBox(20),
                    AnalyticsCard(
                      name: 'Total Revenue',
                      revenue: AppUtils.formatAmountString(
                          (ref.salesAnalytics?.revenue?.total ?? 0).toString()),
                      percentage:
                          '${ref.salesAnalytics?.revenue?.percentage ?? 0}% Increase from last month',
                    ),
                    const YBox(16),
                    AnalyticsCard(
                      name: 'Total Sales',
                      revenue: AppUtils.formatAmountString(
                          (ref.salesAnalytics?.sales?.total ?? 0).toString()),
                      percentage:
                          '${ref.salesAnalytics?.sales?.percentage ?? 0}% Increase from Last Month',
                      bgColor: AppColors.yellowE3,
                      nameTextColor: AppColors.primaryOrange,
                    ),
                    const YBox(16),
                    AnalyticsCard(
                      name: 'Best Selling Product',
                      revenue: AppUtils.formatAmountString(
                          (ref.salesAnalytics?.bestSeller?.total ?? 0)
                              .toString()),
                      percentage:
                          '${ref.salesAnalytics?.bestSeller?.percentage ?? 0}% Increase from last month',
                      bgColor: AppColors.yellowF5,
                      nameTextColor: AppColors.red40,
                    ),
                    const YBox(16),
                    // const AnalyticsCard(
                    //   name: 'Total Buyer’s Demography',
                    //   revenue: '6.7k',
                    //   percentage: '60% Increase from last month',
                    //   bgColor: AppColors.blueF9,
                    //   nameTextColor: AppColors.blueDE,
                    // ),
                    // const YBox(16),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
