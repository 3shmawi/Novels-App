import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/utilities/enums/shared_pref.dart';

class FirebaseCollectionPath {
  static String id = CacheHelper.getData(key: SharedPrefKeys.id);

  static String user(String uid) => 'usr/$uid';

  static String category() => 'categories/';

  static String setNovelsAtAdmin(String novelId) => 'user/$id/novels/$novelId';

  static String setNovel(String novelId) => 'novels/$novelId';
}
