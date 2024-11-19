import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgF5,
      appBar: const CustomHeader(
        title: 'Help Center',
        titleWeight: FontWeight.w500,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const YBox(25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Sizer.width(20)),
              child: TabBar(
                controller: _tabController,
                labelColor: AppColors.primaryOrange,
                dividerColor: AppColors.transparent,
                unselectedLabelColor: AppColors.text12,
                splashFactory: NoSplash.splashFactory,
                indicatorColor: AppColors.primaryOrange,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0.5,
                labelStyle: AppTypography.text16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                // indicator: const UnderlineTabIndicator(
                //   borderSide: BorderSide(
                //       // width: 2.0,
                //       color:
                //           AppColors.primaryOrange), // Adjust the width and color
                //   // insets: EdgeInsets.symmetric(
                //   //     horizontal: 16.0), // Adjust the horizontal padding
                // ),
                tabs: const [
                  Tab(text: 'FAQs'),
                  Tab(text: 'Contact us'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FAQTabView(),
                  ContactUsTabView(),
                ],
              ),
            ),
            const YBox(100),
          ],
        ),
      ),
    );
  }
}
