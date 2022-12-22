import 'package:novels/models/comment.dart';
import 'package:novels/models/user.dart';

class RepliesModel {
  final String id;
  final String title;
  final String dateTime;
  final UserModel userModel;
  final CommentModel commentModel;

  RepliesModel({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.userModel,
    required this.commentModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime,
      'userModel': userModel.toMap(),
      'commentModel': commentModel.toMap(),
    };
  }

  factory RepliesModel.fromMap(Map<String, dynamic> map, String documentId) {
    return RepliesModel(
      id: documentId,
      title: map['title'] as String,
      dateTime: map['dateTime'] as String,
      userModel: UserModel.fromMap(map['userModel'], map['userModel']['id']),
      commentModel: CommentModel.fromMap(map['commentModel'], map['commentModel']['id']),
    );
  }
}
