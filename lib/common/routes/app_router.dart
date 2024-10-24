import 'package:flutter/cupertino.dart';
import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/buyer/ui/screens/dashboard/order/review_order_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    CupertinoPageRoute buildRoute(Widget widget) =>
        CupertinoPageRoute(builder: (_) => widget);

    switch (settings.name) {
      case RoutePath.splashScreen:
        return buildRoute(const SplashScreen());
      case RoutePath.onboardScreenOne:
        return buildRoute(const OnboardScreenOne());
      case RoutePath.onboardScreenTwo:
        return buildRoute(const OnboardScreenTwo());
      case RoutePath.onboardScreenThree:
        return buildRoute(const OnboardScreenThree());

      // Auth
      case RoutePath.loginScreen:
        return buildRoute(const DashboardNav());
      case RoutePath.createAccountScreen:
        return buildRoute(const NotificationScreen());
      case RoutePath.forgotPasswordScreen:
        bool isChangePassword = args is bool ? args : false;
        return buildRoute(ForgotPasswordScreen(
          isChangePassword: isChangePassword,
        ));
      case RoutePath.shippingAddressScreen:
        return buildRoute(const ShippingAddressScreen());

      case RoutePath.dashboardNavScreen:
        return buildRoute(const DashboardNav());
      case RoutePath.notificationScreen:
        return buildRoute(const NotificationScreen());
      case RoutePath.productDetailScreen:
        return buildRoute(const ProductDetailsScreen());

      // Orders
      case RoutePath.createOrderScreen:
        return buildRoute(const CreateOrderScreen());
      case RoutePath.addOrderScreen:
        return buildRoute(const AddOrderScreen());
      case RoutePath.reviewOrderScreen:
        return buildRoute(const ReviewOrderScreen());

      // Cart
      case RoutePath.checkoutScreen:
        return buildRoute(const ConfirmPaymentScreen());
      case RoutePath.confirmPaymentScreen:
        return buildRoute(const ConfirmPaymentScreen());
      case RoutePath.checkoutPaymentScreen:
        return buildRoute(const CheckoutPaymentScreen());

      // Profile
      case RoutePath.editMyProfileScreen:
        return buildRoute(const MyProfileScreenEdit());
      case RoutePath.helpCenterScreen:
        return buildRoute(const HelpCenterScreen());

      default:
        return errorScreen('No route defined for ${settings.name}');
    }
  }

  static CupertinoPageRoute errorScreen(String msg) {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(msg),
        ),
      ),
    );
  }
}
