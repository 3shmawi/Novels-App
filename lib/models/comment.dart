class CommentModel {
  final String id;
  final String imgUrl;
  final String title;
  final String name;
  final String dateTime;

  CommentModel({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.name,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'title': title,
      'name': name,
      'dateTime': dateTime,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CommentModel(
      id: documentId,
      imgUrl: map['imgUrl'] as String,
      title: map['title'] as String,
      name: map['name'] as String,
      dateTime: map['dateTime'] as String,
    );
  }
}
