// ignore_for_file: use_build_context_synchronously

import 'package:soto_ecommerce/buyer/screens/auth/login_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();

    Future.delayed(const Duration(seconds: 4), () async {
      if (await StorageService.getBoolItem(StorageKey.vendorUser) != null) {
        Navigator.pushReplacementNamed(
          context,
          RoutePath.loginScreen,
          arguments: LoginScreenArgs(isVendor: true),
        );
        return;
      }
      if (await StorageService.getBoolItem(StorageKey.onboarding) == true) {
        Navigator.pushReplacementNamed(context, RoutePath.dashboardNavScreen);
      } else {
        Navigator.pushReplacementNamed(context, RoutePath.onboardScreenOne);
      }
    });
  }

  @override
  void deactivate() {
    _animationController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBg,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageHelper(
                AppImages.logo,
                height: Sizer.height(238),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
