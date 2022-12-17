import 'package:novels/models/novel.dart';

const String tableNovel = 'novels';

class NovelFields {
  static final List<String> values = [
    dbId,
    id,
    authorName,
    category,
    title,
    aboutTheAuthor,
    novelText,
    imgUrl,
    overview,
  ];

  static const String dbId = 'dbId';

  static const String id = 'id';
  static const String title = 'title';
  static const String aboutTheAuthor = 'aboutTheAuthor';
  static const String imgUrl = 'imgUrl';
  static const String authorName = 'authorName';
  static const String category = 'category';
  static const String overview = 'overview';
  static const String novelText = 'novelText';
}

class BookedModel extends NovelModel {
  int? dbId;

  BookedModel({

    required String id,
    required String authorName,
    required String category,
    required String imgUrl,
    required String title,
    required String aboutTheAuthor,
    required String novelText,
    required String overview,
    this.dbId,
  }) : super(
          id: id,
          authorName: authorName,
          category: category,
          imgUrl: imgUrl,
          title: title,
          aboutTheAuthor: aboutTheAuthor,
          novelText: novelText,
          overview: overview,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'authorName': authorName,
      'imgUrl': imgUrl,
      'aboutTheAuthor': aboutTheAuthor,
      'novelText': novelText,
      'category': category,
      'overview': overview,
      'dbId': dbId,
    };
  }

  @override
  factory BookedModel.fromMapWithoutId(Map<String, dynamic> map) {
    return BookedModel(
      id: map['id'] as String,
      title: map['title'] as String,
      authorName: map['authorName'] as String,
      imgUrl: map['imgUrl'] as String,
      aboutTheAuthor: map['aboutTheAuthor'] as String,
      novelText: map['novelText'] as String,
      category: map['category'] as String,
      overview: map['overview'] as String,
      dbId: map['dbId'] as int,
    );
  }

  BookedModel copy({
    String? id,
    String? title,
    String? category,
    String? imgUrl,
    String? aboutTheAuthor,
    String? authorName,
    String? novelText,
    String? overview,
    int? dbId,
  }) =>
      BookedModel(
        dbId: dbId ?? this.dbId,
        title: title ?? this.title,
        aboutTheAuthor: aboutTheAuthor ?? this.aboutTheAuthor,
        category: category ?? this.category,
        imgUrl: imgUrl ?? this.imgUrl,
        authorName: authorName ?? this.authorName,
        id: id ?? this.id,
        novelText: novelText ?? this.novelText,
        overview: overview ?? this.overview,
      );
}
