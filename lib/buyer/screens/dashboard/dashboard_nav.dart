import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class DashArg {
  final int? index;
  DashArg({this.index});
}

class DashboardNav extends StatefulWidget {
  const DashboardNav({
    super.key,
    this.args,
  });

  final DashArg? args;

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
    if (widget.args?.index != null) {
      currentIndex = widget.args!.index!;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  _init() async {
    final vm = context.read<AuthUserVM>();
    final notyVm = context.read<NotificationVm>();
    if (await StorageService.getString(StorageKey.accessToken) != null) {
      vm.getUserProfile(busyObjectName: AuthUserVM.dashboardLoading);
      notyVm.fetchNotifications();
      _getCartFromStorage();
    }
  }

  _getCartFromStorage() {
    final vm = context.read<OrderVM>();
    vm.getCartFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Consumer<AuthUserVM>(
        builder: (context, vm, _) {
          return BusyOverlay(
            show: vm.busy(AuthUserVM.dashboardLoading),
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
                      icon: currentIndex == 1
                          ? AppSvgs.orderSolid
                          : AppSvgs.order,
                      isActive: currentIndex == 1,
                      labelText: 'Orders',
                      onPressed: () {
                        if (vm.authUser == null) {
                          return ModalWrapper.showCustomDialog(
                            context,
                            child: const SignupAlertModal(),
                          );
                        }
                        currentIndex = 1;
                        setState(() {});
                      },
                    ),
                    BottomNavColumn(
                      icon:
                          currentIndex == 2 ? AppSvgs.cartSolid : AppSvgs.cart,
                      isActive: currentIndex == 2,
                      labelText: 'Cart',
                      onPressed: () {
                        if (vm.authUser == null) {
                          return ModalWrapper.showCustomDialog(
                            context,
                            child: const SignupAlertModal(),
                          );
                        }
                        currentIndex = 2;
                        setState(() {});
                      },
                    ),
                    BottomNavColumn(
                      icon: currentIndex == 3 ? Iconsax.heart5 : Iconsax.heart,
                      isActive: currentIndex == 3,
                      labelText: 'Favorite',
                      onPressed: () {
                        if (vm.authUser == null) {
                          return ModalWrapper.showCustomDialog(
                            context,
                            child: const SignupAlertModal(),
                          );
                        }
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
                        if (vm.authUser == null) {
                          return ModalWrapper.showCustomDialog(
                            context,
                            child: const SignupAlertModal(),
                          );
                        }
                        currentIndex = 4;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
