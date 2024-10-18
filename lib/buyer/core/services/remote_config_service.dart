// import 'dart:developer';

// import 'package:firebase_remote_config/firebase_remote_config.dart';

// class RemoteConfigService {
//   final remoteConfig = FirebaseRemoteConfig.instance;

//   Future<void> init() async {
//     try {
//       await remoteConfig.setConfigSettings(RemoteConfigSettings(
//           fetchTimeout: const Duration(seconds: 1),
//           minimumFetchInterval: const Duration(seconds: 1)));

//       await remoteConfig.fetchAndActivate();
//       // final appText = remoteConfig.getString("korrency");
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
