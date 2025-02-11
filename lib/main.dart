import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/pages/Add_post.dart';
import 'package:test_logo/pages/Applied_Employee_List.dart';
import 'package:test_logo/pages/Applied_Page.dart';
import 'package:test_logo/pages/Create_Profile_Industry.dart';
import 'package:test_logo/pages/Edit_Profile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test_logo/pages/Edit_Profile_Employee.dart';
import 'package:test_logo/pages/Edit_Profile_Industry.dart';
import 'package:test_logo/pages/Employee_Homefield.dart';
import 'package:test_logo/pages/Employee_Join.dart';
import 'package:test_logo/pages/Employee_Network.dart';
import 'package:test_logo/pages/Employee_Notification.dart';
import 'package:test_logo/pages/Employee_settings.dart';
import 'package:test_logo/pages/Forget_Password.dart';
import 'package:test_logo/pages/Handler/notification.dart';
import 'package:test_logo/pages/Hire_Or_Job.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:test_logo/pages/Html_Test.dart';
import 'package:test_logo/pages/Image%20picker.dart';
import 'package:test_logo/pages/Industry_Homefield_Search.dart';
import 'package:test_logo/pages/Industry_Homefield.dart';
import 'package:test_logo/pages/Industry_Notification.dart';
import 'package:test_logo/pages/Industry_Post_Collection.dart';
import 'package:test_logo/pages/Industry_settings.dart';
import 'package:test_logo/pages/New_Password.dart';
import 'package:test_logo/pages/NotificationTest.dart';
import 'package:test_logo/pages/OnLoad.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_logo/pages/Login_Employee2.dart';
import 'package:test_logo/pages/Profile_Employee.dart';
import 'package:test_logo/pages/Profile_Industry.dart';
import 'package:test_logo/pages/Reset_Password.dart';
import 'package:test_logo/pages/Setting_Page.dart';
import 'package:test_logo/pages/Sms_Demo.dart';
import 'package:test_logo/pages/OnLoad.dart';
import 'package:test_logo/pages/Create_Profile_Employee.dart';
import 'package:test_logo/pages/Employee_Signup.dart';
import 'package:test_logo/pages/Industry_Signup.dart';
import 'package:test_logo/pages/Login_Option.dart';
import 'package:test_logo/pages/OnLoad.dart';
import 'package:test_logo/pages/Test.dart';
import 'package:test_logo/pages/TestPhone.dart';

import 'package:test_logo/pages/TestVerify.dart';
import 'package:test_logo/pages/User_Manual.dart';
import 'package:test_logo/pages/design_demo.dart';
import 'comtroller/auth/auth_controller.dart';
import 'pages/Create_Profile.dart';
import 'pages/CustomWidget/Button.dart';
import 'pages/Employee_signup2.dart';
import 'pages/Home_Industry2.dart';
import 'pages/Login_Employee.dart';
import 'pages/Login_Industry.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final GlobalKey<NavigatorState> navigatorkey = new GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel('high_importance_channel', 'High Importance Notifications',importance: Importance.high);

void main() async {
  final authcontroller = Get.put(AuthController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value) {
    print("getToken : $value");
    authcontroller.tokenforsms.value = value!.toString();
    print("token saved succesfully");

  });


  await AppNotificationHandler.firebaseNotificationSetup();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (Platform.isAndroid) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>(

    )!.createNotificationChannel(channel);
  }
  if (Platform.isIOS) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()!
        .requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,

    sound: true,
  );

// initializeService();
  await AppNotificationHandler.firebaseNotificationSetup();

  runApp(MyApp());
}

// Future<void>  _firebaseMessagingBackgroundHandler(RemoteMessage msg) async{
//   await Firebase.initializeApp();
//   print("_firebaseMessagingBackgroundHandler: $msg");
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {

    // TODO: implement initState
    super.initState();

    try {
      FirebaseMessaging.onMessage.listen(
            (RemoteMessage message) {
          RemoteNotification? notification = message.notification;
          AndroidNotification? android = message.notification?.android;
          if (notification != null && android != null) {

            flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    // sound:const UriAndroidNotificationSound("assets/tunes/msg_notification_sound.mp3"),
                    icon: 'mipmap/ic_launcher'),
              ),
            );
          }

        },
      );
    } catch (e) {
      debugPrint("Show Notification error == $e");
    }
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorkey,
      home: OnLoad(),

      routes: {'/notification': ((context) => const NotificationTest())},
    );
  }
}
