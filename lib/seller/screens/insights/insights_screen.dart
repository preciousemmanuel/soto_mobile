import 'package:soto_ecommerce/common/common.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          child: Column(
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
              const AnalyticsCard(
                name: 'Total Revenue',
                revenue: '610k',
                percentage: '60% Increase from last month',
              ),
              const YBox(16),
              const AnalyticsCard(
                name: 'Total Sales',
                revenue: '500k',
                percentage: '40% Increase from Last Month',
                bgColor: AppColors.yellowE3,
                nameTextColor: AppColors.red33,
              ),
              const YBox(16),
              const AnalyticsCard(
                name: 'Best Selling Product',
                revenue: '420k',
                percentage: '60% Increase from last month',
                bgColor: AppColors.yellowF5,
                nameTextColor: AppColors.red40,
              ),
              const YBox(16),
              const AnalyticsCard(
                name: 'Total Buyer’s Demography',
                revenue: '6.7k',
                percentage: '60% Increase from last month',
                bgColor: AppColors.blueF9,
                nameTextColor: AppColors.blueDE,
              ),
              const YBox(16),
            ],
          ),
        ),
      ),
    );
  }
}
