import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/admin/modules/upload/components/cubit/right_cubit.dart';
import 'package:novels/admin/modules/upload/cubit/new_novel_cubit.dart';
import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/services/fcm_notification.dart';
import 'package:novels/services/local_notification.dart';
import 'package:novels/usr/layout/cubit/layout_cubit.dart';
import 'package:novels/usr/modules/auth/cubit/auth_cubit.dart';
import 'package:novels/usr/modules/comments/cubit/comment_cubit.dart';
import 'package:novels/usr/modules/favorites/cubit/saved_cubit.dart';
import 'package:novels/usr/modules/notification/cubit/notification_cubit.dart';
import 'package:novels/usr/modules/novel_text/cubit/text_cubit.dart';
import 'package:novels/usr/modules/search/cubit/search_cubit.dart';
import 'package:novels/utilities/components/rate/cubit/rate_cubit.dart';
import 'package:novels/utilities/components/toast.dart';
import 'package:novels/utilities/components/view/cubit/view_cubit.dart';
import 'package:novels/utilities/enums/shared_pref.dart';
import 'package:novels/utilities/on_generate/route_settings.dart';
import 'package:novels/utilities/routes/screens_route.dart';
import 'package:novels/utilities/shared/themes/dark_theme.dart';
import 'package:novels/utilities/shared/themes/light_theme.dart';
import 'admin/layout/cubit/admin_layout_cubit.dart';
import 'dart:async';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  showToast(
      text: "Handling a background message: ${message.messageId}",
      color: Colors.green);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await FirebaseMessaging.instance.getInitialMessage();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
 LocalNotificationService.initialize();
  FirebaseMessaging.onMessage.listen((message) {

    LocalNotificationService.display(message);
    showToast(text: message.notification!.title.toString(), color: Colors.black);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    showToast(text: message.notification!.title.toString(), color: Colors.green);
  });

  FCMService().sendPushMessage();
  runApp(const MyApp());
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String userId = CacheHelper.getData(key: SharedPrefKeys.id) ?? '';
    bool isBoard = CacheHelper.getData(key: SharedPrefKeys.onBoarding) ?? false;
    if (kDebugMode) {
      print(userId);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => AdminLayoutCubit()),
        BlocProvider(create: (context) => NewNovelCubit()),
        BlocProvider(create: (context) => RightCubit()),
        BlocProvider(create: (context) => RateCubit()),
        BlocProvider(create: (context) => ViewCubit()),
        BlocProvider(create: (context) => TextCubit()),
        BlocProvider(create: (context) => CommentCubit()),
        BlocProvider(create: (context) => NotificationCubit()),
        BlocProvider(
            create: (context) =>
                LocalDatabaseCubit()..getAllDataFromBookedDataBase()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: !isBoard
            ? ScreenRoute.onBoardingScreenRoute
            : userId == ''
                ? ScreenRoute.authScreenRoute
                : ScreenRoute.landingScreenRoute,
        onGenerateRoute: onGenerate,
      ),
    );
  }
}
