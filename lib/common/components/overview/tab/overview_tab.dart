import 'package:fl_chart/fl_chart.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vendor_product_vm.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({
    super.key,
  });

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VendorProductVM>().getProductsByVendor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        children: [
          const YBox(24),
          const Row(
            children: [
              Expanded(child: OverViewStat()),
              XBox(10),
              Expanded(child: OverViewStat()),
            ],
          ),
          const YBox(24),
          SizedBox(
            height: Sizer.height(176),
            width: Sizer.screenWidth,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: AppColors.grayE8,
            //     ),
            //     borderRadius: BorderRadius.circular(
            //       Sizer.radius(6),
            //     )),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const tiles = [
                            'Aug.',
                            'Sept.',
                            'Oct.',
                            'Nov.',
                            'Dec.',
                            'Jan.',
                            'Feb.'
                          ];
                          final index = value.toInt();
                          if (index >= 0 && index < tiles.length) {
                            return Text(
                              tiles[index],
                              style: const TextStyle(color: Colors.grey),
                            );
                          }
                          return const Text("");
                        },
                        reservedSize: 22,
                        interval: 1),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 2),
                      const FlSpot(1, 1),
                      const FlSpot(2, 4),
                      const FlSpot(4, 3),
                      const FlSpot(5, 4),
                      const FlSpot(6, 6),
                    ],
                    isCurved: true,
                    color: AppColors.primaryOrange,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.primaryOrange.withOpacity(0.07),
                    ),
                  )
                ],
              ),
            ),
          ),
          const YBox(20),
          Homeheader(
            headerName: 'Products',
            addPadding: false,
            headerFontSize: Sizer.text(16),
            sellAllBtn: () {
              Navigator.pushNamed(context, RoutePath.vendorProductListScreen);
            },
          ),
          const YBox(16),
          Consumer<VendorProductVM>(builder: (context, ref, _) {
            if (ref.isBusy) {
              return const SizerLoader();
            }
            if (ref.productsByVendor.isEmpty) {
              return const EmptyListState(
                height: 200,
                text: 'No products found',
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return OverviewProductTile(
                  product: ref.productsByVendor[i],
                );
              },
              separatorBuilder: (_, __) => const Divider(
                color: AppColors.whiteF7,
              ),
              itemCount: ref.productsByVendor.length,
            );
          }),
          const YBox(100),
        ],
      ),
    );
  }
}
