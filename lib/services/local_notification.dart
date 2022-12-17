import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static void initialize() {
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async{
    try {
      if (kDebugMode) {
        print("In Notification method");
      }
      // int id = DateTime.now().microsecondsSinceEpoch ~/1000000;
      Random random = Random();
      int id = random.nextInt(1000);
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            'main_channel',
            'Main channel notifications',
            importance: Importance.max,
            priority: Priority.high,
          )

      );
      if (kDebugMode) {
        print("my id is ${id.toString()}");
      }
      await _flutterLocalNotificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.title,
        notificationDetails,);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error>>>$e');
      }
    }
  }



  // Future<void> setupFlutterNotifications() async {
  //   if (isFlutterLocalNotificationsInitialized) {
  //     return;
  //   }
  //   channel = const AndroidNotificationChannel(
  //     'high_importance_channel', // id
  //     'High Importance Notifications', // title
  //     description:
  //     'This channel is used for important notifications.', // description
  //     importance: Importance.high,
  //   );
  //
  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //
  //   /// Create an Android Notification Channel.
  //   ///
  //   /// We use this channel in the `AndroidManifest.xml` file to override the
  //   /// default FCM channel to enable heads up notifications.
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  //
  //   /// Update the iOS foreground notification presentation options to allow
  //   /// heads up notifications.
  //   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  //   isFlutterLocalNotificationsInitialized = true;
  // }
  //
  // void showFlutterNotification(RemoteMessage message) {
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notification != null && android != null && !kIsWeb) {
  //     flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           channelDescription: channel.description,
  //           // TODO add a proper drawable resource to android, for now using
  //           //      one that already exists in example app.
  //           icon: 'launch_background',
  //         ),
  //       ),
  //     );
  //   }
  // }
  //
  // /// Initialize the [FlutterLocalNotificationsPlugin] package.
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
}