// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AppNotificationHandler {

  static Future<void> firebaseNotificationSetup() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      AndroidNotification? android = message.notification?.android;

      if (notification != null) {
      }
    }).onError((e) {

    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    if (message.notification != null) {
    }
  }



  ///call when app in fore ground
  static void showMsgHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      AndroidNotification? android = message.notification?.android;
      // print(
      //     'Notification Call :${notification?.apple}${notification!.body}${notification.title}');
      if (notification != null) {

      }
    }).onError((e) {
      // print('Error Notification : ....$e');
    });
  }
}
