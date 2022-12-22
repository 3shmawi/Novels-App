import 'package:novels/models/comment.dart';
import 'package:novels/models/notification.dart';
import 'package:novels/models/novel.dart';
import 'package:novels/models/replies.dart';

import '../models/category.dart';
import '../models/rate.dart';
import '../models/user.dart';
import '../services/firestore_services.dart';
import '../utilities/firebase/collection_path.dart';

abstract class Controller {
  Stream<UserModel> getUserDataStream(String uid);

  Stream<List<CategoryModel>> getCategoriesStream();

  Stream<List<NovelModel>> getAdminNovelsStream();

  Stream<List<NovelModel>> getAllNovelsStream();

  Stream<List<NovelModel>> getCategoryNovelsStream(String category);

  Stream<List<RateModel>> getNovelRateStream(String novelId);

  Stream<List<String>> getNovelViewsStream(String novelId);

  Stream<List<CommentModel>> getNovelCommentsStream(String novelId);

  Stream<List<RepliesModel>> getNovelRepliesCommentStream(String novelId, String commentId);

  Stream<List<NotificationModel>> getNotificationsStream(String usrId);
}

class FireStoreDataBase implements Controller {
  final _service = FirestoreServices.instance;

  @override
  Stream<UserModel> getUserDataStream(String uid) => _service.documentsStream(
      path: FirebaseCollectionPath.user(uid),
      builder: (data, documentId) => UserModel.fromMap(data!, documentId));

  @override
  Stream<List<CategoryModel>> getCategoriesStream() =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.category(),
        builder: (data, documentId) => CategoryModel.fromMap(data!, documentId),
      );

  @override
  Stream<List<NovelModel>> getAdminNovelsStream() => _service.collectionsStream(
        path: FirebaseCollectionPath.getAdminNovels(),
        builder: (data, documentId) => NovelModel.fromMap(data!, documentId),
      );

  @override
  Stream<List<NovelModel>> getAllNovelsStream() => _service.collectionsStream(
        path: FirebaseCollectionPath.getAllNovels(),
        builder: (data, documentId) => NovelModel.fromMap(data!, documentId),
      );

  @override
  Stream<List<NovelModel>> getCategoryNovelsStream(String category) =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.getAllNovels(),
        builder: (data, documentId) => NovelModel.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('category', isEqualTo: category),
      );

  @override
  Stream<List<RateModel>> getNovelRateStream(String novelId) =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.getNovelRates(novelId),
        builder: (date, documentId) => RateModel.fromMap(date!, documentId),
      );

  @override
  Stream<List<String>> getNovelViewsStream(String novelId) =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.getNovelViews(novelId),
        builder: (date, documentId) => documentId,
      );

  @override
  Stream<List<CommentModel>> getNovelCommentsStream(String novelId) =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.getNovelComments(novelId),
        builder: (date, documentId) => CommentModel.fromMap(date!, documentId),
      );

  @override
  Stream<List<RepliesModel>> getNovelRepliesCommentStream(
          String novelId, String commentId) =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.getNovelReplyComments(novelId, commentId),
        builder: (date, documentId) => RepliesModel.fromMap(date!, documentId),
      );

  @override
  Stream<List<NotificationModel>> getNotificationsStream(
          String usrId) =>
      _service.collectionsStream(
        path: FirebaseCollectionPath.getNotifications(usrId),
        builder: (date, documentId) => NotificationModel.fromMap(date!, documentId),
      );
}
