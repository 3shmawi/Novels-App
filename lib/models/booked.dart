const String tableNovel = 'novels';

class NovelFields {
  static final List<String> values = [
    dbId,
    id,
    authorName,
    title,
    imgUrl,
    category,
  ];

  static const String dbId = 'dbId';

  static const String id = 'id';
  static const String category = 'category';
  static const String title = 'title';
  static const String imgUrl = 'imgUrl';
  static const String authorName = 'authorName';
}

class BookedModel {
  int? dbId;

  final String id;
  final String category;

  final String title;

  final String authorName;

  final String imgUrl;

  BookedModel({
    required this.id,
    required this.category,
    required this.title,
    required this.authorName,
    required this.imgUrl,
    this.dbId,
  });

  Map<String, dynamic> toMap() {
    return {
      'dbId': dbId,
      'id': id,
      'category': category,
      'title': title,
      'authorName': authorName,
      'imgUrl': imgUrl,
    };
  }

  @override
  factory BookedModel.fromMap(Map<String, dynamic> map) {
    return BookedModel(
      dbId: map['dbId'] as int,
      id: map['id'] as String,
      category: map['category'] as String,
      title: map['title'] as String,
      authorName: map['authorName'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }

  BookedModel copy({
    int? dbId,
  }) =>
      BookedModel(
        dbId: dbId ?? this.dbId,
        id: id,
        category: category,
        title: title,
        authorName: authorName,
        imgUrl: imgUrl,
      );
}
