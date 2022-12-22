import 'package:flutter/cupertino.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/usr/modules/notification/notifications_screen.dart';
import 'package:novels/usr/modules/open_photo/open_photo_screen.dart';

import '../../admin/layout/admin_layout.dart';
import '../../models/comment.dart';
import '../../usr/layout/layout_screen.dart';
import '../../usr/modules/auth/auth_screen.dart';
import '../../usr/modules/auth/reset_password/reset_password_screen.dart';
import '../../usr/modules/boarding/boarding_screen.dart';
import '../../usr/modules/comment/comments/comments_screen.dart';
import '../../usr/modules/comment/replies/replies_screen.dart';
import '../../usr/modules/novel_text/novel_text.dart';
import '../../usr/modules/open_a_novel/details_screen.dart';
import '../../usr/modules/search/search_screen.dart';
import '../routes/screens_route.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case ScreenRoute.onBoardingScreenRoute:
      return CupertinoPageRoute(
        builder: (_) => const OnBoardingScreen(),
        settings: settings,
      );


    case ScreenRoute.authScreenRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );


    case ScreenRoute.resetScreenRoute:
      return CupertinoPageRoute(
        builder: (_) => const ResetScreen(),
        settings: settings,
      );


    case ScreenRoute.openNovelScreenRoute:
      return CupertinoPageRoute(
        builder: (_) =>
            NovelDetailScreen(novel: settings.arguments as NovelModel),
        settings: settings,
      );


    case ScreenRoute.novelTextScreenRoute:
      return CupertinoPageRoute(
        builder: (_) =>
            NovelTextScreen(novel: settings.arguments as NovelModel),
        settings: settings,
      );


    case ScreenRoute.searchScreenRoute:
      return CupertinoPageRoute(
        builder: (_) =>
            SearchScreen(
              searchId: '',
            ),
        settings: settings,
      );


    case ScreenRoute.commentsScreenRoute:
      return CupertinoPageRoute(
        builder: (_) {
          var data = settings.arguments as CommentsScreen;
          return CommentsScreen(novel: data.novel, index: data.index,);
        },
        settings: settings,
      );


    case ScreenRoute.repliesScreenRoute:
      return CupertinoPageRoute(
        builder: (_) {
          var data = settings.arguments as RepliesScreen;

          return RepliesScreen(
            replyComment: data.replyComment,
            index: data.index,
          );
        },
        settings: settings,
      );


    case ScreenRoute.adminScreenRoute:
      return CupertinoPageRoute(
        builder: (_) => const AdminLayoutScreen(),
        settings: settings,
      );


    case ScreenRoute.notificationScreenRoute:
      return CupertinoPageRoute(
        builder: (_) => const NotificationScreen(),
        settings: settings,
      );


    case ScreenRoute.openPhotoScreenRoute:
      return CupertinoPageRoute(
        builder: (_) => OpenPhotoScreen(image: settings.arguments as String),
        settings: settings,
      );


    case ScreenRoute.landingScreenRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LayoutScreen(),
        settings: settings,
      );
  }
}
// novels1324
