import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/services/fcm_notification.dart';
import 'package:novels/services/local_notification.dart';
import 'package:novels/utilities/app/my_app_screen.dart';
import 'package:novels/utilities/components/toast.dart';
import 'dart:async';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  showToast(
    text: "Handling a background message: ${message.messageId}",
    color: Colors.green,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await DioHelper.init();

  await FirebaseMessaging.instance.getInitialMessage();

  // await FirebaseMessaging.instance.setAutoInitEnabled(true);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen(
    (message) => LocalNotificationService.display(message),
  );

  FirebaseMessaging.onMessageOpenedApp.listen((message) {});

  runApp(const MyApp());
}
