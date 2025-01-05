import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/buyer/screens/dashboard/order/track_my_order_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
    required this.args,
  });

  final OrderDetailArg args;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: CustomHeader(
        title: 'Buyer Order Details',
        titleWeight: FontWeight.w500,
        titleStyle: AppTypography.text16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.text12,
        ),
      ),
      body: Column(
        children: [
          const YBox(26),
          Container(
            height: Sizer.height(38),
            width: Sizer.screenWidth,
            margin: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(5),
              vertical: Sizer.height(4),
            ),
            decoration: BoxDecoration(
              color: AppColors.grayF7,
              borderRadius: BorderRadius.circular(Sizer.radius(12)),
            ),
            child: TabBar(
              splashBorderRadius: BorderRadius.circular(Sizer.radius(12)),
              physics: const NeverScrollableScrollPhysics(),
              onTap: (int value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizer.radius(8)),
                color: AppColors.primaryOrange,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.white,
              automaticIndicatorColorAdjustment: true,
              labelStyle: GoogleFonts.poppins(
                fontSize: Sizer.text(14),
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                color: AppColors.black33,
                fontSize: Sizer.text(14),
                fontWeight: FontWeight.w600,
              ),
              controller: _tabController,
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Track Order'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                OrderDetailsOverviewTab(
                  buyerOrder: widget.args.buyerOrder ?? OrderRes(),
                ),
                TrackMyOrderScreen(args: widget.args)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
