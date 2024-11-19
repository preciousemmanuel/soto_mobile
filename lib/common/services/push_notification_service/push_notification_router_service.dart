// // ignore_for_file: use_build_context_synchronously

// import 'package:korrency/core/core.dart';
// import 'package:korrency/ui/screens/screens.dart';

// class PushNotificationRouterService {
//   static router(Map<String, dynamic> data, BuildContext context) async {
//     var authUser = await StorageService.getUser();
//     // if (data["type"]?.toLowerCase() == "offer") {
//     //   Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //           builder: (context) => AcceptDealOfferSummaryScreen(
//     //                 data: AcceptOfferData(offerId: data["id"], isOwner: false),
//     //               )));
//     //   return;
//     // }
//     if (GlobalVar.activeRoute == null || authUser == null) {
//       return Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const LoginScreen()));
//     }
//     Navigator.pushNamed(context, RoutePath.dashboardNav);
//   }
// }
