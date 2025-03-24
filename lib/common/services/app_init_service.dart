import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/env/env_init.dart';
import 'package:soto_ecommerce/firebase_options.dart';

class AppInitService {
  init(Future<void> Function(RemoteMessage) fcmBackgroundHandler) async {
    //screen orientation
    await _screenOrientationInit();

    //firebase
    await _firebaseInit();

    //fcm
    FirebasePushNotificationService.init(fcmBackgroundHandler);

    // Dotenv
    await dotenv.load(fileName: ".env");
    EnvMain().init(EnvMain.PROD);
  }

  _firebaseInit() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      printty("===> firebase initialized...");
    } catch (e) {
      printty(e.toString(), logName: 'Firebase Error check');
    }
  }

  _screenOrientationInit() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    printty("===> screen orientation initialized...");
  }
}
