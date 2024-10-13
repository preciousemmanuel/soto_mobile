
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class AppInitService {
//   init(Future<void> Function(RemoteMessage) fcmBackgroundHandler) async {
//     //screen orientation
//     await _screenOrientationInit();

//     //firebase
//     await _firebaseInit();

//     // Dotenv
//     await dotenv.load(fileName: ".env");
//     EnvMain().init(EnvMain.DEV);

//     //fcm
//     FirebasePushNotificationService.init(fcmBackgroundHandler);

//     // Sec Init
//     await secondaryInit();
//   }

//   secondaryInit() async {
//     printty("secondaryInit======");
//     // remote config
//     // await RemoteConfigService().init();

//     //push notification
//     LocalPushNotificationService.init();

//     //package info
//     _packageInfoInit();

//     //header info service
//     await HeaderService().getDeviceInfo();

//     // AppsflyerService
//     AppsflyService.init();
//   }

//   _packageInfoInit() async {
//     try {
//       // TODO: Remember to set this globally
//       PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       await StorageService.storeStringItem(
//           StorageKey.appVersion, packageInfo.version ?? "1.0.0");
//       printty("===> package info initialized...");
//     } catch (e) {
//       printty(e.toString());
//     }
//   }

//   _firebaseInit() async {
//     try {
//       await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//       );
//       printty("===> firebase initialized...");
//     } catch (e) {
//       printty(e.toString(), logLevel: 'Firebase Error check');
//     }
//   }

//   _crashlyticsInit() async {
//     FlutterError.onError = (errorDetails) {
//       FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//     };
//     // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//     PlatformDispatcher.instance.onError = (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       return true;
//     };
//     printty("===> crashlytics initialized...");
//   }

//   _screenOrientationInit() async {
//     await SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     printty("===> screen orientation initialized...");
//   }
// }
