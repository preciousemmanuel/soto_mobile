// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:device_information/device_information.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/services.dart';
// import 'package:get_ip_address/get_ip_address.dart';
// import 'package:korrency/core/core.dart';

// class HeaderService {
//   String? deviceId;
//   String? deviceType;
//   String? deviceName;
//   String? notification;

//   getDeviceInfo() async {
//     if (Platform.isIOS) {
//       printty("ios_______");
//       StorageService.storeStringItem(
//           StorageKey.deviceId, await DeviceInformation.deviceIMEINumber);
//       StorageService.storeStringItem(StorageKey.deviceType, "IOS");
//       StorageService.storeStringItem(
//           StorageKey.deviceName, await DeviceInformation.deviceName);
//       StorageService.storeStringItem(
//           StorageKey.deviceModel, await DeviceInformation.deviceManufacturer);
//       // await DeviceInformation().de

//       // final devices = await apiService.getDeviceHeaders();
//       // printty(devices.toString());
//       // await deviceInformation();
//     }
//     if (Platform.isAndroid) {
//       printty("andriod_______");
//       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       StorageService.storeStringItem(StorageKey.deviceId, androidInfo.id);
//       StorageService.storeStringItem(StorageKey.deviceType, "Android");
//       StorageService.storeStringItem(StorageKey.deviceName, androidInfo.model);
//       StorageService.storeStringItem(StorageKey.deviceModel, androidInfo.model);
//     }
//     try {
//       /// Initialize Ip Address
//       var ipAddress = IpAddress(type: RequestType.json);

//       /// Get the IpAddress based on requestType.
//       dynamic data = await ipAddress.getIpAddress();
//       StorageService.storeStringItem(StorageKey.ipAddress, data["ip"]);
//     } on IpAddressException catch (_) {}
//   }

//   deviceInformation() async {
//     printty("=======+++++++++");
//     try {
//       String platformVersion = await DeviceInformation.platformVersion;
//       String imeiNo = await DeviceInformation.deviceIMEINumber;
//       String modelName = await DeviceInformation.deviceModel;
//       String manufacturer = await DeviceInformation.deviceManufacturer;
//       String apiLevel = await DeviceInformation.apiLevel;
//       String deviceName = await DeviceInformation.deviceName;
//       String productName = await DeviceInformation.productName;
//       String cpuType = await DeviceInformation.cpuName;
//       String hardware = await DeviceInformation.hardware;
//       printty("device information: ======>");
//       printty(platformVersion.toString());
//       printty(imeiNo.toString());
//       printty(modelName.toString());
//       printty(manufacturer.toString());
//       printty(apiLevel.toString());
//       printty(deviceName.toString());
//       printty(productName.toString());
//       printty(cpuType.toString());
//       printty(hardware.toString());
//       printty("device information: 1111");
//     } on PlatformException {
//       printty("&&&&&&&&&&&&&");
//       'Failed to get platform version.';
//     } catch (e) {
//       printty("+++++++++++++");
//       printty(e.toString());
//     }
//   }
// }

// class FCMTokenService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<String?> getToken() async {
//     var storagePref = StorageService.getStringItem(StorageKey.deviceToken);

//     if (await storagePref != null && await storagePref != "") {
//       printty("Token already exists ${await storagePref}");
//       return storagePref;
//     }

//     try {
//       String? token = await _firebaseMessaging.getToken();
//       if (token != null) {
//         StorageService.storeStringItem(StorageKey.deviceToken, token);
//       }
//       printty("FCM token: $token");
//       return token;
//     } catch (e) {
//       printty("Error getting FCM token: $e");
//       return null;
//     }
//   }
// }
