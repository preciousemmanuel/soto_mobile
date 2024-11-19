import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/env/env_init.dart';

class AppInitService {
  init() async {
    //screen orientation
    await _screenOrientationInit();

    //firebase
    // await _firebaseInit();

    // Dotenv
    await dotenv.load(fileName: ".env");
    EnvMain().init(EnvMain.DEV);
  }

  // _firebaseInit() async {
  //   try {
  //     await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform,
  //     );
  //     printty("===> firebase initialized...");
  //   } catch (e) {
  //     printty(e.toString(), logLevel: 'Firebase Error check');
  //   }
  // }

  _screenOrientationInit() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    printty("===> screen orientation initialized...");
  }
}
