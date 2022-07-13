// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get_storage/get_storage.dart';

// class FirebaseMessagingServiceAndAnalytics {
//   final LocalNotificationService _notificationService;

//   FirebaseMessagingServiceAndAnalytics(this._notificationService);
//   GetStorage AsyncStorage = GetStorage();

//   Future<void> initialize() async {
//     AsyncStorage.write("firebase_token", "token");
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       badge: true,
//       sound: true,
//       alert: true,
//     );
//     FirebaseAnalytics analytics = FirebaseAnalytics.instance;

//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     await FirebaseMessaging.instance.subscribeToTopic('important_news');

//     // await FirebaseMessaging.instance.
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     getDeviceFirebaseToken();
//     _onMessage();
//     _onMessageOpenedApp();
//   }

//   getDeviceFirebaseToken() async {
//     final token = await FirebaseMessaging.instance.getToken();

//     //print("token firebase $token");
//     AsyncStorage.write("firebase_token", token);
//   }

//   _onMessage() {
//     FirebaseMessaging.onMessage.listen((message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
// // message.data
//       if (notification != null && android != null) {
//         _notificationService.showNotification(
//           title: notification.title!.toString(),
//           body: notification.body!.toString(),
//           payload: message.data['route'] ?? '',
//           id: android.hashCode,
//         );
//       }
//     });
//   }

//   _onMessageOpenedApp() {
//     FirebaseMessaging.onMessageOpenedApp.listen(_goToPageAfterMessage);
//     // FirebaseMessaging.onBackgroundMessage(
//     //     (message) => _goToPageAfterMessage(message));
//   }

//   _goToPageAfterMessage(message) {
//     final String route = message.data['route'] ?? '';
//     if (route.isNotEmpty) {
//       // Routes.navigatorKey?.currentState?.pushNamed(route);
//     }
//   }
// }
