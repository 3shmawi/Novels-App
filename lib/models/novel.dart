import 'package:novels/models/user.dart';

class NovelModel {
  final String id;
  final String imgUrl;
  final String title;
  final String authorName;
  final String aboutTheAuthor;
  final String overview;
  final String category;
  final String novelText;
  final UserModel userModel;
//usrID
  NovelModel({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.authorName,
    required this.aboutTheAuthor,
    required this.overview,
    required this.category,
    required this.novelText,
    required this.userModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'title': title,
      'authorName': authorName,
      'aboutTheAuthor': aboutTheAuthor,
      'overview': overview,
      'category': category,
      'novelText': novelText,
      'userModel': userModel.toMap(),
    };
  }

  factory NovelModel.fromMap(Map<String, dynamic> map, String documentId) {
    return NovelModel(
      id: documentId,
      imgUrl: map['imgUrl'] as String,
      title: map['title'] as String,
      authorName: map['authorName'] as String,
      aboutTheAuthor: map['aboutTheAuthor'] as String,
      overview: map['overview'] as String,
      category: map['category'] as String,
      novelText: map['novelText'] as String,
      userModel: UserModel.fromMap(map['userModel'],map['userModel']['id']),
    );
  }

}
