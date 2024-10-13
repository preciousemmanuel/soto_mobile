import 'package:soto_ecommerce/lib.dart';

class DashboardNav extends StatefulWidget {
  const DashboardNav({
    super.key,
    this.index,
  });

  final int? index;

  @override
  State<DashboardNav> createState() => _DashboardNavState();
}

class _DashboardNavState extends State<DashboardNav> {
  int currentIndex = 0;

  List screens = [
    const HomeScreen(),
    const OrderScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
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
                icon: currentIndex == 0 ? Iconsax.home_25 : Iconsax.home,
                isActive: currentIndex == 0,
                labelText: 'Home',
                onPressed: () {
                  currentIndex = 0;
                  setState(() {});
                },
              ),
              BottomNavColumn(
                icon: currentIndex == 1 ? AppSvgs.orderSolid : AppSvgs.order,
                isActive: currentIndex == 1,
                labelText: 'Orders',
                onPressed: () {
                  currentIndex = 1;
                  setState(() {});
                },
              ),
              BottomNavColumn(
                icon: currentIndex == 2 ? AppSvgs.cartSolid : AppSvgs.cart,
                isActive: currentIndex == 2,
                labelText: 'Cart',
                onPressed: () {
                  currentIndex = 2;
                  setState(() {});
                },
              ),
              BottomNavColumn(
                icon: currentIndex == 3 ? Iconsax.heart5 : Iconsax.heart,
                isActive: currentIndex == 3,
                labelText: 'Favorite',
                onPressed: () {
                  currentIndex = 3;
                  setState(() {});
                },
              ),
              BottomNavColumn(
                icon:
                    currentIndex == 4 ? AppSvgs.profileSolid : AppSvgs.profile,
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
    );
  }
}
