// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:korrency/core/core.dart';

// class FirebasePushNotificationService {
//   static final _firebaseMessaging = FirebaseMessaging.instance;
//   static Future init(
//     Future<void> Function(RemoteMessage) backgroundHandler,
//   ) async {
//     printty("===> fcm initializing......");

//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: true,
//       provisional: false,
//       sound: true,
//     );

//     // Listen to background notifications
//     FirebaseMessaging.onBackgroundMessage(backgroundHandler);

//     // to handle foreground notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       printty('Got a message whilst in the foreground!');
//       printty('Message title: ${message.notification?.title.toString()}');
//       printty('Message body: ${message.notification?.body.toString()}');
//       printty('Message data: ${message.data.toString()}');

//       _handleMessage(message);
//     });

//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//         await _firebaseMessaging.getInitialMessage();

//     // If the message also contains a data property with a "type" of "chat",
//     // navigate to a chat screen
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }

//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }

//   static Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     // print('Handling a background message ${message.messageId}');
//     _handleMessage(message);
//     //print('Handling a background message ${message.messageId}');
//   }

//   static Future<String?> getFcmToken() async {
//     return await _firebaseMessaging.getToken();
//   }

//   static Future<String?> getAPNToken() async {
//     return await _firebaseMessaging.getAPNSToken();
//   }

//   static subscribeAndUnsubscribeToTopic(
//       {required String topic, required bool subscribe}) async {
//     subscribe
//         ? await _firebaseMessaging.subscribeToTopic(topic)
//         : await _firebaseMessaging.unsubscribeFromTopic(topic);
//   }

//   static _handleMessage(RemoteMessage message) {
//     LocalPushNotificationService.showNotification(
//         title: message.notification?.title ?? "Korrency",
//         body: message.notification?.body ??
//             "You have a notification from Korrency",
//         payload: json.encode(message.data));
//   }
// }
