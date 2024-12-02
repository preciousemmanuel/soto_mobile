import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/screens/screens.dart';

class SellersDashboardNav extends StatefulWidget {
  const SellersDashboardNav({
    super.key,
    this.index,
  });

  final int? index;

  @override
  State<SellersDashboardNav> createState() => _SellersDashboardNavState();
}

class _SellersDashboardNavState extends State<SellersDashboardNav> {
  int currentIndex = 0;

  List screens = [
    const OverviewScreen(),
    const VendorOrderScreen(),
    const WalletScreen(),
    const InsightScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthUserVM>().getUserProfile(
            busyObjectName: AuthUserVM.dashboardLoading,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BusyOverlay(
        show: context.watch<AuthUserVM>().busy(AuthUserVM.dashboardLoading),
        child: Scaffold(
          body: screens[currentIndex],
          backgroundColor: AppColors.bgWhite,
          bottomNavigationBar: Container(
            height: Sizer.height(84),
            padding: EdgeInsets.only(
              bottom: Sizer.height(10),
            ),
            decoration: BoxDecoration(
              color: AppColors.bgWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavColumn(
                  icon: currentIndex == 0 ? Iconsax.category : Iconsax.category,
                  isActive: currentIndex == 0,
                  labelText: 'Overview',
                  onPressed: () {
                    currentIndex = 0;
                    setState(() {});
                  },
                ),
                BottomNavColumn(
                  icon: currentIndex == 1 ? Iconsax.bag : Iconsax.bag,
                  isActive: currentIndex == 1,
                  labelText: 'Orders',
                  onPressed: () {
                    currentIndex = 1;
                    setState(() {});
                  },
                ),
                BottomNavColumn(
                  icon: Iconsax.wallet_3,
                  isActive: currentIndex == 2,
                  labelText: 'Wallet',
                  onPressed: () {
                    currentIndex = 2;
                    setState(() {});
                  },
                ),
                BottomNavColumn(
                  icon: Iconsax.chart_1,
                  isActive: currentIndex == 3,
                  labelText: 'Insights',
                  onPressed: () {
                    currentIndex = 3;
                    setState(() {});
                  },
                ),
                BottomNavColumn(
                  icon: currentIndex == 4
                      ? AppSvgs.profileSolid
                      : AppSvgs.profile,
                  isActive: currentIndex == 4,
                  labelText: 'Profile',
                  onPressed: () {
                    currentIndex = 4;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
