import 'package:flutter/cupertino.dart';
import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/screens/products/vendor_product_details_screen.dart';
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
      case RoutePath.allProductsScreen:
        AllProductArgs? allProductArgs = args as AllProductArgs?;
        return buildRoute(AllProductsScreen(args: allProductArgs));
      case RoutePath.productCategoryScreen:
        if (args is ProductCatArg) {
          return buildRoute(ProductsCategoryScreen(args: args));
        }
        return errorScreen('Incorrect arguments for ${settings.name}');

      // Orders
      case RoutePath.createOrderScreen:
        return buildRoute(const CreateOrderScreen());
      case RoutePath.addOrderScreen:
        return buildRoute(const AddOrderScreen());
      case RoutePath.reviewOrderScreen:
        return buildRoute(const ReviewOrderScreen());
      case RoutePath.trackMyOrderScreen:
        return buildRoute(const TrackMyOrderScreen());

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
      case RoutePath.paymentMethodScreen:
        return buildRoute(const PaymentMethodScreen());
      case RoutePath.addCardScreen:
        return buildRoute(const AddCardScreen());

      // Shared
      case RoutePath.confirmationScreen:
        if (args is ConfirmationScreenArgs) {
          return buildRoute(ConfirmationScreen(args: args));
        }
        return errorScreen('Incorrect arguments for ${settings.name}');
      case RoutePath.customWebviewScreen:
        if (args is WebViewArg) {
          return buildRoute(CustomWebviewScreen(arg: args));
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
      case RoutePath.approvalScreen:
        return buildRoute(const ApprovalScreen());
      case RoutePath.vendorOtpScreen:
        return buildRoute(const VendorOtpScreen());

      case RoutePath.addProductScreen:
        return buildRoute(const AddProductScreen());
      case RoutePath.vendorProductListScreen:
        return buildRoute(const VendorProductListScreen());
      case RoutePath.vendorProductDetailsScreen:
        if (args is ProductArgs) {
          return buildRoute(VendorProductDetailsScreen(args: args));
        }
        return errorScreen('Incorrect arguments for ${settings.name}');

      case RoutePath.withdrawToBankScreen:
        return buildRoute(const WithdrawToBankScreen());
      case RoutePath.withdrawChooseAccount:
        return buildRoute(const WithdrawChooseAccount());
      case RoutePath.walletPaymentMethodScreen:
        return buildRoute(const WalletPaymentMethodScreen());

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
