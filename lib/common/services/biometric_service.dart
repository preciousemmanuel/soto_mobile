// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// // ignore: depend_on_referenced_packages
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:soto_ecommerce/core/core.dart';
// // ignore: depend_on_referenced_packages

// class BiometricService {
//   static final _auth = LocalAuthentication();

//   static Future<bool> hasBiometrics() async {
//     try {
//       return await _auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       printty(e.toString(), logLevel: 'Bio check');
//       return false;
//     }
//   }

//   static Future<bool> authenticate() async {
//     final isAvailable = await hasBiometrics();
//     if (!isAvailable) return false;

//     try {
//       return await _auth.authenticate(
//         authMessages: const <AuthMessages>[
//           AndroidAuthMessages(
//             cancelButton: 'No thanks',
//           ),
//           IOSAuthMessages(
//             cancelButton: 'No thanks',
//           ),
//         ],
//         options: const AuthenticationOptions(
//             useErrorDialogs: true, stickyAuth: false, biometricOnly: true),
//         localizedReason: 'User fingerprint to authorize action',
//       );
//     } on PlatformException catch (e) {
//       printty(e.code.toString(), logLevel: 'BiometricService');
//       return false;
//     }
//   }
// }
