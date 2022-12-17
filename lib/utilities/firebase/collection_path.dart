import 'package:novels/services/cache_helper_services.dart';
import 'package:novels/utilities/enums/shared_pref.dart';

class FirebaseCollectionPath {
  static String id = CacheHelper.getData(key: SharedPrefKeys.id);

  static String user(String uid) => 'usr/$uid';

  static String setUserSaved(String novelId) => 'usr/$id/saved/$novelId';

  static String getUserSaved() => 'usr/$id/saved/';

  static String deleteUserSaved(String novelId) => 'usr/$id/saved/$novelId';

  static String category() => 'categories/';

  static String setNovelsAtAdmin(String novelId) => 'usr/$id/novels/$novelId';

  static String setNovel(String novelId) => 'novels/$novelId';

  static String getAdminNovels() => 'usr/$id/novels/';

  static String getAllNovels() => 'novels/';

  static String setNovelRate(String novelId) => 'novels/$novelId/rates/$id';

  static String getNovelRates(String novelId) => 'novels/$novelId/rates/';

  static String setNovelView(String novelId) => 'novels/$novelId/views/$id';

  static String getNovelViews(String novelId) => 'novels/$novelId/views/';

  static String setNovelComment(String novelId,String newId) => 'novels/$novelId/comments/$newId';

  static String getNovelComments(String novelId) => 'novels/$novelId/comments/';

  static String setNovelReplyComment({required String novelId,required String newId,required String commentId}) => 'novels/$novelId/comments/$commentId/replies/$newId';

  static String getNovelReplyComments(String novelId,String commentId) => 'novels/$novelId/comments/$commentId/replies/';
}
