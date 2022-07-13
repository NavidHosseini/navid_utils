// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';

// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:rxdart/subjects.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
//     BehaviorSubject<ReceivedNotification>();

// final BehaviorSubject<String?> selectNotificationSubject =
//     BehaviorSubject<String?>();

// const MethodChannel platform =
//     MethodChannel('dexterx.dev/flutter_local_notifications_example');

// String? selectedNotificationPayload;

// class LocalNotificationService {
//   notificationInitialized() async {
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//         !kIsWeb && Platform.isLinux
//             ? null
//             : await flutterLocalNotificationsPlugin
//                 .getNotificationAppLaunchDetails();
//     if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
//       selectedNotificationPayload = notificationAppLaunchDetails!.payload;
//     }

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//             requestAlertPermission: false,
//             requestBadgePermission: false,
//             requestSoundPermission: false,
//             onDidReceiveLocalNotification: (
//               int id,
//               String? title,
//               String? body,
//               String? payload,
//             ) async {
//               didReceiveLocalNotificationSubject.add(
//                 ReceivedNotification(
//                   id: id,
//                   title: title,
//                   body: body,
//                   payload: payload,
//                 ),
//               );
//             });

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String? payload) async {
//       if (payload != null) {}
//       selectedNotificationPayload = payload;
//       selectNotificationSubject.add(payload);
//     });
//   }

//   Future<void> showNotification({
//     required String title,
//     required String body,
//     required String payload,
//     required int id,
//   }) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails('your channel id', 'your channel name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin
//         .show(id, title, body, platformChannelSpecifics, payload: payload);
//   }
// }

// class ReceivedNotification {
//   ReceivedNotification({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.payload,
//   });

//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
// }
