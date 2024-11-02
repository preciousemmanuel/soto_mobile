import 'package:flutter/cupertino.dart';
import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/seller.dart';

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

      // Auth
      case RoutePath.loginScreen:
        final LoginScreenArgs? loginScreenArgs = args as LoginScreenArgs?;
        return buildRoute(LoginScreen(
          args: loginScreenArgs,
        ));
      case RoutePath.createAccountScreen:
        return buildRoute(const CreateAccountScreen());
      case RoutePath.changeOrForgotPasswordScreen:
        if (args is PasswordScreenArgs) {
          return buildRoute(ChangeOrForgotPasswordScreen(args: args));
        }
        return errorScreen('Incorrect arguments for ${settings.name}');
      case RoutePath.shippingAddressScreen:
        return buildRoute(const ShippingAddressScreen());

      case RoutePath.dashboardNavScreen:
        final DashArg dashArgs =
            args == null ? DashArg(index: 0) : args as DashArg;
        return buildRoute(DashboardNav(args: dashArgs));
      case RoutePath.notificationScreen:
        return buildRoute(const NotificationScreen());
      case RoutePath.productDetailScreen:
        if (args is ProductArgs) {
          return buildRoute(ProductDetailsScreen(args: args));
        }
        return errorScreen('Incorrect arguments for ${settings.name}');

      // Orders
      case RoutePath.createOrderScreen:
        return buildRoute(const CreateOrderScreen());
      case RoutePath.addOrderScreen:
        return buildRoute(const AddOrderScreen());
      case RoutePath.reviewOrderScreen:
        return buildRoute(const ReviewOrderScreen());

      // Cart
      case RoutePath.checkoutScreen:
        return buildRoute(const CheckoutScreen());
      case RoutePath.confirmPaymentScreen:
        return buildRoute(const ConfirmPaymentScreen());
      case RoutePath.checkoutPaymentScreen:
        return buildRoute(const CheckoutPaymentScreen());

      // Profile
      case RoutePath.editMyProfileScreen:
        return buildRoute(const MyProfileScreenEdit());
      case RoutePath.helpCenterScreen:
        return buildRoute(const HelpCenterScreen());

      // Shared
      case RoutePath.confirmationScreen:
        if (args is ConfirmationScreenArgs) {
          return buildRoute(ConfirmationScreen(args: args));
        }
        return errorScreen('Incorrect arguments for ${settings.name}');

      /// SELLER ROUTES
      case RoutePath.sellerDashboardNavScreen:
        return buildRoute(const SellersDashboardNav());
      case RoutePath.allTransactionsScreen:
        return buildRoute(const AllTransactionsScreen());
      case RoutePath.createBusinessAccountScreen:
        return buildRoute(const CreateBusinessAccountScreen());
      case RoutePath.createPasswordScreen:
        return buildRoute(const CreatePasswordScreen());

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
