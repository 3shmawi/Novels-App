import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novels/usr/modules/comment/replies/cubit/replies_cubit.dart';

import '../../admin/layout/cubit/admin_layout_cubit.dart';
import '../../admin/modules/upload/components/cubit/right_cubit.dart';
import '../../admin/modules/upload/cubit/new_novel_cubit.dart';
import '../../services/cache_helper_services.dart';
import '../../usr/layout/cubit/layout_cubit.dart';
import '../../usr/modules/auth/cubit/auth_cubit.dart';
import '../../usr/modules/comment/comments/cubit/comment_cubit.dart';
import '../../usr/modules/favorites/cubit/saved_cubit.dart';
import '../../usr/modules/notification/cubit/notification_cubit.dart';
import '../../usr/modules/novel_text/cubit/text_cubit.dart';
import '../../usr/modules/search/cubit/search_cubit.dart';
import '../components/rate/cubit/rate_cubit.dart';
import '../components/view/cubit/view_cubit.dart';
import '../enums/shared_pref.dart';
import '../on_generate/route_settings.dart';
import '../routes/screens_route.dart';
import '../shared/themes/dark_theme.dart';
import '../shared/themes/light_theme.dart';

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
        BlocProvider(create: (context) => RepliesCubit()),
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
