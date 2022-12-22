import 'package:novels/models/comment.dart';
import 'package:novels/models/novel.dart';

class NotificationModel {
  final String id;
  final String state;
  final String to;
  final String dateTime;
  final String title;
  final String name;
  final int index;
  final CommentModel commentModel;

  NotificationModel({
    required this.id,
    required this.state,
    required this.to,
    required this.dateTime,
    required this.title,
    required this.name,
    required this.index,
    required this.commentModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'state': state,
      'to': to,
      'dateTime': dateTime,
      'title': title,
      'name': name,
      'index': index,
      'commentModel': commentModel.toMap(),
    };
  }

  factory NotificationModel.fromMap(
      Map<String, dynamic> map, String documentId) {
    return NotificationModel(
      id: documentId,
      state: map['state'] as String,
      to: map['to'] as String,
      dateTime: map['dateTime'] as String,
      title: map['title'] as String,
      name: map['name'] as String,
      index: map['index'] as int,
      commentModel: CommentModel.fromMap(map['commentModel'], map['commentModel']['id']),
    );
  }
}
