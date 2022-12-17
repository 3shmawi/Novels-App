import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:novels/utilities/components/toast.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  String serverKey =
      'AAAAnINfF4Q:APA91bHzr6QiOSTy9K5xSKBc7TFXAIPaKgPkftT4X-QzFw9L6cKz7oeMkM-ze7heATqK_r-3muX-nHHOCpklY7QcOfue3T0GiGLMyrJTzrWX9pMQAIfsgLACTrS1XYgbqGwghzTILnUD';

  void sendPushMessage(String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAnINfF4Q:APA91bHzr6QiOSTy9K5xSKBc7TFXAIPaKgPkftT4X-QzFw9L6cKz7oeMkM-ze7heATqK_r-3muX-nHHOCpklY7QcOfue3T0GiGLMyrJTzrWX9pMQAIfsgLACTrS1XYgbqGwghzTILnUD',
        },
        body: jsonEncode(
          {
            "to": "cV-aIaN9SMOU_EL5Kxpgfu:APA91bG8F2gAeJZ_HLaf_43_JrdrvNcHbXedjeQFAdKSKxpYGZ2uXE0mg6J25O_yL7KOUdJA9pXfuz4CCWAq-eVAMJ7DHwmAy297MQ5Cw3Nv6C_7IHymbb25P--j9vjbmUO1_atoynwM",
            "notification": {
              "title": "you have received a message from Ashmawi",
              "body": "testing body from post man",
              "sound": "default"
            },
            "android": {
              "priority": "HIGH",
              "notification": {
                "notification_priority": "PRIORITY_MAX",
                "sound": "default",
                "default_sound": true,
                "default_vibrate_timings": true,
                "default_light_settings": true
              }
            },
            "data": {
              "type": "order",
              "id": "87",
              "click_action": "FLUTTER_NOTIFICATION_CLICK"
            }
          },
        ),
      );
      showToast(text: 'Success', color: Colors.black);
    } catch (e) {
      if (kDebugMode) {
        showToast(text: e.toString(), color: Colors.red);

      }
    }

  }


}

// void setUp()async{
//   // Set the background messaging handler early on, as a named top-level function
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   FirebaseMessaging.instance.getToken().then((value) {
//     if (kDebugMode) {
//       print(value);
//     }
//   });
//
//   if (!kIsWeb) {
//     await setupFlutterNotifications();
//   }
// }
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await setupFlutterNotifications();
//   showFlutterNotification(message);
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   if (kDebugMode) {
//     print('Handling a background message ${message.messageId}');
//   }
// }
//
// /// Create a [AndroidNotificationChannel] for heads up notifications
// late AndroidNotificationChannel channel;
//
// bool isFlutterLocalNotificationsInitialized = false;
//
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
