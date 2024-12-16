import 'dart:convert';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:soto_ecommerce/common/common.dart';

class LocalPushNotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future init({bool schedule = false}) async {
    printty("Local noty init");
    //android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher_foreground');

    //ios
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    //initialize
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // request notification permissions for android 13 or above
    if (Platform.isAndroid) {
      _notifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    }

    _notifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  static onDidReceiveNotificationResponse(NotificationResponse response) async {
    printty("Notification clicked:  ${response.payload.toString()}");

    try {
      if (response.payload != null) {
        Map<String, dynamic> payload = json.decode(response.payload!);
        PushNotificationRouterService.router(
            payload, NavKey.appNavigatorKey.currentContext!);
        return;
      }
      // NavigatorKeys.appNavigatorKey.currentState
      //     ?.push(MaterialPageRoute(builder: (_) => const DashboardNav()));
    } catch (e, s) {
      // something went wrong for any reason, go back to home screen
      printty("OnClickNotificationError: ${e.toString()}");
      printty("OnClickNotificationStrace: ${s.toString()}");

      // NavigatorKeys.appNavigatorKey.currentState
      //     ?.push(MaterialPageRoute(builder: (_) => const DashboardNav()));
    }
  }

  static Future showNotification(
      {var id = 0,
      required String title,
      required String body,
      dynamic payload}) async {
    return _notifications.show(id, title, body, await notificationDetails(),
        payload: payload);
  }

  static notificationDetails() async {
    String channelId = DateTime.now().toIso8601String();
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelId,
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        // largeIcon: attachmentPath != null
        //     ? FilePathAndroidBitmap(attachmentPath)
        //     : null,
      ),
    );
  }

  // static Future downloadFilez(String url, String name) async {
  //   var dir = await getApplicationDocumentsDirectory();
  //   var imageDownloadPath = '${dir.path}/$name';
  //   var res = await http.get(Uri.parse(url));
  //   File file = File(imageDownloadPath);
  //   await file.writeAsBytes(res.bodyBytes);
  //   return imageDownloadPath;
  // }
}
